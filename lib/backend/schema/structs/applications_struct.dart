import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'applications_struct.g.dart';

abstract class ApplicationsStruct
    implements Built<ApplicationsStruct, ApplicationsStructBuilder> {
  static Serializer<ApplicationsStruct> get serializer =>
      _$applicationsStructSerializer;

  @BuiltValueField(wireName: 'worker_id')
  String? get workerId;

  @BuiltValueField(wireName: 'application_status')
  String? get applicationStatus;

  @BuiltValueField(wireName: 'applied_on')
  String? get appliedOn;

  String? get comments;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ApplicationsStructBuilder builder) => builder
    ..workerId = ''
    ..applicationStatus = ''
    ..appliedOn = ''
    ..comments = ''
    ..firestoreUtilData = FirestoreUtilData();

  ApplicationsStruct._();
  factory ApplicationsStruct(
          [void Function(ApplicationsStructBuilder) updates]) =
      _$ApplicationsStruct;
}

ApplicationsStruct createApplicationsStruct({
  String? workerId,
  String? applicationStatus,
  String? appliedOn,
  String? comments,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ApplicationsStruct(
      (a) => a
        ..workerId = workerId
        ..applicationStatus = applicationStatus
        ..appliedOn = appliedOn
        ..comments = comments
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ApplicationsStruct? updateApplicationsStruct(
  ApplicationsStruct? applications, {
  bool clearUnsetFields = true,
}) =>
    applications != null
        ? (applications.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addApplicationsStructData(
  Map<String, dynamic> firestoreData,
  ApplicationsStruct? applications,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (applications == null) {
    return;
  }
  if (applications.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && applications.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final applicationsData =
      getApplicationsFirestoreData(applications, forFieldValue);
  final nestedData =
      applicationsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = applications.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getApplicationsFirestoreData(
  ApplicationsStruct? applications, [
  bool forFieldValue = false,
]) {
  if (applications == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ApplicationsStruct.serializer, applications);

  // Add any Firestore field values
  applications.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getApplicationsListFirestoreData(
  List<ApplicationsStruct>? applicationss,
) =>
    applicationss?.map((a) => getApplicationsFirestoreData(a, true)).toList() ??
    [];
