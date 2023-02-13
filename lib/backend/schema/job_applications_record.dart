import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'job_applications_record.g.dart';

abstract class JobApplicationsRecord
    implements Built<JobApplicationsRecord, JobApplicationsRecordBuilder> {
  static Serializer<JobApplicationsRecord> get serializer =>
      _$jobApplicationsRecordSerializer;

  @BuiltValueField(wireName: 'applied_date')
  DateTime? get appliedDate;

  @BuiltValueField(wireName: 'application_status')
  String? get applicationStatus;

  String? get comments;

  @BuiltValueField(wireName: 'worker_id')
  DocumentReference? get workerId;

  @BuiltValueField(wireName: 'worker_name')
  String? get workerName;

  String? get gender;

  @BuiltValueField(wireName: 'skill_name')
  String? get skillName;

  @BuiltValueField(wireName: 'experience_level')
  String? get experienceLevel;

  @BuiltValueField(wireName: 'worker_image')
  String? get workerImage;

  @BuiltValueField(wireName: 'job_id')
  DocumentReference? get jobId;

  @BuiltValueField(wireName: 'organisation_id')
  DocumentReference? get organisationId;

  String? get jobTitle;

  @BuiltValueField(wireName: 'organisation_name')
  String? get organisationName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(JobApplicationsRecordBuilder builder) =>
      builder
        ..applicationStatus = ''
        ..comments = ''
        ..workerName = ''
        ..gender = ''
        ..skillName = ''
        ..experienceLevel = ''
        ..workerImage = ''
        ..jobTitle = ''
        ..organisationName = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('jobApplications')
          : FirebaseFirestore.instance.collectionGroup('jobApplications');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('jobApplications').doc();

  static Stream<JobApplicationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JobApplicationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JobApplicationsRecord._();
  factory JobApplicationsRecord(
          [void Function(JobApplicationsRecordBuilder) updates]) =
      _$JobApplicationsRecord;

  static JobApplicationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJobApplicationsRecordData({
  DateTime? appliedDate,
  String? applicationStatus,
  String? comments,
  DocumentReference? workerId,
  String? workerName,
  String? gender,
  String? skillName,
  String? experienceLevel,
  String? workerImage,
  DocumentReference? jobId,
  DocumentReference? organisationId,
  String? jobTitle,
  String? organisationName,
}) {
  final firestoreData = serializers.toFirestore(
    JobApplicationsRecord.serializer,
    JobApplicationsRecord(
      (j) => j
        ..appliedDate = appliedDate
        ..applicationStatus = applicationStatus
        ..comments = comments
        ..workerId = workerId
        ..workerName = workerName
        ..gender = gender
        ..skillName = skillName
        ..experienceLevel = experienceLevel
        ..workerImage = workerImage
        ..jobId = jobId
        ..organisationId = organisationId
        ..jobTitle = jobTitle
        ..organisationName = organisationName,
    ),
  );

  return firestoreData;
}
