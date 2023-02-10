import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Signin': ParameterData.none(),
  'DASHBOARD': ParameterData.none(),
  'AddOrganiation': (data) async => ParameterData(
        allParams: {
          'orgp': getParameter<DocumentReference>(data, 'orgp'),
          'orgcount': await getDocumentParameter<OrganisationsRecord>(
              data, 'orgcount', OrganisationsRecord.serializer),
        },
      ),
  'Signup': ParameterData.none(),
  'OrganisationnDetails': (data) async => ParameterData(
        allParams: {
          'orgdetails': await getDocumentParameter<OrganisationsRecord>(
              data, 'orgdetails', OrganisationsRecord.serializer),
          'orgref': getParameter<DocumentReference>(data, 'orgref'),
        },
      ),
  'JobDetails': (data) async => ParameterData(
        allParams: {
          'jobdetails': await getDocumentParameter<JobsRecord>(
              data, 'jobdetails', JobsRecord.serializer),
          'jobreference': getParameter<DocumentReference>(data, 'jobreference'),
        },
      ),
  'AllJobs': ParameterData.none(),
  'AddjobCopy': (data) async => ParameterData(
        allParams: {
          'orgpage': await getDocumentParameter<OrganisationsRecord>(
              data, 'orgpage', OrganisationsRecord.serializer),
          'orgpageref': getParameter<DocumentReference>(data, 'orgpageref'),
        },
      ),
  'Organisations': (data) async => ParameterData(
        allParams: {
          'passWorkerReference':
              getParameter<DocumentReference>(data, 'passWorkerReference'),
        },
      ),
  'newAddScout': (data) async => ParameterData(
        allParams: {
          'captaindetailpage': await getDocumentParameter<CaptainsRecord>(
              data, 'captaindetailpage', CaptainsRecord.serializer),
          'workerdetailpage': await getDocumentParameter<WorkersRecord>(
              data, 'workerdetailpage', WorkersRecord.serializer),
          'captainPhone': getParameter<String>(data, 'captainPhone'),
        },
      ),
  'editScoutDetails': (data) async => ParameterData(
        allParams: {
          'captaindetailpage': await getDocumentParameter<CaptainsRecord>(
              data, 'captaindetailpage', CaptainsRecord.serializer),
        },
      ),
  'ScoutDetails': (data) async => ParameterData(
        allParams: {
          'scoutdetailpage': await getDocumentParameter<CaptainsRecord>(
              data, 'scoutdetailpage', CaptainsRecord.serializer),
          'workerdetailpage': await getDocumentParameter<CaptainsRecord>(
              data, 'workerdetailpage', CaptainsRecord.serializer),
          'cappicc': await getDocumentParameter<CaptainsRecord>(
              data, 'cappicc', CaptainsRecord.serializer),
        },
      ),
  'CaptainDetails': (data) async => ParameterData(
        allParams: {
          'captaindetailpage': await getDocumentParameter<CaptainsRecord>(
              data, 'captaindetailpage', CaptainsRecord.serializer),
          'workerdetailpage': await getDocumentParameter<CaptainsRecord>(
              data, 'workerdetailpage', CaptainsRecord.serializer),
          'cappicc': await getDocumentParameter<CaptainsRecord>(
              data, 'cappicc', CaptainsRecord.serializer),
        },
      ),
  'WorkerDetailsPage': (data) async => ParameterData(
        allParams: {
          'workerdetailpage': await getDocumentParameter<WorkersRecord>(
              data, 'workerdetailpage', WorkersRecord.serializer),
          'phoneNum': getParameter<String>(data, 'phoneNum'),
        },
      ),
  'EditOrganization': (data) async => ParameterData(
        allParams: {
          'orgp': getParameter<DocumentReference>(data, 'orgp'),
          'orgdoc': await getDocumentParameter<OrganisationsRecord>(
              data, 'orgdoc', OrganisationsRecord.serializer),
        },
      ),
  'authentication': (data) async => ParameterData(
        allParams: {
          'num': getParameter<String>(data, 'num'),
          'captaindetails': await getDocumentParameter<CaptainsRecord>(
              data, 'captaindetails', CaptainsRecord.serializer),
          'scoutdetails': await getDocumentParameter<CaptainsRecord>(
              data, 'scoutdetails', CaptainsRecord.serializer),
          'workerdetails': await getDocumentParameter<WorkersRecord>(
              data, 'workerdetails', WorkersRecord.serializer),
        },
      ),
  'editWorkerDetails': (data) async => ParameterData(
        allParams: {
          'workerdetailpage': await getDocumentParameter<WorkersRecord>(
              data, 'workerdetailpage', WorkersRecord.serializer),
        },
      ),
  'newAddWorker': (data) async => ParameterData(
        allParams: {
          'captaindetailpage': await getDocumentParameter<CaptainsRecord>(
              data, 'captaindetailpage', CaptainsRecord.serializer),
          'workerdetailpage': await getDocumentParameter<WorkersRecord>(
              data, 'workerdetailpage', WorkersRecord.serializer),
          'workerPhone': getParameter<String>(data, 'workerPhone'),
        },
      ),
  'editCaptainDetails': (data) async => ParameterData(
        allParams: {
          'captaindetailpage': await getDocumentParameter<CaptainsRecord>(
              data, 'captaindetailpage', CaptainsRecord.serializer),
        },
      ),
  'EditAddSkills': (data) async => ParameterData(
        allParams: {
          'workerSkill': getParameter<String>(data, 'workerSkill'),
        },
      ),
  'AddSkills': (data) async => ParameterData(
        allParams: {
          'phone': getParameter<String>(data, 'phone'),
        },
      ),
  'newAddCaptain': (data) async => ParameterData(
        allParams: {
          'captaindetailpage': await getDocumentParameter<CaptainsRecord>(
              data, 'captaindetailpage', CaptainsRecord.serializer),
          'workerdetailpage': await getDocumentParameter<UsersRecord>(
              data, 'workerdetailpage', UsersRecord.serializer),
          'captainPhone': getParameter<String>(data, 'captainPhone'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
