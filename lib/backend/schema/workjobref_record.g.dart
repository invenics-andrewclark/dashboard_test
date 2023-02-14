// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workjobref_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WorkjobrefRecord> _$workjobrefRecordSerializer =
    new _$WorkjobrefRecordSerializer();

class _$WorkjobrefRecordSerializer
    implements StructuredSerializer<WorkjobrefRecord> {
  @override
  final Iterable<Type> types = const [WorkjobrefRecord, _$WorkjobrefRecord];
  @override
  final String wireName = 'WorkjobrefRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, WorkjobrefRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.refid;
    if (value != null) {
      result
        ..add('refid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.workRef;
    if (value != null) {
      result
        ..add('work_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.workerRef;
    if (value != null) {
      result
        ..add('WORKER_REF')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('Phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobName;
    if (value != null) {
      result
        ..add('job_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.salary;
    if (value != null) {
      result
        ..add('salary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.payscale;
    if (value != null) {
      result
        ..add('payscale')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.workerName;
    if (value != null) {
      result
        ..add('worker_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workerGender;
    if (value != null) {
      result
        ..add('worker_gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workerArea;
    if (value != null) {
      result
        ..add('worker_area')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organisationName;
    if (value != null) {
      result
        ..add('organisation_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orgSector;
    if (value != null) {
      result
        ..add('org_sector')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  WorkjobrefRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkjobrefRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'refid':
          result.refid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'work_ref':
          result.workRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'WORKER_REF':
          result.workerRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_name':
          result.jobName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'salary':
          result.salary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payscale':
          result.payscale = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'worker_name':
          result.workerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'worker_gender':
          result.workerGender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'worker_area':
          result.workerArea = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'organisation_name':
          result.organisationName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'org_sector':
          result.orgSector = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$WorkjobrefRecord extends WorkjobrefRecord {
  @override
  final DocumentReference<Object?>? refid;
  @override
  final DocumentReference<Object?>? workRef;
  @override
  final DocumentReference<Object?>? workerRef;
  @override
  final String? phone;
  @override
  final String? jobName;
  @override
  final String? salary;
  @override
  final int? payscale;
  @override
  final String? workerName;
  @override
  final String? workerGender;
  @override
  final String? workerArea;
  @override
  final String? organisationName;
  @override
  final String? orgSector;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$WorkjobrefRecord(
          [void Function(WorkjobrefRecordBuilder)? updates]) =>
      (new WorkjobrefRecordBuilder()..update(updates))._build();

  _$WorkjobrefRecord._(
      {this.refid,
      this.workRef,
      this.workerRef,
      this.phone,
      this.jobName,
      this.salary,
      this.payscale,
      this.workerName,
      this.workerGender,
      this.workerArea,
      this.organisationName,
      this.orgSector,
      this.ffRef})
      : super._();

  @override
  WorkjobrefRecord rebuild(void Function(WorkjobrefRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkjobrefRecordBuilder toBuilder() =>
      new WorkjobrefRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkjobrefRecord &&
        refid == other.refid &&
        workRef == other.workRef &&
        workerRef == other.workerRef &&
        phone == other.phone &&
        jobName == other.jobName &&
        salary == other.salary &&
        payscale == other.payscale &&
        workerName == other.workerName &&
        workerGender == other.workerGender &&
        workerArea == other.workerArea &&
        organisationName == other.organisationName &&
        orgSector == other.orgSector &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, refid.hashCode),
                                                    workRef.hashCode),
                                                workerRef.hashCode),
                                            phone.hashCode),
                                        jobName.hashCode),
                                    salary.hashCode),
                                payscale.hashCode),
                            workerName.hashCode),
                        workerGender.hashCode),
                    workerArea.hashCode),
                organisationName.hashCode),
            orgSector.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkjobrefRecord')
          ..add('refid', refid)
          ..add('workRef', workRef)
          ..add('workerRef', workerRef)
          ..add('phone', phone)
          ..add('jobName', jobName)
          ..add('salary', salary)
          ..add('payscale', payscale)
          ..add('workerName', workerName)
          ..add('workerGender', workerGender)
          ..add('workerArea', workerArea)
          ..add('organisationName', organisationName)
          ..add('orgSector', orgSector)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class WorkjobrefRecordBuilder
    implements Builder<WorkjobrefRecord, WorkjobrefRecordBuilder> {
  _$WorkjobrefRecord? _$v;

  DocumentReference<Object?>? _refid;
  DocumentReference<Object?>? get refid => _$this._refid;
  set refid(DocumentReference<Object?>? refid) => _$this._refid = refid;

  DocumentReference<Object?>? _workRef;
  DocumentReference<Object?>? get workRef => _$this._workRef;
  set workRef(DocumentReference<Object?>? workRef) => _$this._workRef = workRef;

  DocumentReference<Object?>? _workerRef;
  DocumentReference<Object?>? get workerRef => _$this._workerRef;
  set workerRef(DocumentReference<Object?>? workerRef) =>
      _$this._workerRef = workerRef;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _jobName;
  String? get jobName => _$this._jobName;
  set jobName(String? jobName) => _$this._jobName = jobName;

  String? _salary;
  String? get salary => _$this._salary;
  set salary(String? salary) => _$this._salary = salary;

  int? _payscale;
  int? get payscale => _$this._payscale;
  set payscale(int? payscale) => _$this._payscale = payscale;

  String? _workerName;
  String? get workerName => _$this._workerName;
  set workerName(String? workerName) => _$this._workerName = workerName;

  String? _workerGender;
  String? get workerGender => _$this._workerGender;
  set workerGender(String? workerGender) => _$this._workerGender = workerGender;

  String? _workerArea;
  String? get workerArea => _$this._workerArea;
  set workerArea(String? workerArea) => _$this._workerArea = workerArea;

  String? _organisationName;
  String? get organisationName => _$this._organisationName;
  set organisationName(String? organisationName) =>
      _$this._organisationName = organisationName;

  String? _orgSector;
  String? get orgSector => _$this._orgSector;
  set orgSector(String? orgSector) => _$this._orgSector = orgSector;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  WorkjobrefRecordBuilder() {
    WorkjobrefRecord._initializeBuilder(this);
  }

  WorkjobrefRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _refid = $v.refid;
      _workRef = $v.workRef;
      _workerRef = $v.workerRef;
      _phone = $v.phone;
      _jobName = $v.jobName;
      _salary = $v.salary;
      _payscale = $v.payscale;
      _workerName = $v.workerName;
      _workerGender = $v.workerGender;
      _workerArea = $v.workerArea;
      _organisationName = $v.organisationName;
      _orgSector = $v.orgSector;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkjobrefRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkjobrefRecord;
  }

  @override
  void update(void Function(WorkjobrefRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkjobrefRecord build() => _build();

  _$WorkjobrefRecord _build() {
    final _$result = _$v ??
        new _$WorkjobrefRecord._(
            refid: refid,
            workRef: workRef,
            workerRef: workerRef,
            phone: phone,
            jobName: jobName,
            salary: salary,
            payscale: payscale,
            workerName: workerName,
            workerGender: workerGender,
            workerArea: workerArea,
            organisationName: organisationName,
            orgSector: orgSector,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
