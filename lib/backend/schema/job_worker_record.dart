import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'job_worker_record.g.dart';

abstract class JobWorkerRecord
    implements Built<JobWorkerRecord, JobWorkerRecordBuilder> {
  static Serializer<JobWorkerRecord> get serializer =>
      _$jobWorkerRecordSerializer;

  @BuiltValueField(wireName: 'contract_signed')
  bool? get contractSigned;

  String? get salary;

  @BuiltValueField(wireName: 'mode_of_salary')
  String? get modeOfSalary;

  @BuiltValueField(wireName: 'job_reference')
  DocumentReference? get jobReference;

  @BuiltValueField(wireName: 'start_date')
  String? get startDate;

  @BuiltValueField(wireName: 'end_date')
  String? get endDate;

  @BuiltValueField(wireName: 'worker_id')
  DocumentReference? get workerId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(JobWorkerRecordBuilder builder) => builder
    ..contractSigned = false
    ..salary = ''
    ..modeOfSalary = ''
    ..startDate = ''
    ..endDate = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Job_worker')
          : FirebaseFirestore.instance.collectionGroup('Job_worker');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Job_worker').doc();

  static Stream<JobWorkerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JobWorkerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JobWorkerRecord._();
  factory JobWorkerRecord([void Function(JobWorkerRecordBuilder) updates]) =
      _$JobWorkerRecord;

  static JobWorkerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJobWorkerRecordData({
  bool? contractSigned,
  String? salary,
  String? modeOfSalary,
  DocumentReference? jobReference,
  String? startDate,
  String? endDate,
  DocumentReference? workerId,
}) {
  final firestoreData = serializers.toFirestore(
    JobWorkerRecord.serializer,
    JobWorkerRecord(
      (j) => j
        ..contractSigned = contractSigned
        ..salary = salary
        ..modeOfSalary = modeOfSalary
        ..jobReference = jobReference
        ..startDate = startDate
        ..endDate = endDate
        ..workerId = workerId,
    ),
  );

  return firestoreData;
}
