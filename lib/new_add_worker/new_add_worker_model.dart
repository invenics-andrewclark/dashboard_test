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

class NewAddWorkerModel extends FlutterFlowModel {
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

  // State field(s) for Worker_FullName widget.
  TextEditingController? workerFullNameController;
  String? Function(BuildContext, String?)? workerFullNameControllerValidator;
  String? _workerFullNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for Worker_Phone widget.
  TextEditingController? workerPhoneController;
  String? Function(BuildContext, String?)? workerPhoneControllerValidator;
  // State field(s) for Worker_Email widget.
  TextEditingController? workerEmailController;
  String? Function(BuildContext, String?)? workerEmailControllerValidator;
  String? _workerEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  DateTime? datePicked;
  // State field(s) for Worker_Gender widget.
  String? workerGenderValue;
  // State field(s) for HighestqualiDropDown widget.
  String? highestqualiDropDownValue;
  // State field(s) for Worker_Pin widget.
  TextEditingController? workerPinController;
  String? Function(BuildContext, String?)? workerPinControllerValidator;
  String? _workerPinControllerValidator(BuildContext context, String? val) {
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

  // Stores action output result for [Backend Call - API (Location API)] action in Worker_Pin widget.
  ApiCallResponse? address;
  // State field(s) for Refferal widget.
  TextEditingController? refferalController;
  String? Function(BuildContext, String?)? refferalControllerValidator;
  // State field(s) for Worker_Adhaar_number widget.
  TextEditingController? workerAdhaarNumberController;
  String? Function(BuildContext, String?)?
      workerAdhaarNumberControllerValidator;
  String? _workerAdhaarNumberControllerValidator(
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

  // State field(s) for Worker_PAN widget.
  TextEditingController? workerPANController;
  String? Function(BuildContext, String?)? workerPANControllerValidator;
  String? _workerPANControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for Worker_Account_No widget.
  TextEditingController? workerAccountNoController;
  String? Function(BuildContext, String?)? workerAccountNoControllerValidator;
  String? _workerAccountNoControllerValidator(
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

  // State field(s) for Worker_Bank_IFSC widget.
  TextEditingController? workerBankIFSCController;
  String? Function(BuildContext, String?)? workerBankIFSCControllerValidator;
  String? _workerBankIFSCControllerValidator(
      BuildContext context, String? val) {
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

  // State field(s) for Worker_Account_Name widget.
  TextEditingController? workerAccountNameController;
  String? Function(BuildContext, String?)? workerAccountNameControllerValidator;
  String? _workerAccountNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for Worker_Bank_Name widget.
  TextEditingController? workerBankNameController;
  String? Function(BuildContext, String?)? workerBankNameControllerValidator;
  String? _workerBankNameControllerValidator(
      BuildContext context, String? val) {
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
    workerFullNameControllerValidator = _workerFullNameControllerValidator;
    workerEmailControllerValidator = _workerEmailControllerValidator;
    workerPinControllerValidator = _workerPinControllerValidator;
    workerAdhaarNumberControllerValidator =
        _workerAdhaarNumberControllerValidator;
    workerPANControllerValidator = _workerPANControllerValidator;
    workerAccountNoControllerValidator = _workerAccountNoControllerValidator;
    workerBankIFSCControllerValidator = _workerBankIFSCControllerValidator;
    workerAccountNameControllerValidator =
        _workerAccountNameControllerValidator;
    workerBankNameControllerValidator = _workerBankNameControllerValidator;
  }

  void dispose() {
    workerFullNameController?.dispose();
    workerPhoneController?.dispose();
    workerEmailController?.dispose();
    workerPinController?.dispose();
    refferalController?.dispose();
    workerAdhaarNumberController?.dispose();
    workerPANController?.dispose();
    workerAccountNoController?.dispose();
    workerBankIFSCController?.dispose();
    workerAccountNameController?.dispose();
    workerBankNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
