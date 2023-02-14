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

class NewAddCaptainModel extends FlutterFlowModel {
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

  // State field(s) for Captain_Phn widget.
  TextEditingController? captainPhnController;
  String? Function(BuildContext, String?)? captainPhnControllerValidator;
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
  // State field(s) for Captain_Gender widget.
  String? captainGenderValue;
  // State field(s) for Captains_Pin widget.
  TextEditingController? captainsPinController;
  String? Function(BuildContext, String?)? captainsPinControllerValidator;
  String? _captainsPinControllerValidator(BuildContext context, String? val) {
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

  // Stores action output result for [Backend Call - API (Location API)] action in Captains_Pin widget.
  ApiCallResponse? address;
  // State field(s) for RecrutmentArea widget.
  TextEditingController? recrutmentAreaController;
  String? Function(BuildContext, String?)? recrutmentAreaControllerValidator;
  // State field(s) for Refferal widget.
  TextEditingController? refferalController;
  String? Function(BuildContext, String?)? refferalControllerValidator;
  // State field(s) for Captain_Adhaar_number widget.
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
    if (val.length > 11) {
      return 'Maximum 11 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Captain_Account_No widget.
  TextEditingController? captainAccountNoController;
  String? Function(BuildContext, String?)? captainAccountNoControllerValidator;
  String? _captainAccountNoControllerValidator(
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

  // State field(s) for Captain_Bank_IFSC widget.
  TextEditingController? captainBankIFSCController;
  String? Function(BuildContext, String?)? captainBankIFSCControllerValidator;
  String? _captainBankIFSCControllerValidator(
      BuildContext context, String? val) {
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

  // State field(s) for Captain_Account_Name widget.
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

  // State field(s) for Captain_Bank_Name widget.
  TextEditingController? captainBankNameController;
  String? Function(BuildContext, String?)? captainBankNameControllerValidator;
  String? _captainBankNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - panExist] action in Button widget.
  bool? pan;
  // Stores action output result for [Custom Action - aadharExist] action in Button widget.
  bool? aadhar;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CaptainsRecord? createcaptain;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    captainFullNameControllerValidator = _captainFullNameControllerValidator;
    captainEmailControllerValidator = _captainEmailControllerValidator;
    captainsPinControllerValidator = _captainsPinControllerValidator;
    captainAdhaarNumberControllerValidator =
        _captainAdhaarNumberControllerValidator;
    captainPANControllerValidator = _captainPANControllerValidator;
    captainAccountNoControllerValidator = _captainAccountNoControllerValidator;
    captainBankIFSCControllerValidator = _captainBankIFSCControllerValidator;
    captainAccountNameControllerValidator =
        _captainAccountNameControllerValidator;
    captainBankNameControllerValidator = _captainBankNameControllerValidator;
  }

  void dispose() {
    captainFullNameController?.dispose();
    captainPhnController?.dispose();
    captainEmailController?.dispose();
    captainsPinController?.dispose();
    recrutmentAreaController?.dispose();
    refferalController?.dispose();
    captainAdhaarNumberController?.dispose();
    captainPANController?.dispose();
    captainAccountNoController?.dispose();
    captainBankIFSCController?.dispose();
    captainAccountNameController?.dispose();
    captainBankNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
