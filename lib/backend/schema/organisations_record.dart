import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'organisations_record.g.dart';

abstract class OrganisationsRecord
    implements Built<OrganisationsRecord, OrganisationsRecordBuilder> {
  static Serializer<OrganisationsRecord> get serializer =>
      _$organisationsRecordSerializer;

  String? get address;

  String? get state;

  String? get country;

  @BuiltValueField(wireName: 'contact_name')
  String? get contactName;

  String? get email;

  String? get area;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'organisation_registration_id')
  int? get organisationRegistrationId;

  @BuiltValueField(wireName: 'organisation_name')
  String? get organisationName;

  @BuiltValueField(wireName: 'created_on')
  String? get createdOn;

  @BuiltValueField(wireName: 'pin_code')
  String? get pinCode;

  @BuiltValueField(wireName: 'organisation_logo')
  String? get organisationLogo;

  String? get district;

  @BuiltValueField(wireName: 'org_sector')
  String? get orgSector;

  DocumentReference? get ref;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrganisationsRecordBuilder builder) => builder
    ..address = ''
    ..state = ''
    ..country = ''
    ..contactName = ''
    ..email = ''
    ..area = ''
    ..phoneNumber = ''
    ..organisationRegistrationId = 0
    ..organisationName = ''
    ..createdOn = ''
    ..pinCode = ''
    ..organisationLogo = ''
    ..district = ''
    ..orgSector = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Organisations');

  static Stream<OrganisationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrganisationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrganisationsRecord._();
  factory OrganisationsRecord(
          [void Function(OrganisationsRecordBuilder) updates]) =
      _$OrganisationsRecord;

  static OrganisationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrganisationsRecordData({
  String? address,
  String? state,
  String? country,
  String? contactName,
  String? email,
  String? area,
  String? phoneNumber,
  int? organisationRegistrationId,
  String? organisationName,
  String? createdOn,
  String? pinCode,
  String? organisationLogo,
  String? district,
  String? orgSector,
  DocumentReference? ref,
}) {
  final firestoreData = serializers.toFirestore(
    OrganisationsRecord.serializer,
    OrganisationsRecord(
      (o) => o
        ..address = address
        ..state = state
        ..country = country
        ..contactName = contactName
        ..email = email
        ..area = area
        ..phoneNumber = phoneNumber
        ..organisationRegistrationId = organisationRegistrationId
        ..organisationName = organisationName
        ..createdOn = createdOn
        ..pinCode = pinCode
        ..organisationLogo = organisationLogo
        ..district = district
        ..orgSector = orgSector
        ..ref = ref,
    ),
  );

  return firestoreData;
}
