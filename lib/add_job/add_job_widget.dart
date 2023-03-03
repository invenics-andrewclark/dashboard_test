import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottombar_widget.dart';
import '/components/headingbar_widget.dart';
import '/components/jobaddress_widget.dart';
import '/components/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_job_model.dart';
export 'add_job_model.dart';

class AddJobWidget extends StatefulWidget {
  const AddJobWidget({
    Key? key,
    this.orgdetails,
  }) : super(key: key);

  final OrganisationsRecord? orgdetails;

  @override
  _AddJobWidgetState createState() => _AddJobWidgetState();
}

class _AddJobWidgetState extends State<AddJobWidget> {
  late AddJobModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddJobModel());

    _model.organisationNameController ??= TextEditingController(
        text:
            functions.firstCharUppercase(widget.orgdetails!.organisationName!));
    _model.jobTitleController ??= TextEditingController();
    _model.jobDescriptionController ??= TextEditingController();
    _model.minimumSalaryController ??= TextEditingController();
    _model.maximumSalaryController ??= TextEditingController();
    _model.noVacanciesController ??= TextEditingController();
    _model.workHoursController ??= TextEditingController();
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
                child: StreamBuilder<List<JobimageRecord>>(
                  stream: queryJobimageRecord(
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
                    List<JobimageRecord> columnJobimageRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final columnJobimageRecord =
                        columnJobimageRecordList.isNotEmpty
                            ? columnJobimageRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.headingbarModel,
                          updateCallback: () => setState(() {}),
                          child: HeadingbarWidget(
                            text: 'ADD NEW JOB',
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 154.2,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width: 140.0,
                                        height: 140.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .green,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: Image.asset(
                                              'assets/images/job.jpg',
                                            ).image,
                                          ),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFFBBBBBB),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 140.0,
                                              height: 140.0,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: 140.0,
                                                    height: 140.0,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          width: 140.0,
                                                          height: 140.0,
                                                          child: Stack(
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (FFAppState().test ==
                                                                            '1')
                                                                          Text(
                                                                            'Upload  the picture',
                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
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
                                                      ],
                                                    ),
                                                  ),
                                                  if (FFAppState().profilepic !=
                                                          null &&
                                                      FFAppState().profilepic !=
                                                          '')
                                                    Container(
                                                      width: 145.0,
                                                      height: 145.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        FFAppState().profilepic,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (FFAppState().profilepic != null &&
                                          FFAppState().profilepic != '')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Alert !'),
                                                            content: Text(
                                                                'Do you want to change the profile photo?'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child:
                                                                    Text('No'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child:
                                                                    Text('Yes'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                setState(() {
                                                  FFAppState().profilepic = '';
                                                  FFAppState().test = '1';
                                                });
                                                if (FFAppState().profilepic ==
                                                        null ||
                                                    FFAppState().profilepic ==
                                                        '') {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    textColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    pickerFontFamily: 'Lato',
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    setState(() => _model
                                                            .isMediaUploading =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];
                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isMediaUploading =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      setState(() {
                                                        _model.uploadedLocalFile =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      setState(() {});
                                                      return;
                                                    }
                                                  }

                                                  setState(() {
                                                    FFAppState().profilepic =
                                                        _model.uploadedFileUrl;
                                                    FFAppState().test = '';
                                                  });
                                                } else {
                                                  return;
                                                }
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 120.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 5.0,
                                                                20.0, 0.0),
                                                    child: Text(
                                                      'Edit',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 700.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 50.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Form(
                                                  key: _model.formKey,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.75,
                                                                    0.45),
                                                            child: Text(
                                                              'ENTE GENERAL DETAILS',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title2,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Organisation name',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .organisationNameController,
                                                        readOnly: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Enter Organisation Name',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .textColor50,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .outlines,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayIcon,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      32.0,
                                                                      20.0,
                                                                      12.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        keyboardType:
                                                            TextInputType.name,
                                                        validator: _model
                                                            .organisationNameControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Job category',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 700.0,
                                                        height: 61.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .outlines,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          options: [
                                                            'Garments',
                                                            'Textile',
                                                            'Construction',
                                                            'Restaurant',
                                                            'Driver',
                                                            'Home Staff',
                                                            'Agricultural Work',
                                                            'Minning',
                                                            'Automobile'
                                                          ],
                                                          onChanged:
                                                              (val) async {
                                                            setState(() => _model
                                                                    .jobCategoryValue =
                                                                val);
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .jobcategory =
                                                                  _model
                                                                      .jobCategoryValue!;
                                                              FFAppState()
                                                                      .profilepic =
                                                                  () {
                                                                if (_model
                                                                        .jobCategoryValue ==
                                                                    'Construction') {
                                                                  return columnJobimageRecord!
                                                                      .construction!;
                                                                } else if (_model
                                                                        .jobCategoryValue ==
                                                                    'Garments') {
                                                                  return columnJobimageRecord!
                                                                      .garments!;
                                                                } else if (_model
                                                                        .jobCategoryValue ==
                                                                    'Textile') {
                                                                  return columnJobimageRecord!
                                                                      .textile!;
                                                                } else if (_model
                                                                        .jobCategoryValue ==
                                                                    'Driver') {
                                                                  return columnJobimageRecord!
                                                                      .driver!;
                                                                } else if (_model
                                                                        .jobCategoryValue ==
                                                                    'Home Staff') {
                                                                  return columnJobimageRecord!
                                                                      .homestaff!;
                                                                } else if (_model
                                                                        .jobCategoryValue ==
                                                                    'Agricultural Work') {
                                                                  return columnJobimageRecord!
                                                                      .agri!;
                                                                } else if (_model
                                                                        .jobCategoryValue ==
                                                                    'Restaurant') {
                                                                  return columnJobimageRecord!
                                                                      .restraunt!;
                                                                } else if (_model
                                                                        .jobCategoryValue ==
                                                                    'Automobile') {
                                                                  return columnJobimageRecord!
                                                                      .automobile!;
                                                                } else if (_model
                                                                        .jobCategoryValue ==
                                                                    'Minning') {
                                                                  return columnJobimageRecord!
                                                                      .mining!;
                                                                } else {
                                                                  return 'h';
                                                                }
                                                              }();
                                                            });
                                                          },
                                                          width: 180.0,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1,
                                                          hintText:
                                                              'Job category',
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .outlines,
                                                          borderWidth: 0.0,
                                                          borderRadius: 10.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      16.0),
                                                          hidesUnderline: true,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Job sub category',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      ListView(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        children: [
                                                          if (FFAppState()
                                                                  .jobcategory ==
                                                              'Construction')
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (FFAppState()
                                                                        .jobcategory ==
                                                                    'Construction')
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        options: [
                                                                          'Mason',
                                                                          'Roofer',
                                                                          'Carpenter',
                                                                          'Plumber',
                                                                          'Electrician',
                                                                          'Heavy Equipment Operator',
                                                                          'Ironworker',
                                                                          'Plasterer',
                                                                          'House Painter'
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.jObtitleValue1 = val);
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().jobtitle =
                                                                                _model.jObtitleValue1!;
                                                                          });
                                                                        },
                                                                        width:
                                                                            650.0,
                                                                        height:
                                                                            58.0,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).subtitle1,
                                                                        hintText:
                                                                            'Job sub category',
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).outlines,
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            10.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            22.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          if (FFAppState()
                                                                  .jobcategory ==
                                                              'Minning')
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (FFAppState()
                                                                        .jobcategory ==
                                                                    'Minning')
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        options: [
                                                                          'Fitter',
                                                                          'Plumber',
                                                                          'Minning work',
                                                                          'Load bearer'
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.jObtitleValue2 = val);
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().jobtitle =
                                                                                _model.jObtitleValue2!;
                                                                          });
                                                                        },
                                                                        width:
                                                                            650.0,
                                                                        height:
                                                                            58.0,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).subtitle1,
                                                                        hintText:
                                                                            'Job sub category',
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).outlines,
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            10.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            22.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          if (FFAppState()
                                                                  .jobcategory ==
                                                              'Agricultural Work')
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (FFAppState()
                                                                        .jobcategory ==
                                                                    'Agricultural Work')
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        options: [
                                                                          'Agricultutal Worker'
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.jObtitleValue3 = val);
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().jobtitle =
                                                                                _model.jObtitleValue3!;
                                                                          });
                                                                        },
                                                                        width:
                                                                            650.0,
                                                                        height:
                                                                            58.0,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).subtitle1,
                                                                        hintText:
                                                                            'Job sub category',
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).outlines,
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            10.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            22.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          if (FFAppState()
                                                                  .jobcategory ==
                                                              'Driver')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (FFAppState()
                                                                          .jobcategory ==
                                                                      'Driver')
                                                                    Expanded(
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        options: [
                                                                          '12 wheel Driver',
                                                                          '8 wheel Driver',
                                                                          '4 wheel Driver'
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.jObtitleValue4 = val);
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().jobtitle =
                                                                                _model.jObtitleValue4!;
                                                                          });
                                                                        },
                                                                        width:
                                                                            650.0,
                                                                        height:
                                                                            58.0,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).subtitle1,
                                                                        hintText:
                                                                            'Job sub category',
                                                                        elevation:
                                                                            0.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).outlines,
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            10.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            22.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                                  .jobcategory ==
                                                              'Home Staff')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (FFAppState()
                                                                          .jobcategory ==
                                                                      'Home Staff')
                                                                    Expanded(
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        options: [
                                                                          'Gardening',
                                                                          'House Help',
                                                                          'Cooking'
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.jObtitleValue5 = val);
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().jobtitle =
                                                                                _model.jObtitleValue5!;
                                                                          });
                                                                        },
                                                                        width:
                                                                            650.0,
                                                                        height:
                                                                            58.0,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).subtitle1,
                                                                        hintText:
                                                                            'Job sub category',
                                                                        elevation:
                                                                            0.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).outlines,
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            10.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            22.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                                  .jobcategory ==
                                                              'Garments')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (FFAppState()
                                                                          .jobcategory ==
                                                                      'Garments')
                                                                    Expanded(
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        options: [
                                                                          'Tailor',
                                                                          'Helper',
                                                                          'Packing',
                                                                          'Checking',
                                                                          'Ironing and Packaging',
                                                                          'Printing',
                                                                          'others'
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.jObtitleValue6 = val);
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().jobtitle =
                                                                                _model.jObtitleValue6!;
                                                                          });
                                                                        },
                                                                        width:
                                                                            650.0,
                                                                        height:
                                                                            58.0,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).subtitle1,
                                                                        hintText:
                                                                            'Job sub category',
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).outlines,
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            10.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            22.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                                  .jobcategory ==
                                                              'Restaurant')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (FFAppState()
                                                                          .jobcategory ==
                                                                      'Restaurant')
                                                                    Expanded(
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        options: [
                                                                          'Chef',
                                                                          'Server',
                                                                          'Busser',
                                                                          'Helper',
                                                                          'others'
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.jObtitleValue7 = val);
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().jobtitle =
                                                                                _model.jObtitleValue7!;
                                                                          });
                                                                        },
                                                                        width:
                                                                            650.0,
                                                                        height:
                                                                            58.0,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).subtitle1,
                                                                        hintText:
                                                                            'Job sub category',
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).outlines,
                                                                        borderWidth:
                                                                            2.0,
                                                                        borderRadius:
                                                                            10.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            22.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                                  .jobcategory ==
                                                              'Automobile')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (FFAppState()
                                                                          .jobcategory ==
                                                                      'Automobile')
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          options: [
                                                                            'Welder',
                                                                            'Fabricators',
                                                                            'Installers',
                                                                            'Assambling'
                                                                          ],
                                                                          onChanged:
                                                                              (val) async {
                                                                            setState(() =>
                                                                                _model.jObtitleValue8 = val);
                                                                            FFAppState().update(() {
                                                                              FFAppState().jobtitle = _model.jObtitleValue8!;
                                                                            });
                                                                          },
                                                                          width:
                                                                              650.0,
                                                                          height:
                                                                              58.0,
                                                                          textStyle:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                          hintText:
                                                                              'Job sub category',
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).outlines,
                                                                          borderWidth:
                                                                              2.0,
                                                                          borderRadius:
                                                                              10.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              22.0,
                                                                              4.0,
                                                                              12.0,
                                                                              4.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                                  .jobcategory ==
                                                              'Textile')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (FFAppState()
                                                                          .jobcategory ==
                                                                      'Textile')
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          options: [
                                                                            'Gining',
                                                                            'Weaving',
                                                                            'Spinning',
                                                                            'Knitting',
                                                                            'Dyeing',
                                                                            'others'
                                                                          ],
                                                                          onChanged:
                                                                              (val) async {
                                                                            setState(() =>
                                                                                _model.jObtitleValue9 = val);
                                                                            FFAppState().update(() {
                                                                              FFAppState().jobtitle = _model.jObtitleValue9!;
                                                                            });
                                                                          },
                                                                          width:
                                                                              650.0,
                                                                          height:
                                                                              58.0,
                                                                          textStyle:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                          hintText:
                                                                              'Job sub category',
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).outlines,
                                                                          borderWidth:
                                                                              2.0,
                                                                          borderRadius:
                                                                              10.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              22.0,
                                                                              4.0,
                                                                              12.0,
                                                                              4.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                                      .jobcategory ==
                                                                  null ||
                                                              FFAppState()
                                                                      .jobcategory ==
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if (FFAppState()
                                                                              .jobcategory ==
                                                                          null ||
                                                                      FFAppState()
                                                                              .jobcategory ==
                                                                          '')
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          options: [
                                                                            'others'
                                                                          ],
                                                                          onChanged:
                                                                              (val) async {
                                                                            setState(() =>
                                                                                _model.jObtitleValue10 = val);
                                                                            FFAppState().update(() {
                                                                              FFAppState().jobtitle = _model.jObtitleValue10!;
                                                                            });
                                                                          },
                                                                          width:
                                                                              650.0,
                                                                          height:
                                                                              58.0,
                                                                          textStyle:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                          hintText:
                                                                              'Job sub category',
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).outlines,
                                                                          borderWidth:
                                                                              2.0,
                                                                          borderRadius:
                                                                              10.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              22.0,
                                                                              4.0,
                                                                              12.0,
                                                                              4.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          disabled:
                                                                              FFAppState().jobcategory == null || FFAppState().jobcategory == '',
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
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Job title',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .jobTitleController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Enter job title',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .outlines,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayIcon,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      22.0,
                                                                      20.0,
                                                                      12.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                        textAlign:
                                                            TextAlign.start,
                                                        keyboardType:
                                                            TextInputType
                                                                .emailAddress,
                                                        validator: _model
                                                            .jobTitleControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Job skill level',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      FlutterFlowDropDown<
                                                          String>(
                                                        options: [
                                                          'Less than 1 year',
                                                          '1 to 10 years',
                                                          'More than 10 years'
                                                        ],
                                                        onChanged: (val) =>
                                                            setState(() => _model
                                                                    .prySkillLevelValue =
                                                                val),
                                                        width: double.infinity,
                                                        height: 58.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                        hintText:
                                                            'Job skill Level',
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .outlines,
                                                        borderWidth: 0.0,
                                                        borderRadius: 10.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        hidesUnderline: true,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Job description',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .jobDescriptionController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Enter the job description here',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .outlines,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayIcon,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      32.0,
                                                                      20.0,
                                                                      12.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                        textAlign:
                                                            TextAlign.start,
                                                        validator: _model
                                                            .jobDescriptionControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[a-zA-Z]'))
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Minimum qualification',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 69.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .outlines,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          options: [
                                                            'Below 8th Grade',
                                                            '8th Pass',
                                                            '10th Pass',
                                                            '12th Pass',
                                                            'Graduation',
                                                            'Post Graduation'
                                                          ],
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.minQualificationValue =
                                                                      val),
                                                          width: 180.0,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1,
                                                          hintText:
                                                              'Minimum qualification',
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .outlines,
                                                          borderWidth: 0.0,
                                                          borderRadius: 10.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Mode of salary',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 69.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      2.0,
                                                                      2.0,
                                                                      2.0),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            options: [
                                                              'Daily',
                                                              'Weekly',
                                                              'Monthly'
                                                            ],
                                                            onChanged: (val) =>
                                                                setState(() =>
                                                                    _model.modeofSalaryValue =
                                                                        val),
                                                            width: 180.0,
                                                            height: 50.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1,
                                                            hintText:
                                                                'Mode of salary',
                                                            elevation: 2.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .outlines,
                                                            borderWidth: 0.0,
                                                            borderRadius: 10.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                            hidesUnderline:
                                                                true,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Minimum salary',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .minimumSalaryController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Enter minimum salary',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .textColor50,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .outlines,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayIcon,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      32.0,
                                                                      20.0,
                                                                      12.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                        textAlign:
                                                            TextAlign.start,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .minimumSalaryControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Maximum Salary',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .maximumSalaryController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Enter maximum salary',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .textColor50,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .outlines,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayIcon,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      32.0,
                                                                      20.0,
                                                                      12.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                        textAlign:
                                                            TextAlign.start,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .maximumSalaryControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Vacancies',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .noVacanciesController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Enter no of vacancies',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .textColor50,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .outlines,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayIcon,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      32.0,
                                                                      20.0,
                                                                      12.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                        textAlign:
                                                            TextAlign.start,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .noVacanciesControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Gender',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .outlines,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          options: [
                                                            'Male',
                                                            'Female',
                                                            'Others',
                                                            'Gender Neutral'
                                                          ],
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.genderValue =
                                                                      val),
                                                          width: 180.0,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1,
                                                          hintText:
                                                              'Select the gender',
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 0.0,
                                                          borderRadius: 0.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Working hours',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        controller: _model
                                                            .workHoursController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Enter working hours',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .textColor50,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .outlines,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayIcon,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .red,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      32.0,
                                                                      20.0,
                                                                      12.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                        textAlign:
                                                            TextAlign.start,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .workHoursControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'WORKER AGE',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title2,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 438.0,
                                                                  height: 110.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .outlines,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Minimum age : ',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            _model.minageSliderValue?.toString(),
                                                                            '18',
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .outlines,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            1000.0,
                                                                        child: Slider
                                                                            .adaptive(
                                                                          activeColor:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          inactiveColor:
                                                                              FlutterFlowTheme.of(context).grayIcon,
                                                                          min:
                                                                              18.0,
                                                                          max:
                                                                              59.0,
                                                                          value: _model.minageSliderValue ??=
                                                                              18.0,
                                                                          label: _model
                                                                              .minageSliderValue
                                                                              .toString(),
                                                                          divisions:
                                                                              41,
                                                                          onChanged:
                                                                              (newValue) {
                                                                            newValue =
                                                                                double.parse(newValue.toStringAsFixed(2));
                                                                            setState(() =>
                                                                                _model.minageSliderValue = newValue);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        438.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .outlines,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Maximum age : ',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).subtitle1,
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              _model.maxageSliderValue?.toString(),
                                                                              '60',
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).subtitle1,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).outlines,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: Slider
                                                                            .adaptive(
                                                                          activeColor:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          inactiveColor:
                                                                              FlutterFlowTheme.of(context).grayIcon,
                                                                          min:
                                                                              19.0,
                                                                          max:
                                                                              60.0,
                                                                          value: _model.maxageSliderValue ??=
                                                                              60.0,
                                                                          label: _model
                                                                              .maxageSliderValue
                                                                              .toString(),
                                                                          divisions:
                                                                              41,
                                                                          onChanged:
                                                                              (newValue) {
                                                                            newValue =
                                                                                double.parse(newValue.toStringAsFixed(2));
                                                                            setState(() =>
                                                                                _model.maxageSliderValue = newValue);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 194.1,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .outlines,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'FACILITIES',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title2,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          40.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        232.0,
                                                                    height:
                                                                        172.2,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Theme(
                                                                                      data: ThemeData(
                                                                                        checkboxTheme: CheckboxThemeData(
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(0.0),
                                                                                          ),
                                                                                        ),
                                                                                        unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                      child: Checkbox(
                                                                                        value: _model.foodCheckboxValue ??= false,
                                                                                        onChanged: (newValue) async {
                                                                                          setState(() => _model.foodCheckboxValue = newValue!);
                                                                                          if (newValue!) {
                                                                                            setState(() {
                                                                                              FFAppState().FoodCheck = true;
                                                                                            });
                                                                                          }
                                                                                        },
                                                                                        activeColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      'Food',
                                                                                      style: FlutterFlowTheme.of(context).subtitle1,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Theme(
                                                                                        data: ThemeData(
                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                                            ),
                                                                                          ),
                                                                                          unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                        child: Checkbox(
                                                                                          value: _model.transportationCheckboxValue ??= false,
                                                                                          onChanged: (newValue) async {
                                                                                            setState(() => _model.transportationCheckboxValue = newValue!);
                                                                                            if (newValue!) {
                                                                                              setState(() {
                                                                                                FFAppState().transportationcheck = true;
                                                                                              });
                                                                                            }
                                                                                          },
                                                                                          activeColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Transportation',
                                                                                        style: FlutterFlowTheme.of(context).subtitle1,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Theme(
                                                                                    data: ThemeData(
                                                                                      checkboxTheme: CheckboxThemeData(
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(0.0),
                                                                                        ),
                                                                                      ),
                                                                                      unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                    child: Checkbox(
                                                                                      value: _model.lodgingCheckboxValue ??= false,
                                                                                      onChanged: (newValue) async {
                                                                                        setState(() => _model.lodgingCheckboxValue = newValue!);
                                                                                        if (newValue!) {
                                                                                          setState(() {
                                                                                            FFAppState().AccomodationCheck = true;
                                                                                          });
                                                                                        }
                                                                                      },
                                                                                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Lodging',
                                                                                    style: FlutterFlowTheme.of(context).subtitle1,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Theme(
                                                                                data: ThemeData(
                                                                                  checkboxTheme: CheckboxThemeData(
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  unselectedWidgetColor: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                                child: Checkbox(
                                                                                  value: _model.medicalCheckboxValue ??= false,
                                                                                  onChanged: (newValue) async {
                                                                                    setState(() => _model.medicalCheckboxValue = newValue!);
                                                                                    if (newValue!) {
                                                                                      setState(() {
                                                                                        FFAppState().medicalcheck = true;
                                                                                      });
                                                                                    }
                                                                                  },
                                                                                  activeColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Medical',
                                                                                style: FlutterFlowTheme.of(context).subtitle1,
                                                                              ),
                                                                            ],
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.75,
                                                                      0.45),
                                                              child: Text(
                                                                'JOB DURATION',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: 500.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .outlines,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Start Date :',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (_model
                                                                          .datePicked1 !=
                                                                      null)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions.ddmmyyyy(dateTimeFormat(
                                                                              'yMd',
                                                                              _model.datePicked1)),
                                                                          'dd',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .outlines,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    if (kIsWeb) {
                                                                      final _datePicked1Date =
                                                                          await showDatePicker(
                                                                        context:
                                                                            context,
                                                                        initialDate:
                                                                            getCurrentTimestamp,
                                                                        firstDate:
                                                                            getCurrentTimestamp,
                                                                        lastDate:
                                                                            DateTime(2050),
                                                                      );

                                                                      if (_datePicked1Date !=
                                                                          null) {
                                                                        setState(
                                                                            () {
                                                                          _model.datePicked1 =
                                                                              DateTime(
                                                                            _datePicked1Date.year,
                                                                            _datePicked1Date.month,
                                                                            _datePicked1Date.day,
                                                                          );
                                                                        });
                                                                      }
                                                                    } else {
                                                                      await DatePicker
                                                                          .showDatePicker(
                                                                        context,
                                                                        showTitleActions:
                                                                            true,
                                                                        onConfirm:
                                                                            (date) {
                                                                          setState(
                                                                              () {
                                                                            _model.datePicked1 =
                                                                                date;
                                                                          });
                                                                        },
                                                                        currentTime:
                                                                            getCurrentTimestamp,
                                                                        minTime:
                                                                            getCurrentTimestamp,
                                                                      );
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .calendar_today,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: 500.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .outlines,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'End Date :',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                            .datePicked2 !=
                                                                        null)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.ddmmyyyy(dateTimeFormat('yMd',
                                                                                _model.datePicked2)),
                                                                            'dd',
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).subtitle1,
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              0.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .outlines,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      if (kIsWeb) {
                                                                        final _datePicked2Date =
                                                                            await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              _model.datePicked1!,
                                                                          firstDate:
                                                                              _model.datePicked1!,
                                                                          lastDate:
                                                                              DateTime(2050),
                                                                        );

                                                                        if (_datePicked2Date !=
                                                                            null) {
                                                                          setState(
                                                                              () {
                                                                            _model.datePicked2 =
                                                                                DateTime(
                                                                              _datePicked2Date.year,
                                                                              _datePicked2Date.month,
                                                                              _datePicked2Date.day,
                                                                            );
                                                                          });
                                                                        }
                                                                      } else {
                                                                        await DatePicker
                                                                            .showDatePicker(
                                                                          context,
                                                                          showTitleActions:
                                                                              true,
                                                                          onConfirm:
                                                                              (date) {
                                                                            setState(() {
                                                                              _model.datePicked2 = date;
                                                                            });
                                                                          },
                                                                          currentTime:
                                                                              _model.datePicked1!,
                                                                          minTime:
                                                                              _model.datePicked1!,
                                                                        );
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .calendar_today,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
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
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .jobaddressModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              JobaddressWidget(),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 120.0,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 16.0),
                                child: InkWell(
                                  onDoubleTap: () async {
                                    if ((_model
                                                    .jobaddressModel
                                                    .pincodefieldController
                                                    .text !=
                                                null &&
                                            _model
                                                    .jobaddressModel
                                                    .pincodefieldController
                                                    .text !=
                                                '') &&
                                        (_model.jobaddressModel
                                                    .areadropdownValue !=
                                                null &&
                                            _model.jobaddressModel
                                                    .areadropdownValue !=
                                                '')) {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.jobCategoryValue == null) {
                                        return;
                                      }
                                      if (_model.prySkillLevelValue == null) {
                                        return;
                                      }
                                      if (_model.minQualificationValue ==
                                          null) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Field required'),
                                              content: Text(
                                                  'Min qualification is required'),
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
                                        return;
                                      }
                                      if (_model.modeofSalaryValue == null) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Field required'),
                                              content: Text(
                                                  'mode of salary is required'),
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
                                        return;
                                      }
                                      if (_model.genderValue == null) {
                                        return;
                                      }
                                      if (_model.datePicked1 == null) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Date is required'),
                                              content: Text('Choose a date'),
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
                                        return;
                                      }
                                      if (_model.datePicked2 == null) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Field required'),
                                              content: Text('Choose a date'),
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
                                        return;
                                      }

                                      final jobsCreateData =
                                          createJobsRecordData(
                                        jobDescription: _model
                                            .jobDescriptionController.text,
                                        primarySkillLevel:
                                            _model.prySkillLevelValue,
                                        organisationName:
                                            widget.orgdetails!.organisationName,
                                        jobTitle:
                                            _model.jobTitleController.text,
                                        modeOfSalary: _model.modeofSalaryValue,
                                        jobCategory: _model.jobCategoryValue,
                                        pinCode: _model.jobaddressModel
                                            .pincodefieldController.text,
                                        area: _model
                                            .jobaddressModel.areadropdownValue,
                                        district: FFAppState().district,
                                        state: FFAppState().state,
                                        numberOfVacancies:
                                            _model.noVacanciesController.text,
                                        workingHours:
                                            _model.workHoursController.text,
                                        gender: _model.genderValue,
                                        minSalary:
                                            _model.minimumSalaryController.text,
                                        maxSalary:
                                            _model.maximumSalaryController.text,
                                        minAge: _model.minageSliderValue
                                            ?.toString(),
                                        maxAge: _model.maxageSliderValue
                                            ?.toString(),
                                        food: FFAppState().FoodCheck == false
                                            ? 'unavailable'
                                            : 'available',
                                        lodging:
                                            FFAppState().AccomodationCheck ==
                                                    false
                                                ? 'unavailable'
                                                : 'available',
                                        transportation:
                                            FFAppState().transportationcheck ==
                                                    false
                                                ? 'unavailable'
                                                : 'available',
                                        medical:
                                            FFAppState().medicalcheck == false
                                                ? 'unavailable'
                                                : 'available',
                                        jobSubCateg: FFAppState().jobtitle,
                                        orgRefId: widget.orgdetails!.reference,
                                        jobImage: FFAppState().profilepic,
                                        startDate: _model.datePicked1,
                                        endDate: _model.datePicked2,
                                        minQualification:
                                            _model.minQualificationValue,
                                        jobStatus: '1',
                                      );
                                      await JobsRecord.createDoc(
                                              widget.orgdetails!.reference)
                                          .set(jobsCreateData);

                                      context.pushNamed('OrganisationListCopy');

                                      setState(() {
                                        FFAppState().profilepic = '';
                                      });
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Alert'),
                                            content: Text(
                                                'Address details are not set'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if ((_model
                                                      .jobaddressModel
                                                      .pincodefieldController
                                                      .text !=
                                                  null &&
                                              _model
                                                      .jobaddressModel
                                                      .pincodefieldController
                                                      .text !=
                                                  '') &&
                                          (_model.jobaddressModel
                                                      .areadropdownValue !=
                                                  null &&
                                              _model.jobaddressModel
                                                      .areadropdownValue !=
                                                  '')) {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        if (_model.jobCategoryValue == null) {
                                          return;
                                        }
                                        if (_model.prySkillLevelValue == null) {
                                          return;
                                        }
                                        if (_model.minQualificationValue ==
                                            null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Field required'),
                                                content: Text(
                                                    'Min qualification is required'),
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
                                          return;
                                        }
                                        if (_model.modeofSalaryValue == null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Field required'),
                                                content: Text(
                                                    'mode of salary is required'),
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
                                          return;
                                        }
                                        if (_model.genderValue == null) {
                                          return;
                                        }
                                        if (_model.datePicked1 == null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Date is required'),
                                                content: Text('Choose a date'),
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
                                          return;
                                        }
                                        if (_model.datePicked2 == null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Field required'),
                                                content: Text('Choose a date'),
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
                                          return;
                                        }

                                        final jobsCreateData =
                                            createJobsRecordData(
                                          jobDescription: _model
                                              .jobDescriptionController.text,
                                          primarySkillLevel:
                                              _model.prySkillLevelValue,
                                          organisationName: widget
                                              .orgdetails!.organisationName,
                                          jobTitle:
                                              _model.jobTitleController.text,
                                          modeOfSalary:
                                              _model.modeofSalaryValue,
                                          jobCategory: _model.jobCategoryValue,
                                          pinCode: _model.jobaddressModel
                                              .pincodefieldController.text,
                                          area: _model.jobaddressModel
                                              .areadropdownValue,
                                          district: FFAppState().district,
                                          state: FFAppState().state,
                                          numberOfVacancies:
                                              _model.noVacanciesController.text,
                                          workingHours:
                                              _model.workHoursController.text,
                                          gender: _model.genderValue,
                                          minSalary: _model
                                              .minimumSalaryController.text,
                                          maxSalary: _model
                                              .maximumSalaryController.text,
                                          minAge: _model.minageSliderValue
                                              ?.toString(),
                                          maxAge: _model.maxageSliderValue
                                              ?.toString(),
                                          food: FFAppState().FoodCheck == false
                                              ? 'unavailable'
                                              : 'available',
                                          lodging:
                                              FFAppState().AccomodationCheck ==
                                                      false
                                                  ? 'unavailable'
                                                  : 'available',
                                          transportation: FFAppState()
                                                      .transportationcheck ==
                                                  false
                                              ? 'unavailable'
                                              : 'available',
                                          medical:
                                              FFAppState().medicalcheck == false
                                                  ? 'unavailable'
                                                  : 'available',
                                          jobSubCateg: FFAppState().jobtitle,
                                          orgRefId:
                                              widget.orgdetails!.reference,
                                          jobImage: FFAppState().profilepic,
                                          startDate: _model.datePicked1,
                                          endDate: _model.datePicked2,
                                          minQualification:
                                              _model.minQualificationValue,
                                          jobStatus: '1',
                                        );
                                        await JobsRecord.createDoc(
                                                widget.orgdetails!.reference)
                                            .set(jobsCreateData);

                                        context
                                            .pushNamed('OrganisationListCopy');

                                        setState(() {
                                          FFAppState().profilepic = '';
                                        });
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Alert'),
                                              content: Text(
                                                  'Address details are not set'),
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
                                      }
                                    },
                                    text: 'SAVE',
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 60.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        wrapWithModel(
                          model: _model.bottombarModel,
                          updateCallback: () => setState(() {}),
                          child: BottombarWidget(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
