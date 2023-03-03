import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/addressfieldsadd_widget.dart';
import '/components/bottombar_widget.dart';
import '/components/headingbar_widget.dart';
import '/components/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddOrganModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for headingbar component.
  late HeadingbarModel headingbarModel;
  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isMediaUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for OrgName widget.
  TextEditingController? orgNameController;
  String? Function(BuildContext, String?)? orgNameControllerValidator;
  String? _orgNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Minimum 4 characters is required';
    }

    return null;
  }

  // State field(s) for OrgRegid widget.
  TextEditingController? orgRegidController;
  String? Function(BuildContext, String?)? orgRegidControllerValidator;
  // State field(s) for PhoneNumber widget.
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? _phoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Enter valid phone number';
    }
    if (val.length > 10) {
      return 'Enter valid phone number';
    }

    return null;
  }

  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('\\S+@\\S+\\.\\S+').hasMatch(val)) {
      return 'Enter valid email';
    }
    return null;
  }

  DateTime? datePicked;
  // Model for Addressfieldsadd component.
  late AddressfieldsaddModel addressfieldsaddModel;
  // Stores action output result for [Custom Action - checkExists] action in Button widget.
  bool? phone;
  // Model for bottombar component.
  late BottombarModel bottombarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    headingbarModel = createModel(context, () => HeadingbarModel());
    orgNameControllerValidator = _orgNameControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
    emailControllerValidator = _emailControllerValidator;
    addressfieldsaddModel = createModel(context, () => AddressfieldsaddModel());
    bottombarModel = createModel(context, () => BottombarModel());
  }

  void dispose() {
    webNavModel.dispose();
    headingbarModel.dispose();
    orgNameController?.dispose();
    orgRegidController?.dispose();
    phoneNumberController?.dispose();
    emailController?.dispose();
    addressfieldsaddModel.dispose();
    bottombarModel.dispose();
  }

  /// Additional helper methods are added here.

}
