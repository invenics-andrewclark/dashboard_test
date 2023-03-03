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

class AddJobModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for headingbar component.
  late HeadingbarModel headingbarModel;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for OrganisationName widget.
  TextEditingController? organisationNameController;
  String? Function(BuildContext, String?)? organisationNameControllerValidator;
  String? _organisationNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for JobCategory widget.
  String? jobCategoryValue;
  // State field(s) for JObtitle widget.
  String? jObtitleValue1;
  // State field(s) for JObtitle widget.
  String? jObtitleValue2;
  // State field(s) for JObtitle widget.
  String? jObtitleValue3;
  // State field(s) for JObtitle widget.
  String? jObtitleValue4;
  // State field(s) for JObtitle widget.
  String? jObtitleValue5;
  // State field(s) for JObtitle widget.
  String? jObtitleValue6;
  // State field(s) for JObtitle widget.
  String? jObtitleValue7;
  // State field(s) for JObtitle widget.
  String? jObtitleValue8;
  // State field(s) for JObtitle widget.
  String? jObtitleValue9;
  // State field(s) for JObtitle widget.
  String? jObtitleValue10;
  // State field(s) for JobTitle widget.
  TextEditingController? jobTitleController;
  String? Function(BuildContext, String?)? jobTitleControllerValidator;
  String? _jobTitleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for PrySkillLevel widget.
  String? prySkillLevelValue;
  // State field(s) for JobDescription widget.
  TextEditingController? jobDescriptionController;
  String? Function(BuildContext, String?)? jobDescriptionControllerValidator;
  String? _jobDescriptionControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for MinQualification widget.
  String? minQualificationValue;
  // State field(s) for ModeofSalary widget.
  String? modeofSalaryValue;
  // State field(s) for MinimumSalary widget.
  TextEditingController? minimumSalaryController;
  String? Function(BuildContext, String?)? minimumSalaryControllerValidator;
  String? _minimumSalaryControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    if (!RegExp('^[0-9\\s]+\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for MaximumSalary widget.
  TextEditingController? maximumSalaryController;
  String? Function(BuildContext, String?)? maximumSalaryControllerValidator;
  String? _maximumSalaryControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for NoVacancies widget.
  TextEditingController? noVacanciesController;
  String? Function(BuildContext, String?)? noVacanciesControllerValidator;
  String? _noVacanciesControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for Gender widget.
  String? genderValue;
  // State field(s) for WorkHours widget.
  TextEditingController? workHoursController;
  String? Function(BuildContext, String?)? workHoursControllerValidator;
  String? _workHoursControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Min 1 character required';
    }
    if (val.length > 2) {
      return 'Max 2 characters allowed';
    }
    if (!RegExp('^[0-9\\s]+\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for minageSlider widget.
  double? minageSliderValue;
  // State field(s) for maxageSlider widget.
  double? maxageSliderValue;
  // State field(s) for FoodCheckbox widget.
  bool? foodCheckboxValue;
  // State field(s) for TransportationCheckbox widget.
  bool? transportationCheckboxValue;
  // State field(s) for LodgingCheckbox widget.
  bool? lodgingCheckboxValue;
  // State field(s) for MedicalCheckbox widget.
  bool? medicalCheckboxValue;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Model for jobaddress component.
  late JobaddressModel jobaddressModel;
  // Model for bottombar component.
  late BottombarModel bottombarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    headingbarModel = createModel(context, () => HeadingbarModel());
    organisationNameControllerValidator = _organisationNameControllerValidator;
    jobTitleControllerValidator = _jobTitleControllerValidator;
    jobDescriptionControllerValidator = _jobDescriptionControllerValidator;
    minimumSalaryControllerValidator = _minimumSalaryControllerValidator;
    maximumSalaryControllerValidator = _maximumSalaryControllerValidator;
    noVacanciesControllerValidator = _noVacanciesControllerValidator;
    workHoursControllerValidator = _workHoursControllerValidator;
    jobaddressModel = createModel(context, () => JobaddressModel());
    bottombarModel = createModel(context, () => BottombarModel());

    jobaddressModel.pincodefieldControllerValidator = _formTextFieldValidator;
  }

  void dispose() {
    webNavModel.dispose();
    headingbarModel.dispose();
    organisationNameController?.dispose();
    jobTitleController?.dispose();
    jobDescriptionController?.dispose();
    minimumSalaryController?.dispose();
    maximumSalaryController?.dispose();
    noVacanciesController?.dispose();
    workHoursController?.dispose();
    jobaddressModel.dispose();
    bottombarModel.dispose();
  }

  /// Additional helper methods are added here.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }
    if (val.length > 6) {
      return 'Maximum 6 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[0-9\\s]+\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }
}
