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
  String? _organisationNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for orgsecdrop widget.
  String? orgsecdropValue;
  // State field(s) for OrgId widget.
  TextEditingController? orgIdController;
  String? Function(BuildContext, String?)? orgIdControllerValidator;
  String? _orgIdControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for ContactName widget.
  TextEditingController? contactNameController;
  String? Function(BuildContext, String?)? contactNameControllerValidator;
  String? _contactNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for ContactNum widget.
  TextEditingController? contactNumController;
  String? Function(BuildContext, String?)? contactNumControllerValidator;
  String? _contactNumControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for ContactEmail widget.
  TextEditingController? contactEmailController;
  String? Function(BuildContext, String?)? contactEmailControllerValidator;
  String? _contactEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for Address widget.
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  String? _addressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Org_PinCode widget.
  TextEditingController? orgPinCodeController;
  String? Function(BuildContext, String?)? orgPinCodeControllerValidator;
  String? _orgPinCodeControllerValidator(BuildContext context, String? val) {
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

  // Stores action output result for [Backend Call - API (Location API)] action in Org_PinCode widget.
  ApiCallResponse? adrress;
  // State field(s) for country widget.
  TextEditingController? countryController;
  String? Function(BuildContext, String?)? countryControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    organisationNameControllerValidator = _organisationNameControllerValidator;
    orgIdControllerValidator = _orgIdControllerValidator;
    contactNameControllerValidator = _contactNameControllerValidator;
    contactNumControllerValidator = _contactNumControllerValidator;
    contactEmailControllerValidator = _contactEmailControllerValidator;
    addressControllerValidator = _addressControllerValidator;
    orgPinCodeControllerValidator = _orgPinCodeControllerValidator;
  }

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
