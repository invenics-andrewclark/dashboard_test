import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editaddress_workers_model.dart';
export 'editaddress_workers_model.dart';

class EditaddressWorkersWidget extends StatefulWidget {
  const EditaddressWorkersWidget({
    Key? key,
    this.area,
  }) : super(key: key);

  final String? area;

  @override
  _EditaddressWorkersWidgetState createState() =>
      _EditaddressWorkersWidgetState();
}

class _EditaddressWorkersWidgetState extends State<EditaddressWorkersWidget> {
  late EditaddressWorkersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditaddressWorkersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<WorkersRecord>(
      stream: WorkersRecord.getDocument(FFAppState().editworkeraddress!),
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
        final containerWorkersRecord = snapshot.data!;
        return Container(
          width: 700.0,
          height: 540.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 37.5,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Text(
                  'EDIT ADDRESS DETAILS',
                  style: FlutterFlowTheme.of(context).title2,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Pincode',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 690.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).grayIcon,
                            ),
                          ),
                          child: TextFormField(
                            controller: _model.pincodefieldController ??=
                                TextEditingController(
                              text: containerWorkersRecord.pinCode,
                            ),
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.pincodefieldController',
                              Duration(milliseconds: 2000),
                              () async {
                                var _shouldSetState = false;
                                _model.updatePage(() {
                                  FFAppState().disabling = '0';
                                });
                                _model.updatePage(() {
                                  FFAppState().arealist = [];
                                  FFAppState().district = 'District';
                                  FFAppState().state = 'State';
                                });
                                _model.updatePage(() {
                                  FFAppState().pincode =
                                      _model.pincodefieldController.text;
                                });
                                FFAppState().update(() {
                                  FFAppState().OrganisationArea = '0';
                                });
                                _model.apiResultcci =
                                    await LocationAPICall.call(
                                  pinCode: _model.pincodefieldController.text,
                                );
                                _shouldSetState = true;
                                setState(() {
                                  FFAppState().testapi = LocationAPICall.status(
                                            (_model.apiResultcci?.jsonBody ??
                                                ''),
                                          ).toString() ==
                                          'Error'
                                      ? '0'
                                      : '1';
                                });
                                if ((LocationAPICall.namelist(
                                          (_model.apiResultcci?.jsonBody ?? ''),
                                        ).length !=
                                        null) &&
                                    (LocationAPICall.district(
                                              (_model.apiResultcci?.jsonBody ??
                                                  ''),
                                            ).toString() !=
                                            null &&
                                        LocationAPICall.district(
                                              (_model.apiResultcci?.jsonBody ??
                                                  ''),
                                            ).toString() !=
                                            '') &&
                                    (LocationAPICall.state(
                                              (_model.apiResultcci?.jsonBody ??
                                                  ''),
                                            ).toString() !=
                                            null &&
                                        LocationAPICall.state(
                                              (_model.apiResultcci?.jsonBody ??
                                                  ''),
                                            ).toString() !=
                                            '')) {
                                  _model.updatePage(() {
                                    FFAppState().disabling = '1';
                                  });
                                  _model.updatePage(() {
                                    FFAppState().arealist =
                                        (LocationAPICall.namelist(
                                      (_model.apiResultcci?.jsonBody ?? ''),
                                    ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()!
                                            .where((e) =>
                                                (e != 'null') && (e != 'Null'))
                                            .toList();
                                    FFAppState().district =
                                        LocationAPICall.district(
                                      (_model.apiResultcci?.jsonBody ?? ''),
                                    ).toString();
                                    FFAppState().state = LocationAPICall.state(
                                      (_model.apiResultcci?.jsonBody ?? ''),
                                    ).toString();
                                  });
                                } else {
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_shouldSetState) setState(() {});
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Enter the pincode',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 22.0, 20.0, 12.0),
                              suffixIcon: _model
                                      .pincodefieldController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.pincodefieldController?.clear();
                                        var _shouldSetState = false;
                                        _model.updatePage(() {
                                          FFAppState().disabling = '0';
                                        });
                                        _model.updatePage(() {
                                          FFAppState().arealist = [];
                                          FFAppState().district = 'District';
                                          FFAppState().state = 'State';
                                        });
                                        _model.updatePage(() {
                                          FFAppState().pincode = _model
                                              .pincodefieldController.text;
                                        });
                                        FFAppState().update(() {
                                          FFAppState().OrganisationArea = '0';
                                        });
                                        _model.apiResultcci =
                                            await LocationAPICall.call(
                                          pinCode: _model
                                              .pincodefieldController.text,
                                        );
                                        _shouldSetState = true;
                                        setState(() {
                                          FFAppState().testapi =
                                              LocationAPICall.status(
                                                        (_model.apiResultcci
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString() ==
                                                      'Error'
                                                  ? '0'
                                                  : '1';
                                        });
                                        if ((LocationAPICall.namelist(
                                                  (_model.apiResultcci
                                                          ?.jsonBody ??
                                                      ''),
                                                ).length !=
                                                null) &&
                                            (LocationAPICall.district(
                                                      (_model.apiResultcci
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString() !=
                                                    null &&
                                                LocationAPICall.district(
                                                      (_model.apiResultcci
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString() !=
                                                    '') &&
                                            (LocationAPICall.state(
                                                      (_model.apiResultcci
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString() !=
                                                    null &&
                                                LocationAPICall.state(
                                                      (_model.apiResultcci
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString() !=
                                                    '')) {
                                          _model.updatePage(() {
                                            FFAppState().disabling = '1';
                                          });
                                          _model.updatePage(() {
                                            FFAppState().arealist =
                                                (LocationAPICall.namelist(
                                              (_model.apiResultcci?.jsonBody ??
                                                  ''),
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()!
                                                    .where((e) =>
                                                        (e != 'null') &&
                                                        (e != 'Null'))
                                                    .toList();
                                            FFAppState().district =
                                                LocationAPICall.district(
                                              (_model.apiResultcci?.jsonBody ??
                                                  ''),
                                            ).toString();
                                            FFAppState().state =
                                                LocationAPICall.state(
                                              (_model.apiResultcci?.jsonBody ??
                                                  ''),
                                            ).toString();
                                          });
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 22.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context).subtitle1,
                            keyboardType: TextInputType.number,
                            validator: _model.pincodefieldControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Visibility(
                            visible: LocationAPICall.status(
                                  (_model.apiResultcci?.jsonBody ?? ''),
                                ).toString() ==
                                'Error',
                            child: Text(
                              'Please enter a valid pincode',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Area',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 690.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).grayIcon,
                            ),
                          ),
                          child: FlutterFlowDropDown<String>(
                            initialOption: _model.areadropdownValue ??=
                                widget.area,
                            options: FFAppState().OrganisationArea == '1'
                                ? FFAppState().editorgarea
                                : FFAppState().arealist.toList(),
                            onChanged: (val) =>
                                setState(() => _model.areadropdownValue = val),
                            width: 180.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context).subtitle1,
                            hintText: 'Select the area',
                            fillColor: Colors.white,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).grayIcon,
                            borderWidth: 0.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 4.0),
                            hidesUnderline: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'District',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 690.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).grayIcon,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                () {
                                  if (FFAppState().disabling == '2') {
                                    return containerWorkersRecord.district;
                                  } else if (FFAppState().disabling == '1') {
                                    return FFAppState().district;
                                  } else {
                                    return 'District';
                                  }
                                }(),
                                'district',
                              ),
                              style: FlutterFlowTheme.of(context).subtitle1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'State',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 690.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color(0xFFA0A0A0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                () {
                                  if (FFAppState().disabling == '2') {
                                    return containerWorkersRecord.state;
                                  } else if (FFAppState().disabling == '1') {
                                    return FFAppState().state;
                                  } else {
                                    return 'State';
                                  }
                                }(),
                                'state',
                              ),
                              style: FlutterFlowTheme.of(context).subtitle1,
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
        );
      },
    );
  }
}
