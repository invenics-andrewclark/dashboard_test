import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'authentication_model.dart';
export 'authentication_model.dart';

class AuthenticationWidget extends StatefulWidget {
  const AuthenticationWidget({
    Key? key,
    this.num,
    this.captaindetails,
    this.scoutdetails,
    this.workerdetails,
  }) : super(key: key);

  final String? num;
  final CaptainsRecord? captaindetails;
  final CaptainsRecord? scoutdetails;
  final WorkersRecord? workerdetails;

  @override
  _AuthenticationWidgetState createState() => _AuthenticationWidgetState();
}

class _AuthenticationWidgetState extends State<AuthenticationWidget> {
  late AuthenticationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthenticationModel());

    _model.textController1 = TextEditingController();
    _model.textController2 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(790, 57, 790, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/images/Frame_Jansakti1.png',
                                width: 70,
                                height: 112,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.91, 0, 0, 0),
                                child: Text(
                                  'Jansakti',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(710, 55, 710, 100),
                      child: Container(
                        width: 500,
                        height: 708,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Color(0x00000040),
                              offset: Offset(4, 4),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'OTP Verification',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Text(
                                        'Enter your phone number',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (FFAppState().sendOTP == null ||
                                        FFAppState().sendOTP == '')
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
                                          child: TextFormField(
                                            controller: _model.textController1,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Enter your phone number',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF0B0000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF0B0000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                            keyboardType: TextInputType.phone,
                                            validator: _model
                                                .textController1Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (FFAppState().sendOTP != null &&
                                  FFAppState().sendOTP != '')
                                Container(
                                  width: double.infinity,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 0, 0),
                                            child: Text(
                                              'Enter the OTP',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 20, 0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController2,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'Enter OTP',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText2,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFF0B0000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFF0B0000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .textController2Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Didn\'t receive code?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Text(
                                              'Resend',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .hyperlink,
                                                        fontSize: 14,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('DASHBOARD');

                                        FFAppState().update(() {
                                          FFAppState().sendOTP = '';
                                        });
                                        FFAppState().update(() {
                                          FFAppState().AddCaptain = '';
                                        });
                                        FFAppState().update(() {
                                          FFAppState().AddScout = '';
                                        });
                                        FFAppState().update(() {
                                          FFAppState().AddWorker = '';
                                        });
                                      },
                                      text: 'Cancel',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    if (FFAppState().sendOTP == null ||
                                        FFAppState().sendOTP == '')
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          _model.captainScoutcheck =
                                              await actions.checkExists(
                                            _model.textController1.text,
                                            'Captains',
                                          );
                                          _shouldSetState = true;
                                          if (_model.captainScoutcheck!) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Alert'),
                                                  content: Text(
                                                      'Phone Number already exist'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            _model.workersCheck =
                                                await actions.checkExists(
                                              _model.textController1.text,
                                              'Workers',
                                            );
                                            _shouldSetState = true;
                                            if (_model.workersCheck!) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Alert'),
                                                    content: Text(
                                                        'Phone Number already exist'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              final phoneNumberVal =
                                                  _model.textController1.text;
                                              if (phoneNumberVal == null ||
                                                  phoneNumberVal.isEmpty ||
                                                  !phoneNumberVal
                                                      .startsWith('+')) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        'Phone Number is required and has to start with +.'),
                                                  ),
                                                );
                                                return;
                                              }
                                              await beginPhoneAuth(
                                                context: context,
                                                phoneNumber: phoneNumberVal,
                                                onCodeSent: () async {
                                                  context.goNamedAuth(
                                                    'authentication',
                                                    mounted,
                                                    queryParams: {
                                                      'num': serializeParam(
                                                        _model.textController1
                                                            .text,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    ignoreRedirect: true,
                                                  );
                                                },
                                              );

                                              setState(() {
                                                _model.textController2?.clear();
                                              });
                                              FFAppState().update(() {
                                                FFAppState().sendOTP = 'OTP';
                                              });
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }

                                          if (_shouldSetState) setState(() {});
                                        },
                                        text: 'Send OTP',
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    if (FFAppState().sendOTP != null &&
                                        FFAppState().sendOTP != '')
                                      FFButtonWidget(
                                        onPressed: () async {
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          final smsCodeVal =
                                              _model.textController2.text;
                                          if (smsCodeVal == null ||
                                              smsCodeVal.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Enter SMS verification code.'),
                                              ),
                                            );
                                            return;
                                          }
                                          final phoneVerifiedUser =
                                              await verifySmsCode(
                                            context: context,
                                            smsCode: smsCodeVal,
                                          );
                                          if (phoneVerifiedUser == null) {
                                            return;
                                          }

                                          if (FFAppState().AddCaptain != null &&
                                              FFAppState().AddCaptain != '') {
                                            context.pushNamedAuth(
                                              'newAddCaptain',
                                              mounted,
                                              queryParams: {
                                                'captaindetailpage':
                                                    serializeParam(
                                                  widget.captaindetails,
                                                  ParamType.Document,
                                                ),
                                                'captainPhone': serializeParam(
                                                  widget.num,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'captaindetailpage':
                                                    widget.captaindetails,
                                              },
                                            );
                                          } else {
                                            if (FFAppState().AddScout != null &&
                                                FFAppState().AddScout != '') {
                                              context.pushNamedAuth(
                                                'newAddScout',
                                                mounted,
                                                queryParams: {
                                                  'captaindetailpage':
                                                      serializeParam(
                                                    widget.captaindetails,
                                                    ParamType.Document,
                                                  ),
                                                  'captainPhone':
                                                      serializeParam(
                                                    widget.num,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'captaindetailpage':
                                                      widget.captaindetails,
                                                },
                                              );

                                              FFAppState().update(() {
                                                FFAppState().sendOTP = '';
                                              });
                                            } else {
                                              if (FFAppState().AddWorker !=
                                                      null &&
                                                  FFAppState().AddWorker !=
                                                      '') {
                                                context.pushNamedAuth(
                                                  'newAddWorker',
                                                  mounted,
                                                  queryParams: {
                                                    'workerPhone':
                                                        serializeParam(
                                                      widget.num,
                                                      ParamType.String,
                                                    ),
                                                    'workerdetailpage':
                                                        serializeParam(
                                                      widget.workerdetails,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'workerdetailpage':
                                                        widget.workerdetails,
                                                  },
                                                );

                                                FFAppState().update(() {
                                                  FFAppState().sendOTP = '';
                                                });
                                              } else {
                                                return;
                                              }

                                              return;
                                            }

                                            return;
                                          }

                                          FFAppState().update(() {
                                            FFAppState().sendOTP = '';
                                          });
                                        },
                                        text: 'Submit',
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
