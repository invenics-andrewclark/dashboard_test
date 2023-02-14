import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'd_a_s_h_b_o_a_r_d_copy_model.dart';
export 'd_a_s_h_b_o_a_r_d_copy_model.dart';

class DASHBOARDCopyWidget extends StatefulWidget {
  const DASHBOARDCopyWidget({Key? key}) : super(key: key);

  @override
  _DASHBOARDCopyWidgetState createState() => _DASHBOARDCopyWidgetState();
}

class _DASHBOARDCopyWidgetState extends State<DASHBOARDCopyWidget> {
  late DASHBOARDCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DASHBOARDCopyModel());

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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0, -0.05),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFF454545),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF454545),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lines,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/Frame_side1.png',
                                                width: 75,
                                                height: 75,
                                                fit: BoxFit.cover,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2A213),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Vector_(6).png',
                                            width: 23,
                                            height: 23,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF2A213),
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed('Organisations');
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.account_balance_outlined,
                                                color: Colors.black,
                                                size: 40,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF2A213),
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed('AllJobs');
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.work_outline,
                                                color: Colors.black,
                                                size: 40,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFFFFF1D9),
                                            child: Container(
                                              width: double.infinity,
                                              height: 76,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.05, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0, 21.5,
                                                                  0, 21.5),
                                                      child: Text(
                                                        'DASHBOARD',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF2D2D2D),
                                                                  fontSize: 30,
                                                                  lineHeight: 1,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.96, -0.03),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderWidth: 1,
                                                        buttonSize: 40,
                                                        icon: Icon(
                                                          Icons.logout,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 30,
                                                        ),
                                                        onPressed: () async {
                                                          GoRouter.of(context)
                                                              .prepareAuthEvent();
                                                          await signOut();

                                                          context.pushNamedAuth(
                                                              'Signin',
                                                              mounted);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: 87,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF6F9FF),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 188,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF6F9FF),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .dashboardrecordtype =
                                                          'Captain';
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 259,
                                                    height: 128,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 22,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(0, 0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFFFD058),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            26,
                                                                            21,
                                                                            0,
                                                                            63),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/captains111.png',
                                                                  width: 40,
                                                                  height: 47,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            50,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child: StreamBuilder<
                                                                            List<CaptainsRecord>>(
                                                                          stream:
                                                                              queryCaptainsRecord(
                                                                            queryBuilder: (captainsRecord) =>
                                                                                captainsRecord.where('tag', isEqualTo: 'Captain'),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  child: CircularProgressIndicator(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<CaptainsRecord>
                                                                                textCaptainsRecordList =
                                                                                snapshot.data!;
                                                                            return SelectionArea(
                                                                                child: Text(
                                                                              textCaptainsRecordList.length.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFFF2A213),
                                                                                    fontSize: 22,
                                                                                  ),
                                                                            ));
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            30,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'CAPTAINS',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .dashboardrecordtype =
                                                          'Scout';
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 259,
                                                    height: 128,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 22,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(0, 0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFFFD058),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            26,
                                                                            21,
                                                                            0,
                                                                            63),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/scouts.png',
                                                                  width: 40,
                                                                  height: 47,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            50,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child: StreamBuilder<
                                                                            List<CaptainsRecord>>(
                                                                          stream:
                                                                              queryCaptainsRecord(
                                                                            queryBuilder: (captainsRecord) =>
                                                                                captainsRecord.where('tag', isEqualTo: 'Scout'),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  child: CircularProgressIndicator(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<CaptainsRecord>
                                                                                textCaptainsRecordList =
                                                                                snapshot.data!;
                                                                            return SelectionArea(
                                                                                child: Text(
                                                                              textCaptainsRecordList.length.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFFF2A213),
                                                                                    fontSize: 22,
                                                                                  ),
                                                                            ));
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            30,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'SCOUTS',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 0, 30, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .dashboardrecordtype =
                                                          'Worker';
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 259,
                                                    height: 128,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 22,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(0, 0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFFFD058),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            26,
                                                                            21,
                                                                            0,
                                                                            63),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/captains111.png',
                                                                  width: 40,
                                                                  height: 47,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            50,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child: StreamBuilder<
                                                                            List<WorkersRecord>>(
                                                                          stream:
                                                                              queryWorkersRecord(),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  child: CircularProgressIndicator(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<WorkersRecord>
                                                                                textWorkersRecordList =
                                                                                snapshot.data!;
                                                                            return SelectionArea(
                                                                                child: Text(
                                                                              textWorkersRecordList.length.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFFF2A213),
                                                                                    fontSize: 22,
                                                                                  ),
                                                                            ));
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            30,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'WORKERS',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'authentication');

                                                  FFAppState().update(() {
                                                    FFAppState().AddCaptain =
                                                        'Captain';
                                                  });
                                                },
                                                child: Container(
                                                  width: 259,
                                                  height: 128,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 22,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(0, 0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color(0xFFFFD058),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Add Captain',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        'authentication');

                                                    FFAppState().update(() {
                                                      FFAppState().AddScout =
                                                          'Scout';
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 259,
                                                    height: 128,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 22,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(0, 0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFFFD058),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Add Scout',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        'newAddWorker');

                                                    FFAppState().update(() {
                                                      FFAppState().AddWorker =
                                                          'Worker';
                                                    });

                                                    context.pushNamed(
                                                        'authentication');
                                                  },
                                                  child: Container(
                                                    width: 259,
                                                    height: 128,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 22,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(0, 0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFFFD058),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Add Worker',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0, 0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 30),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(30,
                                                                      31, 0, 0),
                                                          child: Text(
                                                            'LIST OF ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 22,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        if (FFAppState()
                                                                .dashboardrecordtype ==
                                                            'Captain')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        31,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'CAPTAINS',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (FFAppState()
                                                                .dashboardrecordtype ==
                                                            'Scout')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        31,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'SCOUTS',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        if ((FFAppState()
                                                                    .dashboardrecordtype ==
                                                                'Worker') ||
                                                            (FFAppState()
                                                                        .dashboardrecordtype ==
                                                                    null ||
                                                                FFAppState()
                                                                        .dashboardrecordtype ==
                                                                    ''))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        31,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'WORKERS',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                3, 2, 4, 0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: Container(
                                                        width: 100,
                                                        height: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFFF1D9),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      30,
                                                                      12,
                                                                      12,
                                                                      0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  'FULL NAME',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  'EMAIL',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  'CONTACT  NO',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  'AREA',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  'Joined Date',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3,
                                                                ),
                                                              ),
                                                              Text(
                                                                'VIEW',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title3,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (FFAppState()
                                                          .dashboardrecordtype ==
                                                      'Captain')
                                                    Expanded(
                                                      child: StreamBuilder<
                                                          List<CaptainsRecord>>(
                                                        stream:
                                                            queryCaptainsRecord(
                                                          queryBuilder: (captainsRecord) =>
                                                              captainsRecord.where(
                                                                  'tag',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .dashboardrecordtype),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<CaptainsRecord>
                                                              listViewCaptainsRecordList =
                                                              snapshot.data!;
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewCaptainsRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewCaptainsRecord =
                                                                  listViewCaptainsRecordList[
                                                                      listViewIndex];
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 85,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF6F9FF),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFBEBEBE),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30,
                                                                          12,
                                                                          12,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewCaptainsRecord
                                                                              .fullName!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewCaptainsRecord
                                                                              .email!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewCaptainsRecord
                                                                              .phone!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewCaptainsRecord
                                                                              .area!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.ddmmyyFormat(dateTimeFormat('yMd',
                                                                                listViewCaptainsRecord.createdDate)),
                                                                            'dd',
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            60,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .navigate_next,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              30,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().CaptainReference =
                                                                                listViewCaptainsRecord.reference;
                                                                            FFAppState().documentReferenceID =
                                                                                listViewCaptainsRecord.userRef;
                                                                          });

                                                                          context
                                                                              .pushNamed(
                                                                            'CaptainDetails',
                                                                            queryParams:
                                                                                {
                                                                              'captaindetailpage': serializeParam(
                                                                                listViewCaptainsRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                              'cappicc': serializeParam(
                                                                                listViewCaptainsRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'captaindetailpage': listViewCaptainsRecord,
                                                                              'cappicc': listViewCaptainsRecord,
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  if (FFAppState()
                                                          .dashboardrecordtype ==
                                                      'Scout')
                                                    Expanded(
                                                      child: StreamBuilder<
                                                          List<CaptainsRecord>>(
                                                        stream:
                                                            queryCaptainsRecord(
                                                          queryBuilder: (captainsRecord) =>
                                                              captainsRecord
                                                                  .where('tag',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .dashboardrecordtype)
                                                                  .orderBy(
                                                                      'created_date',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<CaptainsRecord>
                                                              listViewCaptainsRecordList =
                                                              snapshot.data!;
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewCaptainsRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewCaptainsRecord =
                                                                  listViewCaptainsRecordList[
                                                                      listViewIndex];
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 85,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF6F9FF),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFBEBEBE),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30,
                                                                          12,
                                                                          12,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewCaptainsRecord
                                                                              .fullName!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewCaptainsRecord
                                                                              .email!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewCaptainsRecord
                                                                              .phone!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewCaptainsRecord
                                                                              .area!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.ddmmyyFormat(dateTimeFormat('yMd',
                                                                                listViewCaptainsRecord.createdDate)),
                                                                            'dd',
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            60,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .navigate_next,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              30,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().CaptainReference =
                                                                                listViewCaptainsRecord.reference;
                                                                            FFAppState().documentReferenceID =
                                                                                listViewCaptainsRecord.userRef;
                                                                          });

                                                                          context
                                                                              .pushNamed(
                                                                            'ScoutDetails',
                                                                            queryParams:
                                                                                {
                                                                              'scoutdetailpage': serializeParam(
                                                                                listViewCaptainsRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'scoutdetailpage': listViewCaptainsRecord,
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  if ((FFAppState()
                                                              .dashboardrecordtype ==
                                                          'Worker') ||
                                                      (FFAppState()
                                                                  .dashboardrecordtype ==
                                                              null ||
                                                          FFAppState()
                                                                  .dashboardrecordtype ==
                                                              ''))
                                                    Expanded(
                                                      child: StreamBuilder<
                                                          List<WorkersRecord>>(
                                                        stream:
                                                            queryWorkersRecord(
                                                          queryBuilder:
                                                              (workersRecord) =>
                                                                  workersRecord.orderBy(
                                                                      'created_date',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<WorkersRecord>
                                                              listViewWorkersRecordList =
                                                              snapshot.data!;
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewWorkersRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewWorkersRecord =
                                                                  listViewWorkersRecordList[
                                                                      listViewIndex];
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 85,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF6F9FF),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFBEBEBE),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30,
                                                                          12,
                                                                          12,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewWorkersRecord
                                                                              .fullName!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewWorkersRecord
                                                                              .email!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewWorkersRecord
                                                                              .phone!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listViewWorkersRecord
                                                                              .area!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.ddmmyyFormat(dateTimeFormat('yMd',
                                                                                listViewWorkersRecord.createdDate)),
                                                                            'dd',
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).title3,
                                                                        ),
                                                                      ),
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            60,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .navigate_next,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              30,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().WorkerReference =
                                                                                listViewWorkersRecord.reference;
                                                                          });

                                                                          context
                                                                              .pushNamed(
                                                                            'WorkerDetailsPage',
                                                                            queryParams:
                                                                                {
                                                                              'workerdetailpage': serializeParam(
                                                                                listViewWorkersRecord,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'workerdetailpage': listViewWorkersRecord,
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
