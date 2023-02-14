import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'workers_record.g.dart';

abstract class WorkersRecord
    implements Built<WorkersRecord, WorkersRecordBuilder> {
  static Serializer<WorkersRecord> get serializer => _$workersRecordSerializer;

  @BuiltValueField(wireName: 'User_Ref')
  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'full_name')
  String? get fullName;

  String? get phone;

  String? get dob;

  String? get email;

  String? get photo;

  @BuiltValueField(wireName: 'pin_code')
  String? get pinCode;

  String? get area;

  String? get district;

  String? get state;

  String? get aadhar;

  @BuiltValueField(wireName: 'pan_number')
  String? get panNumber;

  @BuiltValueField(wireName: 'account_name')
  String? get accountName;

  @BuiltValueField(wireName: 'account_number')
  String? get accountNumber;

  @BuiltValueField(wireName: 'bank_name')
  String? get bankName;

  @BuiltValueField(wireName: 'ifsc_code')
  String? get ifscCode;

  @BuiltValueField(wireName: 'highest_qualification')
  String? get highestQualification;

  String? get gender;

  @BuiltValueField(wireName: 'captain_scout_ref')
  String? get captainScoutRef;

  @BuiltValueField(wireName: 'organisation_id')
  String? get organisationId;

  @BuiltValueField(wireName: 'job_worker_id')
  String? get jobWorkerId;

  @BuiltValueField(wireName: 'date_available_from')
  String? get dateAvailableFrom;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(WorkersRecordBuilder builder) => builder
    ..fullName = ''
    ..phone = ''
    ..dob = ''
    ..email = ''
    ..photo = ''
    ..pinCode = ''
    ..area = ''
    ..district = ''
    ..state = ''
    ..aadhar = ''
    ..panNumber = ''
    ..accountName = ''
    ..accountNumber = ''
    ..bankName = ''
    ..ifscCode = ''
    ..highestQualification = ''
    ..gender = ''
    ..captainScoutRef = ''
    ..organisationId = ''
    ..jobWorkerId = ''
    ..dateAvailableFrom = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Workers');

  static Stream<WorkersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<WorkersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  WorkersRecord._();
  factory WorkersRecord([void Function(WorkersRecordBuilder) updates]) =
      _$WorkersRecord;

  static WorkersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createWorkersRecordData({
  DocumentReference? userRef,
  String? fullName,
  String? phone,
  String? dob,
  String? email,
  String? photo,
  String? pinCode,
  String? area,
  String? district,
  String? state,
  String? aadhar,
  String? panNumber,
  String? accountName,
  String? accountNumber,
  String? bankName,
  String? ifscCode,
  String? highestQualification,
  String? gender,
  String? captainScoutRef,
  String? organisationId,
  String? jobWorkerId,
  String? dateAvailableFrom,
  DateTime? createdDate,
}) {
  final firestoreData = serializers.toFirestore(
    WorkersRecord.serializer,
    WorkersRecord(
      (w) => w
        ..userRef = userRef
        ..fullName = fullName
        ..phone = phone
        ..dob = dob
        ..email = email
        ..photo = photo
        ..pinCode = pinCode
        ..area = area
        ..district = district
        ..state = state
        ..aadhar = aadhar
        ..panNumber = panNumber
        ..accountName = accountName
        ..accountNumber = accountNumber
        ..bankName = bankName
        ..ifscCode = ifscCode
        ..highestQualification = highestQualification
        ..gender = gender
        ..captainScoutRef = captainScoutRef
        ..organisationId = organisationId
        ..jobWorkerId = jobWorkerId
        ..dateAvailableFrom = dateAvailableFrom
        ..createdDate = createdDate,
    ),
  );

  return firestoreData;
}
