import '/backend/backend.dart';
import '/components/bottombar_widget.dart';
import '/components/headingbar_widget.dart';
import '/components/no_list_widget.dart';
import '/components/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'organisation_list_copy_model.dart';
export 'organisation_list_copy_model.dart';

class OrganisationListCopyWidget extends StatefulWidget {
  const OrganisationListCopyWidget({Key? key}) : super(key: key);

  @override
  _OrganisationListCopyWidgetState createState() =>
      _OrganisationListCopyWidgetState();
}

class _OrganisationListCopyWidgetState
    extends State<OrganisationListCopyWidget> {
  late OrganisationListCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrganisationListCopyModel());

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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.webNavModel,
                updateCallback: () => setState(() {}),
                child: WebNavWidget(
                  colour1: FlutterFlowTheme.of(context).tertiaryColor,
                  colour2: FlutterFlowTheme.of(context).tertiaryColor,
                  colour3: FlutterFlowTheme.of(context).secondaryColor,
                  colour4: FlutterFlowTheme.of(context).tertiaryColor,
                  colour5: FlutterFlowTheme.of(context).tertiaryColor,
                  colour6: FlutterFlowTheme.of(context).tertiaryColor,
                  colour7: FlutterFlowTheme.of(context).tertiaryColor,
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.headingbarModel,
                            updateCallback: () => setState(() {}),
                            child: HeadingbarWidget(
                              text: 'LIST OF ORGANISATIONS',
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 20.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState()
                                                          .randomnumbergenerator =
                                                      functions.rand();
                                                });
                                                FFAppState().update(() {
                                                  FFAppState().disabling = '2';
                                                  FFAppState()
                                                      .OrganisationArea = '1';
                                                  FFAppState().profilepic = '';
                                                });

                                                context.pushNamed('AddOrgan');
                                              },
                                              text: 'ADD NEW ORGANISATION',
                                              options: FFButtonOptions(
                                                width: 280.0,
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        60.0, 0.0, 0.0, 0.0),
                                                child: FutureBuilder<
                                                    List<OrganisationsRecord>>(
                                                  future:
                                                      queryOrganisationsRecordOnce(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<OrganisationsRecord>
                                                        wrapOrganisationsRecordList =
                                                        snapshot.data!;
                                                    if (wrapOrganisationsRecordList
                                                        .isEmpty) {
                                                      return Center(
                                                        child: Container(
                                                          height: 100.0,
                                                          child: NoListWidget(
                                                            text:
                                                                'organisations',
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    return Wrap(
                                                      spacing: 0.0,
                                                      runSpacing: 0.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: List.generate(
                                                          wrapOrganisationsRecordList
                                                              .length,
                                                          (wrapIndex) {
                                                        final wrapOrganisationsRecord =
                                                            wrapOrganisationsRecordList[
                                                                wrapIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      70.0,
                                                                      50.0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'OrganisationDashboard',
                                                                queryParams: {
                                                                  'organisationdetails':
                                                                      serializeParam(
                                                                    wrapOrganisationsRecord,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'orgref':
                                                                      serializeParam(
                                                                    wrapOrganisationsRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'organisationdetails':
                                                                      wrapOrganisationsRecord,
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 618.0,
                                                              height: 250.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .faded,
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            2.0),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .outlines,
                                                                  width: 3.0,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -0.95),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            200.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).green,
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.fill,
                                                                            image:
                                                                                Image.asset(
                                                                              'assets/images/logo.jpg',
                                                                            ).image,
                                                                          ),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFBBBBBB),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Visibility(
                                                                          visible:
                                                                              wrapOrganisationsRecord.organisationLogo != null && wrapOrganisationsRecord.organisationLogo != '',
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                1.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(260.0),
                                                                              child: Image.network(
                                                                                wrapOrganisationsRecord.organisationLogo!,
                                                                                width: 309.6,
                                                                                height: 254.7,
                                                                                fit: BoxFit.fill,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          30.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            1000.0,
                                                                        height:
                                                                            220.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    functions.firstCharUppercase(wrapOrganisationsRecord.organisationName!),
                                                                                    style: FlutterFlowTheme.of(context).title2,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.phone_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                      size: 26.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    wrapOrganisationsRecord.phoneNumber!,
                                                                                    style: FlutterFlowTheme.of(context).title3,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.idCard,
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    wrapOrganisationsRecord.organisationRegistrationId!.toString(),
                                                                                    style: FlutterFlowTheme.of(context).title3.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 18.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.mail_rounded,
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    wrapOrganisationsRecord.email!,
                                                                                    style: FlutterFlowTheme.of(context).title3.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 18.0,
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
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
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
                            ),
                          ),
                          wrapWithModel(
                            model: _model.bottombarModel,
                            updateCallback: () => setState(() {}),
                            child: BottombarWidget(),
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
