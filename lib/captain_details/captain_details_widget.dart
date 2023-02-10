import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'captain_details_model.dart';
export 'captain_details_model.dart';

class CaptainDetailsWidget extends StatefulWidget {
  const CaptainDetailsWidget({
    Key? key,
    this.captaindetailpage,
    this.workerdetailpage,
    this.cappicc,
  }) : super(key: key);

  final CaptainsRecord? captaindetailpage;
  final CaptainsRecord? workerdetailpage;
  final CaptainsRecord? cappicc;

  @override
  _CaptainDetailsWidgetState createState() => _CaptainDetailsWidgetState();
}

class _CaptainDetailsWidgetState extends State<CaptainDetailsWidget> {
  late CaptainDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CaptainDetailsModel());

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
                                          color: FlutterFlowTheme.of(context)
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                                alignment: AlignmentDirectional(
                                                    -0.05, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0, 21.5, 0, 21.5),
                                                  child: Text(
                                                    'DASHBOARD',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF2D2D2D),
                                                          fontSize: 30,
                                                          lineHeight: 1,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.75, 0.04),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          300, 15, 30, 15),
                                                  child: Image.asset(
                                                    'assets/images/Line_47.png',
                                                    width: 2,
                                                    height: 80,
                                                    fit: BoxFit.cover,
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
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF6F9FF),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.91, 0.14),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25, 0, 0, 0),
                                                      child: Text(
                                                        'CAPTAIN  DETAIL PAGE',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.98, 0.2),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20, 0, 0, 0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 10,
                                                        borderWidth: 1,
                                                        buttonSize: 45,
                                                        fillColor:
                                                            Color(0xFFF2A213),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_left,
                                                          color: Colors.white,
                                                          size: 25,
                                                        ),
                                                        onPressed: () async {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .documentReferenceID =
                                                                null;
                                                          });

                                                          context.pushNamed(
                                                              'DASHBOARD');
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.17, 0.12),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  925, 0, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            'editCaptainDetails',
                                                            queryParams: {
                                                              'captaindetailpage':
                                                                  serializeParam(
                                                                widget
                                                                    .captaindetailpage,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'captaindetailpage':
                                                                  widget
                                                                      .captaindetailpage,
                                                            },
                                                          );

                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .editcappic =
                                                                widget
                                                                    .captaindetailpage!
                                                                    .photo!;
                                                          });
                                                        },
                                                        text: 'Edit Captain',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 55,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
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
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  StreamBuilder<
                                                      List<CaptainsRecord>>(
                                                    stream: queryCaptainsRecord(
                                                      queryBuilder: (captainsRecord) =>
                                                          captainsRecord.where(
                                                              'phone',
                                                              isEqualTo: widget
                                                                  .captaindetailpage!
                                                                  .phone),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<CaptainsRecord>
                                                          containerCaptainsRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final containerCaptainsRecord =
                                                          containerCaptainsRecordList
                                                                  .isNotEmpty
                                                              ? containerCaptainsRecordList
                                                                  .first
                                                              : null;
                                                      return Container(
                                                        width: 900,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF6F9FF),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lines,
                                                          ),
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            40,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (containerCaptainsRecord!.photo ==
                                                                                null ||
                                                                            containerCaptainsRecord!.photo ==
                                                                                '')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                30,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 120,
                                                                              height: 120,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.cover,
                                                                                  image: Image.asset(
                                                                                    'assets/images/captains111.png',
                                                                                  ).image,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                border: Border.all(
                                                                                  color: Color(0xFFDEDEDE),
                                                                                ),
                                                                              ),
                                                                              child: Image.network(
                                                                                containerCaptainsRecord!.photo!,
                                                                                width: 75,
                                                                                height: 75,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (containerCaptainsRecord!.photo !=
                                                                                null &&
                                                                            containerCaptainsRecord!.photo !=
                                                                                '')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                30,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 120,
                                                                              height: 120,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                border: Border.all(
                                                                                  color: Color(0xFFDEDEDE),
                                                                                ),
                                                                              ),
                                                                              child: Image.network(
                                                                                containerCaptainsRecord!.photo!,
                                                                                width: 75,
                                                                                height: 75,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                  child: Text(
                                                                                    functions.makeUpperCase(containerCaptainsRecord!.fullName!),
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).title1.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Colors.black,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16, 10, 0, 0),
                                                                                  child: Text(
                                                                                    'CAPTAIN',
                                                                                    style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 20,
                                                                                        ),
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
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 950,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF6F9FF),
                                                                ),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            30,
                                                                            30,
                                                                            30,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              450,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                35,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 25),
                                                                                              child: Text(
                                                                                                'PERSONAL DETAILS ',
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).title1.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      lineHeight: 1,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Divider(
                                                                                            thickness: 2,
                                                                                            color: FlutterFlowTheme.of(context).lines,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'MOBILE NO',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                    child: Text(
                                                                                                      'EMAIL ID',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                    child: Text(
                                                                                                      'DATE OF BIRTH',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                    child: Text(
                                                                                                      'Area',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                    child: Text(
                                                                                                      'State',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                    child: Text(
                                                                                                      'District',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 3,
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(1, 0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                    child: Text(
                                                                                                      containerCaptainsRecord!.phone!,
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                  child: Text(
                                                                                                    containerCaptainsRecord!.email!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                  child: Text(
                                                                                                    containerCaptainsRecord!.dob!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                  child: Text(
                                                                                                    containerCaptainsRecord!.area!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                  child: Text(
                                                                                                    containerCaptainsRecord!.state!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                  child: Text(
                                                                                                    containerCaptainsRecord!.district!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
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
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            30,
                                                                            30,
                                                                            30,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              650,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                35,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 25),
                                                                                                child: Text(
                                                                                                  'BANK DETAILS ',
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).title1.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        lineHeight: 1,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Divider(
                                                                                              thickness: 2,
                                                                                              color: FlutterFlowTheme.of(context).lines,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'ADHAAR  NO.',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                    child: Text(
                                                                                                      'PAN NO',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                    child: Text(
                                                                                                      'ACCOUNT NO',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                    child: Text(
                                                                                                      'NAME ON ACCT',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                    child: Text(
                                                                                                      'IFSC',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 3,
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(1, 0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                    child: Text(
                                                                                                      containerCaptainsRecord!.aadhar!,
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                  child: Text(
                                                                                                    containerCaptainsRecord!.panNumber!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                  child: Text(
                                                                                                    containerCaptainsRecord!.accountNumber!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                  child: Text(
                                                                                                    containerCaptainsRecord!.accountName!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                                                                                                  child: Text(
                                                                                                    containerCaptainsRecord!.ifscCode!,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.normal,
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
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                450, 0, 0, 0),
                                                    child: Container(
                                                      width: 1052,
                                                      height: 1160,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF6F9FF),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lines,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(30, 0,
                                                                    0, 0),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            30,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        'LIST OF WORKERS ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              390,
                                                                              0,
                                                                              1,
                                                                              0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().AddWorker =
                                                                                'Worker';
                                                                          });

                                                                          context
                                                                              .pushNamed(
                                                                            'authentication',
                                                                            queryParams:
                                                                                {
                                                                              'captaindetails': serializeParam(
                                                                                widget.captaindetailpage,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'captaindetails': widget.captaindetailpage,
                                                                            },
                                                                          );
                                                                        },
                                                                        text:
                                                                            'Add new worker',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              200,
                                                                          height:
                                                                              50,
                                                                          color:
                                                                              Color(0xFFF2A213),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Colors.white,
                                                                              ),
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
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
                                                                            0,
                                                                            16,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Divider(
                                                                      thickness:
                                                                          2,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lines,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 950,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                950,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                StreamBuilder<List<WorkersRecord>>(
                                                                              stream: queryWorkersRecord(
                                                                                queryBuilder: (workersRecord) => workersRecord.where('User_Ref', isEqualTo: widget.cappicc!.userRef),
                                                                              ),
                                                                              builder: (context, snapshot) {
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
                                                                                List<WorkersRecord> listViewWorkersRecordList = snapshot.data!;
                                                                                return ListView.builder(
                                                                                  padding: EdgeInsets.zero,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: listViewWorkersRecordList.length,
                                                                                  itemBuilder: (context, listViewIndex) {
                                                                                    final listViewWorkersRecord = listViewWorkersRecordList[listViewIndex];
                                                                                    return Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.of(context).size.width,
                                                                                        height: 180,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 6,
                                                                                              color: Color(0xFFDEDEDE),
                                                                                              offset: Offset(4, 4),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(10),
                                                                                        ),
                                                                                        child: SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: double.infinity,
                                                                                                height: 180,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 10, 20),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      if (listViewWorkersRecord.photo == null || listViewWorkersRecord.photo == '')
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                          child: Container(
                                                                                                            width: 120,
                                                                                                            height: 120,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                              border: Border.all(
                                                                                                                color: Color(0xFFDEDEDE),
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                              child: Image.asset(
                                                                                                                'assets/images/account-hard-hat.png',
                                                                                                                width: 75,
                                                                                                                height: 75,
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      if (listViewWorkersRecord.photo != null && listViewWorkersRecord.photo != '')
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                          child: Container(
                                                                                                            width: 120,
                                                                                                            height: 120,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                              border: Border.all(
                                                                                                                color: Color(0xFFDEDEDE),
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                              child: Image.network(
                                                                                                                listViewWorkersRecord.photo!,
                                                                                                                width: 75,
                                                                                                                height: 75,
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      Expanded(
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(0, 0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                                            child: SingleChildScrollView(
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(-0.15, 0),
                                                                                                                        child: Text(
                                                                                                                          functions.makeUpperCase(listViewWorkersRecord.fullName!),
                                                                                                                          textAlign: TextAlign.center,
                                                                                                                          style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: Colors.black,
                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                                                        child: Text(
                                                                                                                          listViewWorkersRecord.phone!,
                                                                                                                          style: FlutterFlowTheme.of(context).title1.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                                                        child: Text(
                                                                                                                          listViewWorkersRecord.email!,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 1, 0),
                                                                                                        child: FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            context.pushNamed(
                                                                                                              'WorkerDetailsPage',
                                                                                                              queryParams: {
                                                                                                                'workerdetailpage': serializeParam(
                                                                                                                  listViewWorkersRecord,
                                                                                                                  ParamType.Document,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                              extra: <String, dynamic>{
                                                                                                                'workerdetailpage': listViewWorkersRecord,
                                                                                                              },
                                                                                                            );
                                                                                                          },
                                                                                                          text: 'View',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: 110,
                                                                                                            height: 50,
                                                                                                            color: Color(0xFFF2A213),
                                                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
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
                                                            ],
                                                          ),
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
    );
  }
}
