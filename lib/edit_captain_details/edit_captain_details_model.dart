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

class EditCaptainDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Captain_FullName widget.
  TextEditingController? captainFullNameController;
  String? Function(BuildContext, String?)? captainFullNameControllerValidator;
  String? _captainFullNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for Captain_Email widget.
  TextEditingController? captainEmailController;
  String? Function(BuildContext, String?)? captainEmailControllerValidator;
  String? _captainEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  DateTime? datePicked;
  // State field(s) for Captainn_PinCode widget.
  TextEditingController? captainnPinCodeController;
  String? Function(BuildContext, String?)? captainnPinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (Location API)] action in Captainn_PinCode widget.
  ApiCallResponse? adrress;
  // State field(s) for Captain_Referal_Code widget.
  TextEditingController? captainReferalCodeController;
  String? Function(BuildContext, String?)?
      captainReferalCodeControllerValidator;
  // State field(s) for Captain_AdhaarNumber widget.
  TextEditingController? captainAdhaarNumberController;
  String? Function(BuildContext, String?)?
      captainAdhaarNumberControllerValidator;
  String? _captainAdhaarNumberControllerValidator(
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

  // State field(s) for Captain_PAN widget.
  TextEditingController? captainPANController;
  String? Function(BuildContext, String?)? captainPANControllerValidator;
  String? _captainPANControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for Captain_AccountNumber widget.
  TextEditingController? captainAccountNumberController;
  String? Function(BuildContext, String?)?
      captainAccountNumberControllerValidator;
  String? _captainAccountNumberControllerValidator(
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

  // State field(s) for Captain_IFSC widget.
  TextEditingController? captainIFSCController;
  String? Function(BuildContext, String?)? captainIFSCControllerValidator;
  String? _captainIFSCControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for Captain_AccountName widget.
  TextEditingController? captainAccountNameController;
  String? Function(BuildContext, String?)?
      captainAccountNameControllerValidator;
  String? _captainAccountNameControllerValidator(
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
    captainFullNameControllerValidator = _captainFullNameControllerValidator;
    captainEmailControllerValidator = _captainEmailControllerValidator;
    captainAdhaarNumberControllerValidator =
        _captainAdhaarNumberControllerValidator;
    captainPANControllerValidator = _captainPANControllerValidator;
    captainAccountNumberControllerValidator =
        _captainAccountNumberControllerValidator;
    captainIFSCControllerValidator = _captainIFSCControllerValidator;
    captainAccountNameControllerValidator =
        _captainAccountNameControllerValidator;
  }

  void dispose() {
    captainFullNameController?.dispose();
    captainEmailController?.dispose();
    captainnPinCodeController?.dispose();
    captainReferalCodeController?.dispose();
    captainAdhaarNumberController?.dispose();
    captainPANController?.dispose();
    captainAccountNumberController?.dispose();
    captainIFSCController?.dispose();
    captainAccountNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
