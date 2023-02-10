import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'jobs_record.g.dart';

abstract class JobsRecord implements Built<JobsRecord, JobsRecordBuilder> {
  static Serializer<JobsRecord> get serializer => _$jobsRecordSerializer;

  String? get salary;

  @BuiltValueField(wireName: 'job_description')
  String? get jobDescription;

  @BuiltValueField(wireName: 'min_qualification')
  String? get minQualification;

  @BuiltValueField(wireName: 'min_salary')
  int? get minSalary;

  @BuiltValueField(wireName: 'max_salary')
  int? get maxSalary;

  @BuiltValueField(wireName: 'min_age')
  int? get minAge;

  @BuiltValueField(wireName: 'max_age')
  int? get maxAge;

  @BuiltValueField(wireName: 'job_image')
  String? get jobImage;

  @BuiltValueField(wireName: 'primary_skill_level')
  String? get primarySkillLevel;

  @BuiltValueField(wireName: 'primary_skill')
  String? get primarySkill;

  @BuiltValueField(wireName: 'organisation_name')
  String? get organisationName;

  @BuiltValueField(wireName: 'job_title')
  String? get jobTitle;

  @BuiltValueField(wireName: 'mode_of_salary')
  String? get modeOfSalary;

  @BuiltValueField(wireName: 'job_category')
  String? get jobCategory;

  @BuiltValueField(wireName: 'pin_code')
  String? get pinCode;

  String? get area;

  String? get district;

  String? get state;

  @BuiltValueField(wireName: 'min_experience')
  String? get minExperience;

  @BuiltValueField(wireName: 'job_application_collection')
  String? get jobApplicationCollection;

  @BuiltValueField(wireName: 'application_list')
  String? get applicationList;

  @BuiltValueField(wireName: 'number_of_vacancies')
  String? get numberOfVacancies;

  @BuiltValueField(wireName: 'working_hours')
  String? get workingHours;

  @BuiltValueField(wireName: 'start_date')
  DateTime? get startDate;

  @BuiltValueField(wireName: 'end_date')
  DateTime? get endDate;

  String? get gender;

  @BuiltValueField(wireName: 'org_ref_id')
  DocumentReference? get orgRefId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(JobsRecordBuilder builder) => builder
    ..salary = ''
    ..jobDescription = ''
    ..minQualification = ''
    ..minSalary = 0
    ..maxSalary = 0
    ..minAge = 0
    ..maxAge = 0
    ..jobImage = ''
    ..primarySkillLevel = ''
    ..primarySkill = ''
    ..organisationName = ''
    ..jobTitle = ''
    ..modeOfSalary = ''
    ..jobCategory = ''
    ..pinCode = ''
    ..area = ''
    ..district = ''
    ..state = ''
    ..minExperience = ''
    ..jobApplicationCollection = ''
    ..applicationList = ''
    ..numberOfVacancies = ''
    ..workingHours = ''
    ..gender = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Jobs')
          : FirebaseFirestore.instance.collectionGroup('Jobs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Jobs').doc();

  static Stream<JobsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JobsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JobsRecord._();
  factory JobsRecord([void Function(JobsRecordBuilder) updates]) = _$JobsRecord;

  static JobsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJobsRecordData({
  String? salary,
  String? jobDescription,
  String? minQualification,
  int? minSalary,
  int? maxSalary,
  int? minAge,
  int? maxAge,
  String? jobImage,
  String? primarySkillLevel,
  String? primarySkill,
  String? organisationName,
  String? jobTitle,
  String? modeOfSalary,
  String? jobCategory,
  String? pinCode,
  String? area,
  String? district,
  String? state,
  String? minExperience,
  String? jobApplicationCollection,
  String? applicationList,
  String? numberOfVacancies,
  String? workingHours,
  DateTime? startDate,
  DateTime? endDate,
  String? gender,
  DocumentReference? orgRefId,
}) {
  final firestoreData = serializers.toFirestore(
    JobsRecord.serializer,
    JobsRecord(
      (j) => j
        ..salary = salary
        ..jobDescription = jobDescription
        ..minQualification = minQualification
        ..minSalary = minSalary
        ..maxSalary = maxSalary
        ..minAge = minAge
        ..maxAge = maxAge
        ..jobImage = jobImage
        ..primarySkillLevel = primarySkillLevel
        ..primarySkill = primarySkill
        ..organisationName = organisationName
        ..jobTitle = jobTitle
        ..modeOfSalary = modeOfSalary
        ..jobCategory = jobCategory
        ..pinCode = pinCode
        ..area = area
        ..district = district
        ..state = state
        ..minExperience = minExperience
        ..jobApplicationCollection = jobApplicationCollection
        ..applicationList = applicationList
        ..numberOfVacancies = numberOfVacancies
        ..workingHours = workingHours
        ..startDate = startDate
        ..endDate = endDate
        ..gender = gender
        ..orgRefId = orgRefId,
    ),
  );

  return firestoreData;
}
