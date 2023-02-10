import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  JanasktiDashboardDevFirebaseUser? initialUser;
  JanasktiDashboardDevFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(JanasktiDashboardDevFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? DashboardWidget() : SigninWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? DashboardWidget() : SigninWidget(),
          routes: [
            FFRoute(
              name: 'Signin',
              path: 'signin',
              builder: (context, params) => SigninWidget(),
            ),
            FFRoute(
              name: 'DASHBOARD',
              path: 'dashboard',
              builder: (context, params) => DashboardWidget(),
            ),
            FFRoute(
              name: 'AddOrganiation',
              path: 'addOrganiation',
              asyncParams: {
                'orgcount':
                    getDoc(['Organisations'], OrganisationsRecord.serializer),
              },
              builder: (context, params) => AddOrganiationWidget(
                orgp: params.getParam('orgp', ParamType.DocumentReference,
                    false, ['Organisations']),
                orgcount: params.getParam('orgcount', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'Signup',
              path: 'signup',
              builder: (context, params) => SignupWidget(),
            ),
            FFRoute(
              name: 'OrganisationnDetails',
              path: 'organisationnDetails',
              asyncParams: {
                'orgdetails':
                    getDoc(['Organisations'], OrganisationsRecord.serializer),
              },
              builder: (context, params) => OrganisationnDetailsWidget(
                orgdetails: params.getParam('orgdetails', ParamType.Document),
                orgref: params.getParam('orgref', ParamType.DocumentReference,
                    false, ['Organisations']),
              ),
            ),
            FFRoute(
              name: 'JobDetails',
              path: 'jobDetails',
              asyncParams: {
                'jobdetails':
                    getDoc(['Organisations', 'Jobs'], JobsRecord.serializer),
              },
              builder: (context, params) => JobDetailsWidget(
                jobdetails: params.getParam('jobdetails', ParamType.Document),
                jobreference: params.getParam(
                    'jobreference',
                    ParamType.DocumentReference,
                    false,
                    ['Organisations', 'Jobs']),
              ),
            ),
            FFRoute(
              name: 'AllJobs',
              path: 'allJobs',
              builder: (context, params) => AllJobsWidget(),
            ),
            FFRoute(
              name: 'AddjobCopy',
              path: 'addjob',
              asyncParams: {
                'orgpage':
                    getDoc(['Organisations'], OrganisationsRecord.serializer),
              },
              builder: (context, params) => AddjobCopyWidget(
                orgpage: params.getParam('orgpage', ParamType.Document),
                orgpageref: params.getParam('orgpageref',
                    ParamType.DocumentReference, false, ['Organisations']),
              ),
            ),
            FFRoute(
              name: 'Organisations',
              path: 'organisations',
              builder: (context, params) => OrganisationsWidget(
                passWorkerReference: params.getParam('passWorkerReference',
                    ParamType.DocumentReference, false, ['Workers']),
              ),
            ),
            FFRoute(
              name: 'newAddScout',
              path: 'newAddScout',
              asyncParams: {
                'captaindetailpage':
                    getDoc(['Captains'], CaptainsRecord.serializer),
                'workerdetailpage':
                    getDoc(['Workers'], WorkersRecord.serializer),
              },
              builder: (context, params) => NewAddScoutWidget(
                captaindetailpage:
                    params.getParam('captaindetailpage', ParamType.Document),
                workerdetailpage:
                    params.getParam('workerdetailpage', ParamType.Document),
                captainPhone: params.getParam('captainPhone', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'editScoutDetails',
              path: 'editScoutDetails',
              asyncParams: {
                'captaindetailpage':
                    getDoc(['Captains'], CaptainsRecord.serializer),
              },
              builder: (context, params) => EditScoutDetailsWidget(
                captaindetailpage:
                    params.getParam('captaindetailpage', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ScoutDetails',
              path: 'scoutDetai',
              asyncParams: {
                'scoutdetailpage':
                    getDoc(['Captains'], CaptainsRecord.serializer),
                'workerdetailpage':
                    getDoc(['Captains'], CaptainsRecord.serializer),
                'cappicc': getDoc(['Captains'], CaptainsRecord.serializer),
              },
              builder: (context, params) => ScoutDetailsWidget(
                scoutdetailpage:
                    params.getParam('scoutdetailpage', ParamType.Document),
                workerdetailpage:
                    params.getParam('workerdetailpage', ParamType.Document),
                cappicc: params.getParam('cappicc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CaptainDetails',
              path: 'captainDetails',
              asyncParams: {
                'captaindetailpage':
                    getDoc(['Captains'], CaptainsRecord.serializer),
                'workerdetailpage':
                    getDoc(['Captains'], CaptainsRecord.serializer),
                'cappicc': getDoc(['Captains'], CaptainsRecord.serializer),
              },
              builder: (context, params) => CaptainDetailsWidget(
                captaindetailpage:
                    params.getParam('captaindetailpage', ParamType.Document),
                workerdetailpage:
                    params.getParam('workerdetailpage', ParamType.Document),
                cappicc: params.getParam('cappicc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'WorkerDetailsPage',
              path: 'workerDetailsPage',
              asyncParams: {
                'workerdetailpage':
                    getDoc(['Workers'], WorkersRecord.serializer),
              },
              builder: (context, params) => WorkerDetailsPageWidget(
                workerdetailpage:
                    params.getParam('workerdetailpage', ParamType.Document),
                phoneNum: params.getParam('phoneNum', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'EditOrganization',
              path: 'editOrganization',
              asyncParams: {
                'orgdoc':
                    getDoc(['Organisations'], OrganisationsRecord.serializer),
              },
              builder: (context, params) => EditOrganizationWidget(
                orgp: params.getParam('orgp', ParamType.DocumentReference,
                    false, ['Organisations']),
                orgdoc: params.getParam('orgdoc', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'authentication',
              path: 'authentication',
              asyncParams: {
                'captaindetails':
                    getDoc(['Captains'], CaptainsRecord.serializer),
                'scoutdetails': getDoc(['Captains'], CaptainsRecord.serializer),
                'workerdetails': getDoc(['Workers'], WorkersRecord.serializer),
              },
              builder: (context, params) => AuthenticationWidget(
                num: params.getParam('num', ParamType.String),
                captaindetails:
                    params.getParam('captaindetails', ParamType.Document),
                scoutdetails:
                    params.getParam('scoutdetails', ParamType.Document),
                workerdetails:
                    params.getParam('workerdetails', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'editWorkerDetails',
              path: 'editWorkerDetails',
              asyncParams: {
                'workerdetailpage':
                    getDoc(['Workers'], WorkersRecord.serializer),
              },
              builder: (context, params) => EditWorkerDetailsWidget(
                workerdetailpage:
                    params.getParam('workerdetailpage', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'newAddWorker',
              path: 'newAddWorker',
              asyncParams: {
                'captaindetailpage':
                    getDoc(['Captains'], CaptainsRecord.serializer),
                'workerdetailpage':
                    getDoc(['Workers'], WorkersRecord.serializer),
              },
              builder: (context, params) => NewAddWorkerWidget(
                captaindetailpage:
                    params.getParam('captaindetailpage', ParamType.Document),
                workerdetailpage:
                    params.getParam('workerdetailpage', ParamType.Document),
                workerPhone: params.getParam('workerPhone', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'editCaptainDetails',
              path: 'editCaptainDetails',
              asyncParams: {
                'captaindetailpage':
                    getDoc(['Captains'], CaptainsRecord.serializer),
              },
              builder: (context, params) => EditCaptainDetailsWidget(
                captaindetailpage:
                    params.getParam('captaindetailpage', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EditAddSkills',
              path: 'EditAddSkills',
              builder: (context, params) => EditAddSkillsWidget(
                workerSkill: params.getParam('workerSkill', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AddSkills',
              path: 'addSkills',
              builder: (context, params) => AddSkillsWidget(
                phone: params.getParam('phone', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'newAddCaptain',
              path: 'newAddCaptain',
              asyncParams: {
                'captaindetailpage':
                    getDoc(['Captains'], CaptainsRecord.serializer),
                'workerdetailpage': getDoc(['users'], UsersRecord.serializer),
              },
              builder: (context, params) => NewAddCaptainWidget(
                captaindetailpage:
                    params.getParam('captaindetailpage', ParamType.Document),
                workerdetailpage:
                    params.getParam('workerdetailpage', ParamType.Document),
                captainPhone: params.getParam('captainPhone', ParamType.String),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/signin';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
