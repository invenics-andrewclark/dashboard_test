import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'workjobref_record.g.dart';

abstract class WorkjobrefRecord
    implements Built<WorkjobrefRecord, WorkjobrefRecordBuilder> {
  static Serializer<WorkjobrefRecord> get serializer =>
      _$workjobrefRecordSerializer;

  DocumentReference? get refid;

  @BuiltValueField(wireName: 'work_ref')
  DocumentReference? get workRef;

  @BuiltValueField(wireName: 'WORKER_REF')
  DocumentReference? get workerRef;

  @BuiltValueField(wireName: 'Phone')
  String? get phone;

  @BuiltValueField(wireName: 'job_name')
  String? get jobName;

  String? get salary;

  int? get payscale;

  @BuiltValueField(wireName: 'worker_name')
  String? get workerName;

  @BuiltValueField(wireName: 'worker_gender')
  String? get workerGender;

  @BuiltValueField(wireName: 'worker_area')
  String? get workerArea;

  @BuiltValueField(wireName: 'organisation_name')
  String? get organisationName;

  @BuiltValueField(wireName: 'org_sector')
  String? get orgSector;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(WorkjobrefRecordBuilder builder) => builder
    ..phone = ''
    ..jobName = ''
    ..salary = ''
    ..payscale = 0
    ..workerName = ''
    ..workerGender = ''
    ..workerArea = ''
    ..organisationName = ''
    ..orgSector = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Workjobref')
          : FirebaseFirestore.instance.collectionGroup('Workjobref');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Workjobref').doc();

  static Stream<WorkjobrefRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<WorkjobrefRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  WorkjobrefRecord._();
  factory WorkjobrefRecord([void Function(WorkjobrefRecordBuilder) updates]) =
      _$WorkjobrefRecord;

  static WorkjobrefRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createWorkjobrefRecordData({
  DocumentReference? refid,
  DocumentReference? workRef,
  DocumentReference? workerRef,
  String? phone,
  String? jobName,
  String? salary,
  int? payscale,
  String? workerName,
  String? workerGender,
  String? workerArea,
  String? organisationName,
  String? orgSector,
}) {
  final firestoreData = serializers.toFirestore(
    WorkjobrefRecord.serializer,
    WorkjobrefRecord(
      (w) => w
        ..refid = refid
        ..workRef = workRef
        ..workerRef = workerRef
        ..phone = phone
        ..jobName = jobName
        ..salary = salary
        ..payscale = payscale
        ..workerName = workerName
        ..workerGender = workerGender
        ..workerArea = workerArea
        ..organisationName = organisationName
        ..orgSector = orgSector,
    ),
  );

  return firestoreData;
}
