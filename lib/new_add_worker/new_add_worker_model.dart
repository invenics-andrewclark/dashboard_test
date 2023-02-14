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
  // State field(s) for Worker_Phone widget.
  TextEditingController? workerPhoneController;
  String? Function(BuildContext, String?)? workerPhoneControllerValidator;
  // State field(s) for Worker_Email widget.
  TextEditingController? workerEmailController;
  String? Function(BuildContext, String?)? workerEmailControllerValidator;
  DateTime? datePicked;
  // State field(s) for Worker_Gender widget.
  String? workerGenderValue;
  // State field(s) for HighestqualiDropDown widget.
  String? highestqualiDropDownValue;
  // State field(s) for Worker_Pin widget.
  TextEditingController? workerPinController;
  String? Function(BuildContext, String?)? workerPinControllerValidator;
  // Stores action output result for [Backend Call - API (Location API)] action in Worker_Pin widget.
  ApiCallResponse? address;
  // State field(s) for Refferal widget.
  TextEditingController? refferalController;
  String? Function(BuildContext, String?)? refferalControllerValidator;
  // State field(s) for Worker_Adhaar_number widget.
  TextEditingController? workerAdhaarNumberController;
  String? Function(BuildContext, String?)?
      workerAdhaarNumberControllerValidator;
  // State field(s) for Worker_PAN widget.
  TextEditingController? workerPANController;
  String? Function(BuildContext, String?)? workerPANControllerValidator;
  // State field(s) for Worker_Account_No widget.
  TextEditingController? workerAccountNoController;
  String? Function(BuildContext, String?)? workerAccountNoControllerValidator;
  // State field(s) for Worker_Bank_IFSC widget.
  TextEditingController? workerBankIFSCController;
  String? Function(BuildContext, String?)? workerBankIFSCControllerValidator;
  // State field(s) for Worker_Account_Name widget.
  TextEditingController? workerAccountNameController;
  String? Function(BuildContext, String?)? workerAccountNameControllerValidator;
  // State field(s) for Worker_Bank_Name widget.
  TextEditingController? workerBankNameController;
  String? Function(BuildContext, String?)? workerBankNameControllerValidator;
  // Stores action output result for [Custom Action - panExist] action in Button widget.
  bool? pan;
  // Stores action output result for [Custom Action - aadharExist] action in Button widget.
  bool? aadhar;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

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
