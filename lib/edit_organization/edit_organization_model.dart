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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditOrganizationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for OrganisationName widget.
  TextEditingController? organisationNameController;
  String? Function(BuildContext, String?)? organisationNameControllerValidator;
  // State field(s) for orgsecdrop widget.
  String? orgsecdropValue;
  // State field(s) for OrgId widget.
  TextEditingController? orgIdController;
  String? Function(BuildContext, String?)? orgIdControllerValidator;
  // State field(s) for ContactName widget.
  TextEditingController? contactNameController;
  String? Function(BuildContext, String?)? contactNameControllerValidator;
  // State field(s) for ContactNum widget.
  TextEditingController? contactNumController;
  String? Function(BuildContext, String?)? contactNumControllerValidator;
  // State field(s) for ContactEmail widget.
  TextEditingController? contactEmailController;
  String? Function(BuildContext, String?)? contactEmailControllerValidator;
  // State field(s) for Address widget.
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  // State field(s) for Org_PinCode widget.
  TextEditingController? orgPinCodeController;
  String? Function(BuildContext, String?)? orgPinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (Location API)] action in Org_PinCode widget.
  ApiCallResponse? adrress;
  // State field(s) for country widget.
  TextEditingController? countryController;
  String? Function(BuildContext, String?)? countryControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    organisationNameController?.dispose();
    orgIdController?.dispose();
    contactNameController?.dispose();
    contactNumController?.dispose();
    contactEmailController?.dispose();
    addressController?.dispose();
    orgPinCodeController?.dispose();
    countryController?.dispose();
  }

  /// Additional helper methods are added here.

}
