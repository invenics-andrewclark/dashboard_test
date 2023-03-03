import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottombar_widget.dart';
import '/components/headingbar_widget.dart';
import '/components/no_list_widget.dart';
import '/components/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'jobs_dash_model.dart';
export 'jobs_dash_model.dart';

class JobsDashWidget extends StatefulWidget {
  const JobsDashWidget({
    Key? key,
    this.jobdetails,
  }) : super(key: key);

  final JobsRecord? jobdetails;

  @override
  _JobsDashWidgetState createState() => _JobsDashWidgetState();
}

class _JobsDashWidgetState extends State<JobsDashWidget> {
  late JobsDashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobsDashModel());

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

    return StreamBuilder<List<JobsRecord>>(
      stream: queryJobsRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<JobsRecord> jobsDashJobsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final jobsDashJobsRecord = jobsDashJobsRecordList.isNotEmpty
            ? jobsDashJobsRecordList.first
            : null;
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
                      colour2: FlutterFlowTheme.of(context).secondaryColor,
                      colour3: FlutterFlowTheme.of(context).tertiaryColor,
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
                                  text: 'JOB DETAILS',
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 150.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: Image.asset(
                                                  'assets/images/job.jpg',
                                                ).image,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Container(
                                              width: 120.0,
                                              height: 120.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                widget.jobdetails!.jobImage!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  functions.makeUpperCase(widget
                                                      .jobdetails!.jobTitle!),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 22.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      if (jobsDashJobsRecord!.endDate! >=
                                          getCurrentTimestamp)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 20.0, 0.0),
                                          child: Container(
                                            width: 292.2,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: SwitchListTile(
                                                    value: _model
                                                            .switchListTileValue ??=
                                                        () {
                                                      if (widget.jobdetails!
                                                              .jobStatus ==
                                                          '1') {
                                                        return true;
                                                      } else if (widget
                                                              .jobdetails!
                                                              .jobStatus ==
                                                          '2') {
                                                        return false;
                                                      } else {
                                                        return (widget
                                                                .jobdetails!
                                                                .jobStatus ==
                                                            'kkk');
                                                      }
                                                    }(),
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .switchListTileValue =
                                                          newValue!);
                                                      if (newValue!) {
                                                        final jobsUpdateData =
                                                            createJobsRecordData(
                                                          jobStatus: '1',
                                                        );
                                                        await widget.jobdetails!
                                                            .reference
                                                            .update(
                                                                jobsUpdateData);
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    200));
                                                        context.pop();
                                                      } else {
                                                        final jobsUpdateData =
                                                            createJobsRecordData(
                                                          jobStatus: '2',
                                                        );
                                                        await widget.jobdetails!
                                                            .reference
                                                            .update(
                                                                jobsUpdateData);
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    200));
                                                        context.pop();
                                                      }
                                                    },
                                                    title: Text(
                                                      'Job Status',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3,
                                                    ),
                                                    tileColor:
                                                        Color(0xFFF5F5F5),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                    dense: false,
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .trailing,
                                                  ),
                                                ),
                                                Text(
                                                  widget.jobdetails!
                                                              .jobStatus ==
                                                          '1'
                                                      ? 'Active'
                                                      : 'Closed',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: StreamBuilder<
                                                    List<JobsRecord>>(
                                                  stream: queryJobsRecord(
                                                    parent: widget.jobdetails!
                                                        .parentReference,
                                                    singleRecord: true,
                                                  ),
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
                                                    List<JobsRecord>
                                                        tabBarJobsRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final tabBarJobsRecord =
                                                        tabBarJobsRecordList
                                                                .isNotEmpty
                                                            ? tabBarJobsRecordList
                                                                .first
                                                            : null;
                                                    return DefaultTabController(
                                                      length: 3,
                                                      initialIndex: 0,
                                                      child: Column(
                                                        children: [
                                                          TabBar(
                                                            labelColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            unselectedLabelColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            labelPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        8.0),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          20.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            indicatorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            indicatorWeight:
                                                                3.0,
                                                            tabs: [
                                                              Tab(
                                                                text:
                                                                    'ORGANISATION DETAILS',
                                                              ),
                                                              Tab(
                                                                text:
                                                                    'JOB DESCRIPTION',
                                                              ),
                                                              Tab(
                                                                text:
                                                                    'APPLIED WORKERS',
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: TabBarView(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      OrganisationsRecord>(
                                                                    stream: OrganisationsRecord.getDocument(widget
                                                                        .jobdetails!
                                                                        .orgRefId!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final columnOrganisationsRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: double.infinity,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                  child: Container(
                                                                                                    width: double.infinity,
                                                                                                    height: 50.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            'BASIC DETAILS',
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  fontSize: 20.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                            child: Container(
                                                                                                              width: 300.0,
                                                                                                              height: 50.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    'ORGANISATION REGISTRATION ID',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          fontSize: 18.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                            child: Container(
                                                                                                              width: 300.0,
                                                                                                              height: 50.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    'ORGANISATION NAME',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          fontSize: 18.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                            child: Container(
                                                                                                              width: 300.0,
                                                                                                              height: 50.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    'PHONE NUMBER',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          fontSize: 18.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                            child: Container(
                                                                                                              width: 300.0,
                                                                                                              height: 50.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    'EMAIL',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          fontSize: 18.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                            child: Container(
                                                                                                              width: 300.0,
                                                                                                              height: 50.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    'CREATED ON',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          fontSize: 18.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      columnOrganisationsRecord.organisationRegistrationId!.toString(),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      functions.firstCharUppercase(columnOrganisationsRecord.organisationName!),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      columnOrganisationsRecord.phoneNumber!,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      columnOrganisationsRecord.email!,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      columnOrganisationsRecord.createdOn!,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
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
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: MediaQuery.of(context).size.height * 0.32,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      height: 50.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              'ADDRESS',
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    fontSize: 20.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: 300.0,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'PINCODE',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: 300.0,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'AREA',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: 300.0,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'DISTRICT',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: 300.0,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'STATE',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      columnOrganisationsRecord.pinCode!,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      columnOrganisationsRecord.area!,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      columnOrganisationsRecord.area!,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      columnOrganisationsRecord.state!,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'Poppins',
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.normal,
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
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              height: 50.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'JOB DESCRIPTION',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            fontSize: 20.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'JOB TITLE',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'JOB DESCRIPTION',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'JOB CATEGORY',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'JOB SUB-CATEGORY',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'NO OF VACANCIES',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'MODE OF SALARY',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'SALARY',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'WORKING HOURS',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                        child: Container(
                                                                                                          width: 300.0,
                                                                                                          height: 50.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'FACILITIES',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  functions.firstCharUppercase(widget.jobdetails!.jobTitle!),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  widget.jobdetails!.jobDescription!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  widget.jobdetails!.jobCategory!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  widget.jobdetails!.jobSubCateg!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    widget.jobdetails!.numberOfVacancies,
                                                                                                                    'Not Available',
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  widget.jobdetails!.modeOfSalary!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  '${widget.jobdetails!.minSalary}-${widget.jobdetails!.maxSalary}',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  widget.jobdetails!.workingHours!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                if (widget.jobdetails!.food == 'available')
                                                                                                                  FlutterFlowIconButton(
                                                                                                                    borderColor: Colors.transparent,
                                                                                                                    borderRadius: 30.0,
                                                                                                                    borderWidth: 1.0,
                                                                                                                    buttonSize: 60.0,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.fastfood_rounded,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                    onPressed: () {
                                                                                                                      print('food pressed ...');
                                                                                                                    },
                                                                                                                  ),
                                                                                                                if (widget.jobdetails!.lodging == 'available')
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                                    child: FlutterFlowIconButton(
                                                                                                                      borderColor: Colors.transparent,
                                                                                                                      borderRadius: 30.0,
                                                                                                                      borderWidth: 1.0,
                                                                                                                      buttonSize: 60.0,
                                                                                                                      icon: Icon(
                                                                                                                        Icons.local_hotel_rounded,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                      onPressed: () {
                                                                                                                        print('IconButton pressed ...');
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if (widget.jobdetails!.medical == 'available')
                                                                                                                  FlutterFlowIconButton(
                                                                                                                    borderColor: Colors.transparent,
                                                                                                                    borderRadius: 30.0,
                                                                                                                    borderWidth: 1.0,
                                                                                                                    buttonSize: 60.0,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.medical_services_outlined,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                    onPressed: () {
                                                                                                                      print('IconButton pressed ...');
                                                                                                                    },
                                                                                                                  ),
                                                                                                                if (widget.jobdetails!.transportation == 'available')
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                                    child: FlutterFlowIconButton(
                                                                                                                      borderColor: Colors.transparent,
                                                                                                                      borderRadius: 30.0,
                                                                                                                      borderWidth: 1.0,
                                                                                                                      buttonSize: 60.0,
                                                                                                                      icon: Icon(
                                                                                                                        Icons.train,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                      onPressed: () {
                                                                                                                        print('IconButton pressed ...');
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if ((widget.jobdetails!.transportation == 'unavailable') && (widget.jobdetails!.medical == 'unavailable') && (widget.jobdetails!.lodging == 'unavailable') && (widget.jobdetails!.food == 'unavailable'))
                                                                                                                  Text(
                                                                                                                    'No facilities available',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          fontSize: 18.0,
                                                                                                                          fontWeight: FontWeight.normal,
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
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: MediaQuery.of(context).size.height * 0.32,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 50.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'ELIGIBILITY CRITERIA',
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                fontSize: 20.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: 300.0,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'MIN QUALIFICATION',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: 300.0,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'GENDER',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: 300.0,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'AGE',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                          child: Container(
                                                                                                            width: 300.0,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'JOB SKILL LEVEL',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                                                                                                            child: Container(
                                                                                                              width: double.infinity,
                                                                                                              height: 50.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    widget.jobdetails!.minQualification!,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          fontSize: 18.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                            child: Container(
                                                                                                              width: double.infinity,
                                                                                                              height: 50.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    widget.jobdetails!.gender!,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          fontSize: 18.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                                            child: Container(
                                                                                                              width: double.infinity,
                                                                                                              height: 50.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    '${widget.jobdetails!.minAge}-${widget.jobdetails!.maxAge}',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          fontSize: 18.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 50.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            ),
                                                                                                            child: Text(
                                                                                                              widget.jobdetails!.primarySkillLevel!,
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    fontSize: 18.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                  ),
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
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(0.0, 2.0),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 4.0,
                                                                                        color: Color(0x33000000),
                                                                                        offset: Offset(0.0, 2.0),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: StreamBuilder<List<OrganisationsRecord>>(
                                                                                                  stream: queryOrganisationsRecord(
                                                                                                    singleRecord: true,
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 50.0,
                                                                                                          height: 50.0,
                                                                                                          child: CircularProgressIndicator(
                                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<OrganisationsRecord> columnOrganisationsRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final columnOrganisationsRecord = columnOrganisationsRecordList.isNotEmpty ? columnOrganisationsRecordList.first : null;
                                                                                                    return Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            'LIST OF APPLIED WORKERS',
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  fontSize: 20.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            height: 60.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: MediaQuery.of(context).size.width * 0.264,
                                                                                                                    height: 100.0,
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          'APPLIED WORKERS',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontSize: 20.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: MediaQuery.of(context).size.width * 0.267,
                                                                                                                    height: 100.0,
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          'ACCEPTED WORKERS',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                fontSize: 20.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                    child: Container(
                                                                                                                      width: MediaQuery.of(context).size.width * 0.25,
                                                                                                                      height: 100.0,
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            'REJECTED WORKERS',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                  fontFamily: 'Poppins',
                                                                                                                                  fontSize: 20.0,
                                                                                                                                  fontWeight: FontWeight.normal,
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
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Builder(
                                                                                                          builder: (context) {
                                                                                                            final appliedworkers = tabBarJobsRecord!.applications!.toList().where((e) => e.applicationStatus == 0).toList();
                                                                                                            if (appliedworkers.isEmpty) {
                                                                                                              return NoListWidget(
                                                                                                                text: 'Workers',
                                                                                                              );
                                                                                                            }
                                                                                                            return Column(
                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: List.generate(appliedworkers.length, (appliedworkersIndex) {
                                                                                                                final appliedworkersItem = appliedworkers[appliedworkersIndex];
                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                  child: Container(
                                                                                                                    width: MediaQuery.of(context).size.width * 0.31,
                                                                                                                    height: 80.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                                                      border: Border.all(
                                                                                                                        color: Color(0xFF0B0000),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            functions.firstCharUppercase(appliedworkersItem.workerName!),
                                                                                                                            style: FlutterFlowTheme.of(context).subtitle1,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              FlutterFlowIconButton(
                                                                                                                                borderColor: Colors.transparent,
                                                                                                                                borderRadius: 30.0,
                                                                                                                                borderWidth: 1.0,
                                                                                                                                buttonSize: 60.0,
                                                                                                                                icon: Icon(
                                                                                                                                  Icons.check_outlined,
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  size: 30.0,
                                                                                                                                ),
                                                                                                                                onPressed: () async {
                                                                                                                                  final jobsUpdateData1 = {
                                                                                                                                    'applications': FieldValue.arrayRemove([
                                                                                                                                      getJobApplicationFirestoreData(
                                                                                                                                        createJobApplicationStruct(
                                                                                                                                          workerId: appliedworkersItem.workerId,
                                                                                                                                          appliedOn: appliedworkersItem.appliedOn,
                                                                                                                                          applicationStatus: appliedworkersItem.applicationStatus,
                                                                                                                                          workerName: appliedworkersItem.workerName,
                                                                                                                                          gender: appliedworkersItem.gender,
                                                                                                                                          area: appliedworkersItem.area,
                                                                                                                                          clearUnsetFields: false,
                                                                                                                                        ),
                                                                                                                                        true,
                                                                                                                                      )
                                                                                                                                    ]),
                                                                                                                                  };
                                                                                                                                  await widget.jobdetails!.reference.update(jobsUpdateData1);

                                                                                                                                  final jobsUpdateData2 = {
                                                                                                                                    'applications': FieldValue.arrayUnion([
                                                                                                                                      getJobApplicationFirestoreData(
                                                                                                                                        createJobApplicationStruct(
                                                                                                                                          applicationStatus: 1,
                                                                                                                                          workerId: appliedworkersItem.workerId,
                                                                                                                                          workerName: appliedworkersItem.workerName,
                                                                                                                                          gender: appliedworkersItem.gender,
                                                                                                                                          area: appliedworkersItem.area,
                                                                                                                                          appliedOn: appliedworkersItem.appliedOn,
                                                                                                                                          clearUnsetFields: false,
                                                                                                                                        ),
                                                                                                                                        true,
                                                                                                                                      )
                                                                                                                                    ]),
                                                                                                                                  };
                                                                                                                                  await widget.jobdetails!.reference.update(jobsUpdateData2);
                                                                                                                                },
                                                                                                                              ),
                                                                                                                              FlutterFlowIconButton(
                                                                                                                                borderColor: Colors.transparent,
                                                                                                                                borderRadius: 30.0,
                                                                                                                                borderWidth: 1.0,
                                                                                                                                buttonSize: 60.0,
                                                                                                                                icon: Icon(
                                                                                                                                  Icons.clear_rounded,
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  size: 30.0,
                                                                                                                                ),
                                                                                                                                onPressed: () async {
                                                                                                                                  final jobsUpdateData1 = {
                                                                                                                                    'applications': FieldValue.arrayRemove([
                                                                                                                                      getJobApplicationFirestoreData(
                                                                                                                                        createJobApplicationStruct(
                                                                                                                                          workerId: appliedworkersItem.workerId,
                                                                                                                                          appliedOn: appliedworkersItem.appliedOn,
                                                                                                                                          applicationStatus: appliedworkersItem.applicationStatus,
                                                                                                                                          workerName: appliedworkersItem.workerName,
                                                                                                                                          gender: appliedworkersItem.gender,
                                                                                                                                          area: appliedworkersItem.area,
                                                                                                                                          clearUnsetFields: false,
                                                                                                                                        ),
                                                                                                                                        true,
                                                                                                                                      )
                                                                                                                                    ]),
                                                                                                                                  };
                                                                                                                                  await widget.jobdetails!.reference.update(jobsUpdateData1);

                                                                                                                                  final jobsUpdateData2 = {
                                                                                                                                    'applications': FieldValue.arrayUnion([
                                                                                                                                      getJobApplicationFirestoreData(
                                                                                                                                        createJobApplicationStruct(
                                                                                                                                          applicationStatus: 2,
                                                                                                                                          workerId: appliedworkersItem.workerId,
                                                                                                                                          workerName: appliedworkersItem.workerName,
                                                                                                                                          gender: appliedworkersItem.gender,
                                                                                                                                          area: appliedworkersItem.area,
                                                                                                                                          appliedOn: appliedworkersItem.appliedOn,
                                                                                                                                          clearUnsetFields: false,
                                                                                                                                        ),
                                                                                                                                        true,
                                                                                                                                      )
                                                                                                                                    ]),
                                                                                                                                  };
                                                                                                                                  await widget.jobdetails!.reference.update(jobsUpdateData2);
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              }),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        height: 100.0,
                                                                                                        child: VerticalDivider(
                                                                                                          thickness: 1.0,
                                                                                                          color: Color(0xFF0B0000),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Builder(
                                                                                                          builder: (context) {
                                                                                                            final acceptedworkers = tabBarJobsRecord!.applications!.toList().where((e) => e.applicationStatus == 1).toList();
                                                                                                            if (acceptedworkers.isEmpty) {
                                                                                                              return NoListWidget(
                                                                                                                text: 'Workers',
                                                                                                              );
                                                                                                            }
                                                                                                            return Column(
                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                              children: List.generate(acceptedworkers.length, (acceptedworkersIndex) {
                                                                                                                final acceptedworkersItem = acceptedworkers[acceptedworkersIndex];
                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                  child: Container(
                                                                                                                    width: MediaQuery.of(context).size.width * 0.2,
                                                                                                                    height: 80.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                                      border: Border.all(
                                                                                                                        color: Color(0xFF0B0000),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            functions.firstCharUppercase(acceptedworkersItem.workerName!),
                                                                                                                            style: FlutterFlowTheme.of(context).subtitle1,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              }),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        height: 100.0,
                                                                                                        child: VerticalDivider(
                                                                                                          thickness: 1.0,
                                                                                                          color: Color(0xFF0B0000),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Builder(
                                                                                                          builder: (context) {
                                                                                                            final rejectedworkers = tabBarJobsRecord!.applications!.toList().where((e) => e.applicationStatus == 2).toList();
                                                                                                            if (rejectedworkers.isEmpty) {
                                                                                                              return NoListWidget(
                                                                                                                text: 'Workers',
                                                                                                              );
                                                                                                            }
                                                                                                            return Column(
                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                              children: List.generate(rejectedworkers.length, (rejectedworkersIndex) {
                                                                                                                final rejectedworkersItem = rejectedworkers[rejectedworkersIndex];
                                                                                                                return Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                                  child: Container(
                                                                                                                    width: MediaQuery.of(context).size.width * 0.2,
                                                                                                                    height: 80.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                                      border: Border.all(
                                                                                                                        color: Color(0xFF0B0000),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            functions.firstCharUppercase(rejectedworkersItem.workerName!),
                                                                                                                            style: FlutterFlowTheme.of(context).subtitle1,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              }),
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
                                                    );
                                                  },
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
      },
    );
  }
}
