import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'addjob_copy_model.dart';
export 'addjob_copy_model.dart';

class AddjobCopyWidget extends StatefulWidget {
  const AddjobCopyWidget({
    Key? key,
    this.orgpage,
    this.orgpageref,
  }) : super(key: key);

  final OrganisationsRecord? orgpage;
  final DocumentReference? orgpageref;

  @override
  _AddjobCopyWidgetState createState() => _AddjobCopyWidgetState();
}

class _AddjobCopyWidgetState extends State<AddjobCopyWidget> {
  late AddjobCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddjobCopyModel());

    _model.descriptionController = TextEditingController();
    _model.numberofopeningController = TextEditingController();
    _model.workinghoursController = TextEditingController();
    _model.minagetextController = TextEditingController();
    _model.maxagetextController = TextEditingController();
    _model.minsaltextController = TextEditingController();
    _model.maxsaltextController = TextEditingController();
    _model.pincodeController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 20, 0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).accent1,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                        ),
                        SelectionArea(
                            child: Text(
                          'Add Job  Details',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 30,
                                  ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(500, 5, 500, 0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25, 0, 30, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.05, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    400, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
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
                                                  setState(() =>
                                                      _model.isMediaUploading1 =
                                                          true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];
                                                  var downloadUrls = <String>[];
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

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isMediaUploading1 =
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
                                                      _model.uploadedLocalFile1 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl1 =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                setState(() {
                                                  FFAppState().jobpic =
                                                      _model.uploadedFileUrl1;
                                                });
                                              },
                                              child: Container(
                                                width: 260,
                                                height: 260,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .green,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.asset(
                                                      'assets/images/generic_photo.jpg',
                                                    ).image,
                                                  ),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFFBBBBBB),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1,
                                                                              -1),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            20,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .upload_sharp,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Upload \nthe picture',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            if (FFAppState()
                                                                        .jobpic !=
                                                                    null &&
                                                                FFAppState()
                                                                        .jobpic !=
                                                                    '')
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.05,
                                                                        -0.68),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            260),
                                                                    child: Image
                                                                        .network(
                                                                      FFAppState()
                                                                          .jobpic,
                                                                      width:
                                                                          259.6,
                                                                      height:
                                                                          254.7,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        if (FFAppState()
                                                                    .jobpic !=
                                                                null &&
                                                            FFAppState()
                                                                    .jobpic !=
                                                                '')
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.54, 1.16),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Alert !'),
                                                                              content: Text('Do you want to delete Profile photo?'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('No'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('Yes'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                                if (confirmDialogResponse) {
                                                                  setState(() {
                                                                    FFAppState()
                                                                        .jobpic = '';
                                                                  });
                                                                  return;
                                                                } else {
                                                                  return;
                                                                }
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .delete_forever,
                                                                color: Colors
                                                                    .black,
                                                                size: 54,
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    if (FFAppState().jobpic !=
                                                            null &&
                                                        FFAppState().jobpic !=
                                                            '')
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.45, 1.05),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Alert !'),
                                                                          content:
                                                                              Text('Do you want to change the Profile photo?'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('No'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Yes'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .jobpic = '';
                                                              });
                                                              if (FFAppState()
                                                                          .jobpic ==
                                                                      null ||
                                                                  FFAppState()
                                                                          .jobpic ==
                                                                      '') {
                                                                final selectedMedia =
                                                                    await selectMediaWithSourceBottomSheet(
                                                                  context:
                                                                      context,
                                                                  allowPhoto:
                                                                      true,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  textColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  pickerFontFamily:
                                                                      'Lato',
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  setState(() =>
                                                                      _model.isMediaUploading2 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];
                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    _model.isMediaUploading2 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    setState(
                                                                        () {
                                                                      _model.uploadedLocalFile2 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl2 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .jobpic =
                                                                      _model
                                                                          .uploadedFileUrl2;
                                                                });
                                                              } else {
                                                                return;
                                                              }
                                                            } else {
                                                              return;
                                                            }
                                                          },
                                                          child: Icon(
                                                            Icons.edit,
                                                            color: Colors.black,
                                                            size: 44,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 220, 0, 0),
                                          child: Text(
                                            'Add/edit the  photo here ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 20,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 80, 0),
                                      child: Container(
                                        width: 548.1,
                                        height: 44.2,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Industrial category',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowDropDown<String>(
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
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.orgsecdropValue = val);
                                        FFAppState().update(() {
                                          FFAppState().jobcategory =
                                              _model.orgsecdropValue!;
                                        });
                                      },
                                      width: 640,
                                      height: 95,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                          ),
                                      hintText:
                                          'Sector category of the industry',
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .textColor50,
                                      borderWidth: 0,
                                      borderRadius: 44,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 80, 0),
                                      child: Container(
                                        width: 548.1,
                                        height: 44.2,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Job title',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  if (FFAppState().jobcategory ==
                                      'Construction')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (FFAppState().jobcategory ==
                                            'Construction')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: FlutterFlowDropDown<String>(
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
                                              onChanged: (val) async {
                                                setState(() => _model
                                                    .jObtitleValue1 = val);
                                                FFAppState().update(() {
                                                  FFAppState().jobtitle =
                                                      _model.jObtitleValue1!;
                                                });
                                              },
                                              width: 650,
                                              height: 75,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              hintText: 'Job Title',
                                              fillColor: Colors.white,
                                              elevation: 0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .exampleText,
                                              borderWidth: 0,
                                              borderRadius: 44,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(22, 4, 12, 4),
                                              hidesUnderline: true,
                                            ),
                                          ),
                                      ],
                                    ),
                                  if (FFAppState().jobcategory == 'Minning')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().jobcategory ==
                                              'Minning')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                options: [
                                                  'Fitter',
                                                  'Plumber',
                                                  'Minning work',
                                                  'Load bearer'
                                                ],
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .jObtitleValue2 = val);
                                                  FFAppState().update(() {
                                                    FFAppState().jobtitle =
                                                        _model.jObtitleValue2!;
                                                  });
                                                },
                                                width: 650,
                                                height: 75,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText: 'Job Title',
                                                fillColor: Colors.white,
                                                elevation: 0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .exampleText,
                                                borderWidth: 0,
                                                borderRadius: 44,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(22, 4, 12, 4),
                                                hidesUnderline: true,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (FFAppState().jobcategory ==
                                      'Agricultural Work')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().jobcategory ==
                                              'Agricultural Work')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                options: [
                                                  'Agricultutal Worker'
                                                ],
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .jObtitleValue3 = val);
                                                  FFAppState().update(() {
                                                    FFAppState().jobtitle =
                                                        _model.jObtitleValue3!;
                                                  });
                                                },
                                                width: 650,
                                                height: 75,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText: 'Job Title',
                                                fillColor: Colors.white,
                                                elevation: 0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .exampleText,
                                                borderWidth: 0,
                                                borderRadius: 44,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(22, 4, 12, 4),
                                                hidesUnderline: true,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (FFAppState().jobcategory == 'Driver')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().jobcategory ==
                                              'Driver')
                                            FlutterFlowDropDown<String>(
                                              options: [
                                                '12 wheel Driver',
                                                '8 wheel Driver',
                                                '4 wheel Driver'
                                              ],
                                              onChanged: (val) async {
                                                setState(() => _model
                                                    .jObtitleValue4 = val);
                                                FFAppState().update(() {
                                                  FFAppState().jobtitle =
                                                      _model.jObtitleValue4!;
                                                });
                                              },
                                              width: 650,
                                              height: 75,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              hintText: 'Job Title',
                                              fillColor: Colors.white,
                                              elevation: 0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .exampleText,
                                              borderWidth: 0,
                                              borderRadius: 44,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(22, 4, 12, 4),
                                              hidesUnderline: true,
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (FFAppState().jobcategory == 'Home Staff')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().jobcategory ==
                                              'Home Staff')
                                            FlutterFlowDropDown<String>(
                                              options: [
                                                'Gardening',
                                                'House Help',
                                                'Cooking'
                                              ],
                                              onChanged: (val) async {
                                                setState(() => _model
                                                    .jObtitleValue5 = val);
                                                FFAppState().update(() {
                                                  FFAppState().jobtitle =
                                                      _model.jObtitleValue5!;
                                                });
                                              },
                                              width: 650,
                                              height: 75,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              hintText: 'Job Title',
                                              fillColor: Colors.white,
                                              elevation: 0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .exampleText,
                                              borderWidth: 0,
                                              borderRadius: 44,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(22, 4, 12, 4),
                                              hidesUnderline: true,
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (FFAppState().jobcategory == 'Garments')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().jobcategory ==
                                              'Garments')
                                            FlutterFlowDropDown<String>(
                                              options: [
                                                'Tailor',
                                                'Helper',
                                                'Packing',
                                                'Checking',
                                                'Ironing and Packaging',
                                                'Printing',
                                                'others'
                                              ],
                                              onChanged: (val) async {
                                                setState(() => _model
                                                    .jObtitleValue6 = val);
                                                FFAppState().update(() {
                                                  FFAppState().jobtitle =
                                                      _model.jObtitleValue6!;
                                                });
                                              },
                                              width: 650,
                                              height: 75,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              hintText: 'Job Title',
                                              fillColor: Colors.white,
                                              elevation: 0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .exampleText,
                                              borderWidth: 0,
                                              borderRadius: 44,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(22, 4, 12, 4),
                                              hidesUnderline: true,
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (FFAppState().jobcategory == 'Restaurant')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().jobcategory ==
                                              'Restaurant')
                                            FlutterFlowDropDown<String>(
                                              options: [
                                                'Chef',
                                                'Server',
                                                'Busser',
                                                'Helper',
                                                'others'
                                              ],
                                              onChanged: (val) async {
                                                setState(() => _model
                                                    .jObtitleValue7 = val);
                                                FFAppState().update(() {
                                                  FFAppState().jobtitle =
                                                      _model.jObtitleValue7!;
                                                });
                                              },
                                              width: 650,
                                              height: 75,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              hintText: 'Job Title',
                                              fillColor: Colors.white,
                                              elevation: 0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .exampleText,
                                              borderWidth: 0,
                                              borderRadius: 44,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(22, 4, 12, 4),
                                              hidesUnderline: true,
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (FFAppState().jobcategory == 'Automobile')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().jobcategory ==
                                              'Automobile')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                options: [
                                                  'Welder',
                                                  'Fabricators',
                                                  'Installers',
                                                  'Assambling'
                                                ],
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .jObtitleValue8 = val);
                                                  FFAppState().update(() {
                                                    FFAppState().jobtitle =
                                                        _model.jObtitleValue8!;
                                                  });
                                                },
                                                width: 650,
                                                height: 75,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText: 'Job Title',
                                                fillColor: Colors.white,
                                                elevation: 0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .exampleText,
                                                borderWidth: 0,
                                                borderRadius: 44,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(22, 4, 12, 4),
                                                hidesUnderline: true,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (FFAppState().jobcategory == 'Textile')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().jobcategory ==
                                              'Textile')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                options: [
                                                  'Gining',
                                                  'Weaving',
                                                  'Spinning',
                                                  'Knitting',
                                                  'Dyeing',
                                                  'others'
                                                ],
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .jObtitleValue9 = val);
                                                  FFAppState().update(() {
                                                    FFAppState().jobtitle =
                                                        _model.jObtitleValue9!;
                                                  });
                                                },
                                                width: 650,
                                                height: 75,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText: 'Job Title',
                                                fillColor: Colors.white,
                                                elevation: 0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .exampleText,
                                                borderWidth: 0,
                                                borderRadius: 44,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(22, 4, 12, 4),
                                                hidesUnderline: true,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (FFAppState().jobcategory == null ||
                                      FFAppState().jobcategory == '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (FFAppState().jobcategory ==
                                                  null ||
                                              FFAppState().jobcategory == '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                options: ['others'],
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .jObtitleValue10 = val);
                                                  FFAppState().update(() {
                                                    FFAppState().jobtitle =
                                                        _model.jObtitleValue10!;
                                                  });
                                                },
                                                width: 650,
                                                height: 75,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText: 'Job Title',
                                                fillColor: Colors.white,
                                                elevation: 0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .exampleText,
                                                borderWidth: 0,
                                                borderRadius: 44,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(22, 4, 12, 4),
                                                hidesUnderline: true,
                                                disabled: FFAppState()
                                                            .jobcategory ==
                                                        null ||
                                                    FFAppState().jobcategory ==
                                                        '',
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 80, 0),
                                      child: Container(
                                        width: 548.1,
                                        height: 44.2,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Job description',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ],
                                        ),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Container(
                                        width: 638,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(44),
                                          border: Border.all(
                                            color: Color(0xFFA0A0A0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: _model
                                                    .descriptionController,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  hintText:
                                                      'Enter the job description',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText2,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              20, 2, 0, 0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                keyboardType:
                                                    TextInputType.name,
                                                validator: _model
                                                    .descriptionControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-1, -0.6),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 10, 0, 0),
                                        child: FlutterFlowDropDown<String>(
                                          initialOption: _model.genderValue ??=
                                              '',
                                          options: ['MALE', 'FEMALE', 'OTHERS'],
                                          optionLabels: [
                                            'MALE',
                                            'FEMALE',
                                            'OTHERS'
                                          ],
                                          onChanged: (val) => setState(
                                              () => _model.genderValue = val),
                                          width: 650,
                                          height: 70,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 2,
                                                  ),
                                          hintText: 'Gender',
                                          fillColor: Colors.white,
                                          elevation: 2,
                                          borderColor: Color(0xFFA0A0A0),
                                          borderWidth: 0,
                                          borderRadius: 44,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 4, 12, 4),
                                          hidesUnderline: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30, 10, 20, 0),
                                      child: Container(
                                        width: 300,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(44),
                                          border: Border.all(
                                            color: Color(0xFFA0A0A0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .numberofopeningController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.numberofopeningController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => setState(() {}),
                                                  ),
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Number of openings',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 0, 0),
                                                    suffixIcon: _model
                                                            .numberofopeningController!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .numberofopeningController
                                                                  ?.clear();
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: Color(
                                                                  0xFF757575),
                                                              size: 22,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  validator: _model
                                                      .numberofopeningControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 10, 0, 0),
                                      child: Container(
                                        width: 300,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(44),
                                          border: Border.all(
                                            color: Color(0xFFA0A0A0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .workinghoursController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.workinghoursController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => setState(() {}),
                                                  ),
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'workinghours',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 0, 0),
                                                    suffixIcon: _model
                                                            .workinghoursController!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .workinghoursController
                                                                  ?.clear();
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: Color(
                                                                  0xFF757575),
                                                              size: 22,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  validator: _model
                                                      .workinghoursControllerValidator
                                                      .asValidator(context),
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 80, 0),
                                      child: Container(
                                        width: 548.1,
                                        height: 44.2,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Job duration',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (kIsWeb) {
                                          final _datePicked1Date =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: getCurrentTimestamp,
                                            firstDate: getCurrentTimestamp,
                                            lastDate: DateTime(2050),
                                          );

                                          if (_datePicked1Date != null) {
                                            setState(() {
                                              _model.datePicked1 = DateTime(
                                                _datePicked1Date.year,
                                                _datePicked1Date.month,
                                                _datePicked1Date.day,
                                              );
                                            });
                                          }
                                        } else {
                                          await DatePicker.showDatePicker(
                                            context,
                                            showTitleActions: true,
                                            onConfirm: (date) {
                                              setState(() {
                                                _model.datePicked1 = date;
                                              });
                                            },
                                            currentTime: getCurrentTimestamp,
                                            minTime: getCurrentTimestamp,
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 300,
                                        height: 75,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(44),
                                          border: Border.all(
                                            color: Color(0xFFA0A0A0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (dateTimeFormat('d/M/y',
                                                          _model.datePicked1) ==
                                                      null ||
                                                  dateTimeFormat('d/M/y',
                                                          _model.datePicked1) ==
                                                      '')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'Start date',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  )),
                                                ),
                                              if (dateTimeFormat('d/M/y',
                                                          _model.datePicked1) !=
                                                      null &&
                                                  dateTimeFormat('d/M/y',
                                                          _model.datePicked1) !=
                                                      '')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    valueOrDefault<String>(
                                                      functions.ddmmyyFormat(
                                                          dateTimeFormat(
                                                              'yMd',
                                                              _model
                                                                  .datePicked1)),
                                                      'dd',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  )),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 10, 5, 20),
                                        child: InkWell(
                                          onTap: () async {
                                            if (kIsWeb) {
                                              final _datePicked2Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: getCurrentTimestamp,
                                                lastDate: DateTime(2050),
                                              );

                                              if (_datePicked2Date != null) {
                                                setState(() {
                                                  _model.datePicked2 = DateTime(
                                                    _datePicked2Date.year,
                                                    _datePicked2Date.month,
                                                    _datePicked2Date.day,
                                                  );
                                                });
                                              }
                                            } else {
                                              await DatePicker.showDatePicker(
                                                context,
                                                showTitleActions: true,
                                                onConfirm: (date) {
                                                  setState(() {
                                                    _model.datePicked2 = date;
                                                  });
                                                },
                                                currentTime:
                                                    getCurrentTimestamp,
                                                minTime: getCurrentTimestamp,
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: 300,
                                            height: 75,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(44),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: Color(0xFFA0A0A0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (dateTimeFormat(
                                                              'd/M/y',
                                                              _model
                                                                  .datePicked2) ==
                                                          null ||
                                                      dateTimeFormat(
                                                              'd/M/y',
                                                              _model
                                                                  .datePicked2) ==
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  30, 0, 0, 0),
                                                      child: Text(
                                                        'End date',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                  if (dateTimeFormat(
                                                              'd/M/y',
                                                              _model
                                                                  .datePicked2) !=
                                                          null &&
                                                      dateTimeFormat(
                                                              'd/M/y',
                                                              _model
                                                                  .datePicked2) !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20, 0, 0, 0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          functions.ddmmyyFormat(
                                                              dateTimeFormat(
                                                                  'yMd',
                                                                  _model
                                                                      .datePicked2)),
                                                          'dd',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 80, 0),
                                      child: Container(
                                        width: 548.1,
                                        height: 44.2,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Age criteria',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 281.5,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(44),
                                        border: Border.all(
                                          color: Color(0xFFA0A0A0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 2),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    _model.minagetextController,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Minimum age',
                                                  hintText:
                                                      'Enter the minimum age',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText2,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .minagetextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 20, 0),
                                              child: Text(
                                                'yrs',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          70, 0, 0, 0),
                                      child: Container(
                                        width: 278.9,
                                        height: 75,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(44),
                                          border: Border.all(
                                            color: Color(0xFFA0A0A0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: _model
                                                      .maxagetextController,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Maximum age',
                                                    hintText:
                                                        'Enter the minimum age',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: _model
                                                      .maxagetextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp('[0-9]'))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 20, 0),
                                                child: Text(
                                                  'yrs',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 80, 0),
                                      child: Container(
                                        width: 548.1,
                                        height: 44.2,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Pay scale',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ],
                                        ),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: FlutterFlowDropDown<String>(
                                        options: ['Weekly', 'Monthly', 'Daily'],
                                        onChanged: (val) => setState(
                                            () => _model.salaryValue = val),
                                        width: 670,
                                        height: 70,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText: 'Salary type',
                                        fillColor: Colors.white,
                                        elevation: 2,
                                        borderColor: Color(0xFFA0A0A0),
                                        borderWidth: 0,
                                        borderRadius: 44,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            20, 4, 12, 4),
                                        hidesUnderline: true,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 281.5,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(44),
                                        border: Border.all(
                                          color: Color(0xFFA0A0A0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 2),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    _model.minsaltextController,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Minimumsalary',
                                                  hintText:
                                                      'Enter the minimum salary',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText2,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .minsaltextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          100, 0, 0, 0),
                                      child: Container(
                                        width: 281.5,
                                        height: 75,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(44),
                                          border: Border.all(
                                            color: Color(0xFFA0A0A0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: _model
                                                      .maxsaltextController,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Maximumsalary',
                                                    hintText:
                                                        'Enter the maximum salary',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: _model
                                                      .maxsaltextControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp('[0-9]'))
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 80, 0),
                                      child: Container(
                                        width: 548.1,
                                        height: 44.2,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Key skills',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterFlowDropDown<String>(
                                    options: ['skill 1 ', 'skill 2', 'skill 3'],
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.skilldropValue = val);
                                      FFAppState().update(() {
                                        FFAppState().jobcategory =
                                            _model.skilldropValue!;
                                      });
                                    },
                                    width: 640,
                                    height: 65,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                        ),
                                    hintText: 'Sector the skill type',
                                    fillColor: Colors.white,
                                    elevation: 2,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .textColor50,
                                    borderWidth: 0,
                                    borderRadius: 44,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12, 4, 12, 4),
                                    hidesUnderline: true,
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowDropDown<String>(
                                      options: [
                                        'less than 1 year',
                                        ' 1  year',
                                        ' 2  year',
                                        ' 3 years',
                                        ' 4  years',
                                        ' 5  years',
                                        ' 6  years',
                                        ' 7  years',
                                        ' 8  years',
                                        '9 years',
                                        'more than 10 years'
                                      ],
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.skilllevelValue = val);
                                        FFAppState().update(() {
                                          FFAppState().jobcategory =
                                              _model.skilllevelValue!;
                                        });
                                      },
                                      width: 640,
                                      height: 65,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                          ),
                                      hintText: 'Sector the skill level',
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .textColor50,
                                      borderWidth: 0,
                                      borderRadius: 44,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                      disabled: _model.skilldropValue == null ||
                                          _model.skilldropValue == '',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 80, 0),
                                      child: Container(
                                        width: 548.1,
                                        height: 44.2,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Job qualification',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ],
                                        ),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowDropDown<String>(
                                      options: [
                                        '8th Pass',
                                        '10th Pass',
                                        ' 12th Pass',
                                        'Graduation',
                                        'Post graduation'
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .highestqualiDropDownValue = val),
                                      width: 660,
                                      height: 70,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                          ),
                                      hintText: 'Select the job qualification',
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .textcolor15,
                                      borderWidth: 0,
                                      borderRadius: 44,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 80, 0),
                                      child: Container(
                                        width: 548.1,
                                        height: 44.2,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Address',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30, 0, 0, 0),
                                    child: Container(
                                      width: 643,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(44),
                                        border: Border.all(
                                          color: Color(0xFFA0A0A0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  _model.pincodeController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.pincodeController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  // setPINCODE
                                                  FFAppState().update(() {
                                                    FFAppState().jobpin = _model
                                                        .pincodeController.text;
                                                  });
                                                  // callAPI
                                                  _model.address =
                                                      await LocationAPICall
                                                          .call(
                                                    pinCode:
                                                        FFAppState().jobpin,
                                                  );

                                                  setState(() {});
                                                },
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Pincode',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                hintText: 'Enter the pincode',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20, 2, 0, 0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                              keyboardType: TextInputType.name,
                                              validator: _model
                                                  .pincodeControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (_model.pincodeController.text != null &&
                                  _model.pincodeController.text != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30, 10, 0, 0),
                                        child: Container(
                                          width: 646.8,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(44),
                                            border: Border.all(
                                              color: Color(0xFFA0A0A0),
                                            ),
                                          ),
                                          child: Visibility(
                                            visible: _model.pincodeController
                                                        .text !=
                                                    null &&
                                                _model.pincodeController.text !=
                                                    '',
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 15, 0, 0),
                                              child: SelectionArea(
                                                  child: Text(
                                                LocationAPICall.area(
                                                  (_model.address?.jsonBody ??
                                                      ''),
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (_model.pincodeController.text != null &&
                                  _model.pincodeController.text != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30, 10, 0, 0),
                                          child: Container(
                                            width: 652.9,
                                            height: 105.4,
                                            constraints: BoxConstraints(
                                              maxHeight: 76,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(44),
                                              border: Border.all(
                                                color: Color(0xFFA0A0A0),
                                              ),
                                            ),
                                            child: Visibility(
                                              visible: _model.pincodeController
                                                          .text !=
                                                      null &&
                                                  _model.pincodeController
                                                          .text !=
                                                      '',
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 15, 0, 0),
                                                child: SelectionArea(
                                                    child: Text(
                                                  LocationAPICall.district(
                                                    (_model.address?.jsonBody ??
                                                        ''),
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (_model.pincodeController.text != null &&
                                  _model.pincodeController.text != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30, 10, 0, 0),
                                        child: Container(
                                          width: 659.9,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(44),
                                            border: Border.all(
                                              color: Color(0xFFA0A0A0),
                                            ),
                                          ),
                                          child: Visibility(
                                            visible: _model.pincodeController
                                                        .text !=
                                                    null &&
                                                _model.pincodeController.text !=
                                                    '',
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 15, 0, 0),
                                              child: SelectionArea(
                                                  child: Text(
                                                LocationAPICall.state(
                                                  (_model.address?.jsonBody ??
                                                      ''),
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              )),
                                            ),
                                          ),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 80, 0),
                                      child: Container(
                                        width: 548.1,
                                        height: 44.2,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Other benefits',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 25,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 548.1,
                                    height: 44.2,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                Color(0xFFF5F5F5),
                                          ),
                                          child: Checkbox(
                                            value: _model.foodValue ??= true,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.foodValue = newValue!);

                                              if (!newValue!) {
                                                FFAppState().update(() {
                                                  FFAppState().FoodCheck =
                                                      false;
                                                });
                                              }
                                            },
                                            activeColor: Color(0xFFF2A213),
                                          ),
                                        ),
                                        Text(
                                          'Food',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 548.1,
                                    height: 44.2,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                Color(0xFFF5F5F5),
                                          ),
                                          child: Checkbox(
                                            value: _model.lodgingValue ??= true,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                  .lodgingValue = newValue!);
                                            },
                                            activeColor: Color(0xFFF2A213),
                                          ),
                                        ),
                                        Text(
                                          'Lodging',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 548.1,
                                    height: 44.2,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                Color(0xFFF5F5F5),
                                          ),
                                          child: Checkbox(
                                            value: _model.medicalValue ??= true,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                  .medicalValue = newValue!);
                                            },
                                            activeColor: Color(0xFFF2A213),
                                          ),
                                        ),
                                        Text(
                                          'Medical',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 548.1,
                                    height: 44.2,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                Color(0xFFF5F5F5),
                                          ),
                                          child: Checkbox(
                                            value: _model
                                                .transportationValue ??= true,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.transportationValue =
                                                      newValue!);
                                            },
                                            activeColor: Color(0xFFF2A213),
                                          ),
                                        ),
                                        Text(
                                          'Transportation',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 20),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          FFAppState().update(() {
                                            FFAppState().jobarea =
                                                LocationAPICall.area(
                                              (_model.address?.jsonBody ?? ''),
                                            ).toString();
                                            FFAppState().jobdistrict =
                                                LocationAPICall.district(
                                              (_model.address?.jsonBody ?? ''),
                                            ).toString();
                                            FFAppState().jobstate =
                                                LocationAPICall.state(
                                              (_model.address?.jsonBody ?? ''),
                                            ).toString();
                                          });

                                          final jobsCreateData =
                                              createJobsRecordData(
                                            salary: _model.salaryValue,
                                            jobDescription: _model
                                                .descriptionController.text,
                                            minSalary: int.tryParse(_model
                                                .minsaltextController.text),
                                            maxSalary: int.tryParse(_model
                                                .maxsaltextController.text),
                                            minAge: int.tryParse(_model
                                                .minagetextController.text),
                                            maxAge: int.tryParse(_model
                                                .maxagetextController.text),
                                            jobImage: FFAppState().jobpic,
                                            primarySkillLevel:
                                                _model.skilllevelValue,
                                            primarySkill:
                                                _model.skilllevelValue,
                                            organisationName: widget
                                                .orgpage!.organisationName,
                                            jobTitle: FFAppState().jobtitle,
                                            modeOfSalary: _model.salaryValue,
                                            jobCategory:
                                                FFAppState().jobcategory,
                                            pinCode: FFAppState().jobpin,
                                            area: FFAppState().jobarea,
                                            district: FFAppState().jobdistrict,
                                            state: FFAppState().jobstate,
                                            numberOfVacancies: _model
                                                .numberofopeningController.text,
                                            workingHours: _model
                                                .workinghoursController.text,
                                            startDate: _model.datePicked1,
                                            endDate: _model.datePicked2,
                                            gender: _model.genderValue,
                                            minQualification: _model
                                                .highestqualiDropDownValue,
                                            orgRefId: widget.orgpage!.reference,
                                          );
                                          await JobsRecord.createDoc(
                                                  widget.orgpage!.reference)
                                              .set(jobsCreateData);

                                          context.goNamed('Organisations');
                                        },
                                        text: 'Save',
                                        options: FFButtonOptions(
                                          width: 250,
                                          height: 60,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(44),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
