import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'job_contracts_record.g.dart';

abstract class JobContractsRecord
    implements Built<JobContractsRecord, JobContractsRecordBuilder> {
  static Serializer<JobContractsRecord> get serializer =>
      _$jobContractsRecordSerializer;

  @BuiltValueField(wireName: 'contract_signed')
  bool? get contractSigned;

  int? get salary;

  @BuiltValueField(wireName: 'mode_of_salary')
  String? get modeOfSalary;

  @BuiltValueField(wireName: 'job_reference')
  DocumentReference? get jobReference;

  @BuiltValueField(wireName: 'start_date')
  DateTime? get startDate;

  @BuiltValueField(wireName: 'end_date')
  DateTime? get endDate;

  @BuiltValueField(wireName: 'worker_name')
  String? get workerName;

  @BuiltValueField(wireName: 'worker_gender')
  String? get workerGender;

  @BuiltValueField(wireName: 'worker_skill')
  String? get workerSkill;

  @BuiltValueField(wireName: 'worker_skill_experience')
  String? get workerSkillExperience;

  @BuiltValueField(wireName: 'worker_image')
  String? get workerImage;

  @BuiltValueField(wireName: 'worker_reference')
  DocumentReference? get workerReference;

  @BuiltValueField(wireName: 'organisation_reference')
  DocumentReference? get organisationReference;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(JobContractsRecordBuilder builder) => builder
    ..contractSigned = false
    ..salary = 0
    ..modeOfSalary = ''
    ..workerName = ''
    ..workerGender = ''
    ..workerSkill = ''
    ..workerSkillExperience = ''
    ..workerImage = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('jobContracts')
          : FirebaseFirestore.instance.collectionGroup('jobContracts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('jobContracts').doc();

  static Stream<JobContractsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JobContractsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JobContractsRecord._();
  factory JobContractsRecord(
          [void Function(JobContractsRecordBuilder) updates]) =
      _$JobContractsRecord;

  static JobContractsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJobContractsRecordData({
  bool? contractSigned,
  int? salary,
  String? modeOfSalary,
  DocumentReference? jobReference,
  DateTime? startDate,
  DateTime? endDate,
  String? workerName,
  String? workerGender,
  String? workerSkill,
  String? workerSkillExperience,
  String? workerImage,
  DocumentReference? workerReference,
  DocumentReference? organisationReference,
}) {
  final firestoreData = serializers.toFirestore(
    JobContractsRecord.serializer,
    JobContractsRecord(
      (j) => j
        ..contractSigned = contractSigned
        ..salary = salary
        ..modeOfSalary = modeOfSalary
        ..jobReference = jobReference
        ..startDate = startDate
        ..endDate = endDate
        ..workerName = workerName
        ..workerGender = workerGender
        ..workerSkill = workerSkill
        ..workerSkillExperience = workerSkillExperience
        ..workerImage = workerImage
        ..workerReference = workerReference
        ..organisationReference = organisationReference,
    ),
  );

  return firestoreData;
}
