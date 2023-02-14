import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
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

class EditScoutDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
  // State field(s) for Scout_PinCode widget.
  TextEditingController? scoutPinCodeController;
  String? Function(BuildContext, String?)? scoutPinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (Location API)] action in Scout_PinCode widget.
  ApiCallResponse? adrress;
  // State field(s) for Captain_Referal_Code widget.
  TextEditingController? captainReferalCodeController;
  String? Function(BuildContext, String?)?
      captainReferalCodeControllerValidator;
  // State field(s) for Scout_AdhaarNumber widget.
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

  // State field(s) for Scout_AccountNumber widget.
  TextEditingController? scoutAccountNumberController;
  String? Function(BuildContext, String?)?
      scoutAccountNumberControllerValidator;
  String? _scoutAccountNumberControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 12) {
      return 'Requires at least 12 characters.';
    }
    if (val.length > 17) {
      return 'Maximum 17 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Scout_IFSC widget.
  TextEditingController? scoutIFSCController;
  String? Function(BuildContext, String?)? scoutIFSCControllerValidator;
  String? _scoutIFSCControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 11) {
      return 'Requires at least 11 characters.';
    }
    if (val.length > 11) {
      return 'Maximum 11 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Scout_AccountName widget.
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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    scoutFullNameControllerValidator = _scoutFullNameControllerValidator;
    scoutEmailControllerValidator = _scoutEmailControllerValidator;
    scoutAdhaarNumberControllerValidator =
        _scoutAdhaarNumberControllerValidator;
    scoutPANControllerValidator = _scoutPANControllerValidator;
    scoutAccountNumberControllerValidator =
        _scoutAccountNumberControllerValidator;
    scoutIFSCControllerValidator = _scoutIFSCControllerValidator;
    scoutAccountNameControllerValidator = _scoutAccountNameControllerValidator;
  }

  void dispose() {
    scoutFullNameController?.dispose();
    scoutEmailController?.dispose();
    scoutPinCodeController?.dispose();
    captainReferalCodeController?.dispose();
    scoutAdhaarNumberController?.dispose();
    scoutPANController?.dispose();
    scoutAccountNumberController?.dispose();
    scoutIFSCController?.dispose();
    scoutAccountNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
