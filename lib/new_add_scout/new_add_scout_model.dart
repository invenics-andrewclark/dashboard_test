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
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewAddScoutModel extends FlutterFlowModel {
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

  // State field(s) for Scout_FullName widget.
  TextEditingController? scoutFullNameController;
  String? Function(BuildContext, String?)? scoutFullNameControllerValidator;
  String? _scoutFullNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for Scout_Phn widget.
  TextEditingController? scoutPhnController;
  String? Function(BuildContext, String?)? scoutPhnControllerValidator;
  // State field(s) for Scout_Email widget.
  TextEditingController? scoutEmailController;
  String? Function(BuildContext, String?)? scoutEmailControllerValidator;
  String? _scoutEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  DateTime? datePicked;
  // State field(s) for Scout_Gender widget.
  String? scoutGenderValue;
  // State field(s) for Scout_Pin widget.
  TextEditingController? scoutPinController;
  String? Function(BuildContext, String?)? scoutPinControllerValidator;
  String? _scoutPinControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }
    if (val.length > 6) {
      return 'Maximum 6 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Location API)] action in Scout_Pin widget.
  ApiCallResponse? address;
  // State field(s) for Recrutment widget.
  TextEditingController? recrutmentController;
  String? Function(BuildContext, String?)? recrutmentControllerValidator;
  String? _recrutmentControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // State field(s) for Refferal widget.
  TextEditingController? refferalController;
  String? Function(BuildContext, String?)? refferalControllerValidator;
  // State field(s) for Scout_Adhaar_number widget.
  TextEditingController? scoutAdhaarNumberController;
  String? Function(BuildContext, String?)? scoutAdhaarNumberControllerValidator;
  String? _scoutAdhaarNumberControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 12) {
      return 'Requires at least 12 characters.';
    }
    if (val.length > 12) {
      return 'Maximum 12 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Scout_PAN widget.
  TextEditingController? scoutPANController;
  String? Function(BuildContext, String?)? scoutPANControllerValidator;
  String? _scoutPANControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Scout_Account_No widget.
  TextEditingController? scoutAccountNoController;
  String? Function(BuildContext, String?)? scoutAccountNoControllerValidator;
  String? _scoutAccountNoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 15) {
      return 'Requires at least 15 characters.';
    }
    if (val.length > 17) {
      return 'Maximum 17 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Scout_Bank_IFSC widget.
  TextEditingController? scoutBankIFSCController;
  String? Function(BuildContext, String?)? scoutBankIFSCControllerValidator;
  String? _scoutBankIFSCControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 12) {
      return 'Maximum 12 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Scout_Account_Name widget.
  TextEditingController? scoutAccountNameController;
  String? Function(BuildContext, String?)? scoutAccountNameControllerValidator;
  String? _scoutAccountNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for Scout_Bank_Name widget.
  TextEditingController? scoutBankNameController;
  String? Function(BuildContext, String?)? scoutBankNameControllerValidator;
  String? _scoutBankNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Custom Action - panExist] action in Button widget.
  bool? pan;
  // Stores action output result for [Custom Action - aadharExist] action in Button widget.
  bool? aadhar;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    scoutFullNameControllerValidator = _scoutFullNameControllerValidator;
    scoutEmailControllerValidator = _scoutEmailControllerValidator;
    scoutPinControllerValidator = _scoutPinControllerValidator;
    recrutmentControllerValidator = _recrutmentControllerValidator;
    scoutAdhaarNumberControllerValidator =
        _scoutAdhaarNumberControllerValidator;
    scoutPANControllerValidator = _scoutPANControllerValidator;
    scoutAccountNoControllerValidator = _scoutAccountNoControllerValidator;
    scoutBankIFSCControllerValidator = _scoutBankIFSCControllerValidator;
    scoutAccountNameControllerValidator = _scoutAccountNameControllerValidator;
    scoutBankNameControllerValidator = _scoutBankNameControllerValidator;
  }

  void dispose() {
    scoutFullNameController?.dispose();
    scoutPhnController?.dispose();
    scoutEmailController?.dispose();
    scoutPinController?.dispose();
    recrutmentController?.dispose();
    refferalController?.dispose();
    scoutAdhaarNumberController?.dispose();
    scoutPANController?.dispose();
    scoutAccountNoController?.dispose();
    scoutBankIFSCController?.dispose();
    scoutAccountNameController?.dispose();
    scoutBankNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
