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

class AddjobCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for orgsecdrop widget.
  String? orgsecdropValue;
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
  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  String? _descriptionControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // State field(s) for Gender widget.
  String? genderValue;
  // State field(s) for Numberofopening widget.
  TextEditingController? numberofopeningController;
  String? Function(BuildContext, String?)? numberofopeningControllerValidator;
  String? _numberofopeningControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for workinghours widget.
  TextEditingController? workinghoursController;
  String? Function(BuildContext, String?)? workinghoursControllerValidator;
  String? _workinghoursControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for Minagetext widget.
  TextEditingController? minagetextController;
  String? Function(BuildContext, String?)? minagetextControllerValidator;
  String? _minagetextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'min age should be atleast 18';
    }
    if (val.length > 2) {
      return 'Maximum 2 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Maxagetext widget.
  TextEditingController? maxagetextController;
  String? Function(BuildContext, String?)? maxagetextControllerValidator;
  String? _maxagetextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 2) {
      return 'Maximum 2 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Salary widget.
  String? salaryValue;
  // State field(s) for Minsaltext widget.
  TextEditingController? minsaltextController;
  String? Function(BuildContext, String?)? minsaltextControllerValidator;
  String? _minsaltextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for Maxsaltext widget.
  TextEditingController? maxsaltextController;
  String? Function(BuildContext, String?)? maxsaltextControllerValidator;
  String? _maxsaltextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for skilldrop widget.
  String? skilldropValue;
  // State field(s) for skilllevel widget.
  String? skilllevelValue;
  // State field(s) for HighestqualiDropDown widget.
  String? highestqualiDropDownValue;
  // State field(s) for pincode widget.
  TextEditingController? pincodeController;
  String? Function(BuildContext, String?)? pincodeControllerValidator;
  String? _pincodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'please enter correct pincode';
    }
    if (val.length > 6) {
      return 'Maximum 6 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Location API)] action in pincode widget.
  ApiCallResponse? address;
  // State field(s) for Food widget.
  bool? foodValue;
  // State field(s) for Lodging widget.
  bool? lodgingValue;
  // State field(s) for Medical widget.
  bool? medicalValue;
  // State field(s) for Transportation widget.
  bool? transportationValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    descriptionControllerValidator = _descriptionControllerValidator;
    numberofopeningControllerValidator = _numberofopeningControllerValidator;
    workinghoursControllerValidator = _workinghoursControllerValidator;
    minagetextControllerValidator = _minagetextControllerValidator;
    maxagetextControllerValidator = _maxagetextControllerValidator;
    minsaltextControllerValidator = _minsaltextControllerValidator;
    maxsaltextControllerValidator = _maxsaltextControllerValidator;
    pincodeControllerValidator = _pincodeControllerValidator;
  }

  void dispose() {
    descriptionController?.dispose();
    numberofopeningController?.dispose();
    workinghoursController?.dispose();
    minagetextController?.dispose();
    maxagetextController?.dispose();
    minsaltextController?.dispose();
    maxsaltextController?.dispose();
    pincodeController?.dispose();
  }

  /// Additional helper methods are added here.

}
