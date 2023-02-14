import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'captains_record.g.dart';

abstract class CaptainsRecord
    implements Built<CaptainsRecord, CaptainsRecordBuilder> {
  static Serializer<CaptainsRecord> get serializer =>
      _$captainsRecordSerializer;

  @BuiltValueField(wireName: 'User_Ref')
  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'full_name')
  String? get fullName;

  String? get phone;

  String? get dob;

  String? get gender;

  String? get email;

  String? get photo;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

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

  @BuiltValueField(wireName: 'referral_code')
  String? get referralCode;

  @BuiltValueField(wireName: 'recruitment_area')
  String? get recruitmentArea;

  String? get tag;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CaptainsRecordBuilder builder) => builder
    ..fullName = ''
    ..phone = ''
    ..dob = ''
    ..gender = ''
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
    ..referralCode = ''
    ..recruitmentArea = ''
    ..tag = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Captains');

  static Stream<CaptainsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CaptainsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CaptainsRecord._();
  factory CaptainsRecord([void Function(CaptainsRecordBuilder) updates]) =
      _$CaptainsRecord;

  static CaptainsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCaptainsRecordData({
  DocumentReference? userRef,
  String? fullName,
  String? phone,
  String? dob,
  String? gender,
  String? email,
  String? photo,
  DateTime? createdDate,
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
  String? referralCode,
  String? recruitmentArea,
  String? tag,
}) {
  final firestoreData = serializers.toFirestore(
    CaptainsRecord.serializer,
    CaptainsRecord(
      (c) => c
        ..userRef = userRef
        ..fullName = fullName
        ..phone = phone
        ..dob = dob
        ..gender = gender
        ..email = email
        ..photo = photo
        ..createdDate = createdDate
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
        ..referralCode = referralCode
        ..recruitmentArea = recruitmentArea
        ..tag = tag,
    ),
  );

  return firestoreData;
}
