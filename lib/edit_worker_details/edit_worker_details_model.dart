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

class EditWorkerDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Worker_FullName widget.
  TextEditingController? workerFullNameController;
  String? Function(BuildContext, String?)? workerFullNameControllerValidator;
  // State field(s) for Worker_Email widget.
  TextEditingController? workerEmailController;
  String? Function(BuildContext, String?)? workerEmailControllerValidator;
  DateTime? datePicked;
  // State field(s) for Worker_PinCode widget.
  TextEditingController? workerPinCodeController;
  String? Function(BuildContext, String?)? workerPinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (Location API)] action in Worker_PinCode widget.
  ApiCallResponse? adrress;
  // State field(s) for Worker_Gender widget.
  String? workerGenderValue;
  // State field(s) for HighestqualiDropDown widget.
  String? highestqualiDropDownValue;
  // State field(s) for Captain_Referal_Code widget.
  TextEditingController? captainReferalCodeController;
  String? Function(BuildContext, String?)?
      captainReferalCodeControllerValidator;
  // State field(s) for Worker_AdhaarNumber widget.
  TextEditingController? workerAdhaarNumberController;
  String? Function(BuildContext, String?)?
      workerAdhaarNumberControllerValidator;
  // State field(s) for Worker_PAN widget.
  TextEditingController? workerPANController;
  String? Function(BuildContext, String?)? workerPANControllerValidator;
  // State field(s) for Worker_AccountNumber widget.
  TextEditingController? workerAccountNumberController;
  String? Function(BuildContext, String?)?
      workerAccountNumberControllerValidator;
  // State field(s) for Worker_IFSC widget.
  TextEditingController? workerIFSCController;
  String? Function(BuildContext, String?)? workerIFSCControllerValidator;
  // State field(s) for Worker_AccountName widget.
  TextEditingController? workerAccountNameController;
  String? Function(BuildContext, String?)? workerAccountNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    workerFullNameController?.dispose();
    workerEmailController?.dispose();
    workerPinCodeController?.dispose();
    captainReferalCodeController?.dispose();
    workerAdhaarNumberController?.dispose();
    workerPANController?.dispose();
    workerAccountNumberController?.dispose();
    workerIFSCController?.dispose();
    workerAccountNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
