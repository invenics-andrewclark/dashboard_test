import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contract_model.dart';
export 'contract_model.dart';

class ContractWidget extends StatefulWidget {
  const ContractWidget({
    Key? key,
    this.jobdetailsref,
    this.workerjobref,
    this.startdate,
    this.enddate,
    this.orgRef,
  }) : super(key: key);

  final DocumentReference? jobdetailsref;
  final DocumentReference? workerjobref;
  final DateTime? startdate;
  final DateTime? enddate;
  final DocumentReference? orgRef;

  @override
  _ContractWidgetState createState() => _ContractWidgetState();
}

class _ContractWidgetState extends State<ContractWidget> {
  late ContractModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContractModel());

    _model.textController = TextEditingController();
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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Details',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 35,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    if (kIsWeb) {
                      final _datePicked1Date = await showDatePicker(
                        context: context,
                        initialDate: getCurrentTimestamp,
                        firstDate: DateTime(1900),
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
                        minTime: DateTime(0, 0, 0),
                      );
                    }
                  },
                  child: Container(
                    width: 450,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'Start Date:',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 25,
                                    ),
                          ),
                        ),
                        if (dateTimeFormat('d/M/y', _model.datePicked1) ==
                                null ||
                            dateTimeFormat('d/M/y', _model.datePicked1) == '')
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              dateTimeFormat('d/M/y', widget.startdate),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        if (dateTimeFormat('d/M/y', widget.startdate) == '')
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              dateTimeFormat('d/M/y', _model.datePicked1),
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
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (kIsWeb) {
                      final _datePicked2Date = await showDatePicker(
                        context: context,
                        initialDate: getCurrentTimestamp,
                        firstDate: DateTime(1900),
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
                        currentTime: getCurrentTimestamp,
                        minTime: DateTime(0, 0, 0),
                      );
                    }
                  },
                  child: Container(
                    width: 340,
                    height: 70,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Endt Date:',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                  ),
                        ),
                        if (dateTimeFormat('d/M/y', _model.datePicked2) ==
                                null ||
                            dateTimeFormat('d/M/y', _model.datePicked2) == '')
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              dateTimeFormat('d/M/y', widget.enddate),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        if (dateTimeFormat('d/M/y', _model.datePicked2) !=
                                null &&
                            dateTimeFormat('d/M/y', _model.datePicked2) != '')
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              dateTimeFormat('d/M/y', _model.datePicked2),
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
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                  child: FlutterFlowDropDown<String>(
                    options: ['Daily', 'Weekly', 'Monthly'],
                    onChanged: (val) =>
                        setState(() => _model.dropDownValue = val),
                    width: 280,
                    height: 50,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 25,
                        ),
                    hintText: 'Salary option',
                    fillColor: Colors.white,
                    elevation: 2,
                    borderColor: FlutterFlowTheme.of(context).lineColor,
                    borderWidth: 0,
                    borderRadius: 10,
                    margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    hidesUnderline: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 0),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(-0.1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                        child: TextFormField(
                          controller: _model.textController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Salary amount',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          textAlign: TextAlign.center,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final jobWorkerCreateData = createJobWorkerRecordData(
                        salary: _model.textController.text,
                        modeOfSalary: _model.dropDownValue,
                        jobReference: widget.jobdetailsref,
                        startDate:
                            (dateTimeFormat('d/M/y', _model.datePicked1) ==
                                            null ||
                                        dateTimeFormat(
                                                'd/M/y', _model.datePicked1) ==
                                            ''
                                    ? widget.startdate
                                    : _model.datePicked1)
                                ?.toString(),
                        endDate: (dateTimeFormat('d/M/y', _model.datePicked2) ==
                                        null ||
                                    dateTimeFormat(
                                            'd/M/y', _model.datePicked2) ==
                                        ''
                                ? widget.enddate
                                : _model.datePicked2)
                            ?.toString(),
                        workerId: widget.workerjobref,
                      );
                      await JobWorkerRecord.createDoc(widget.orgRef!)
                          .set(jobWorkerCreateData);

                      context.pushNamed('JobDetails');
                    },
                    text: 'Accept',
                    options: FFButtonOptions(
                      width: 150,
                      height: 70,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            lineHeight: 2,
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
        ],
      ),
    );
  }
}
