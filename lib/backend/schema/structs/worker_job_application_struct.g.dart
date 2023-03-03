// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_job_application_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WorkerJobApplicationStruct> _$workerJobApplicationStructSerializer =
    new _$WorkerJobApplicationStructSerializer();

class _$WorkerJobApplicationStructSerializer
    implements StructuredSerializer<WorkerJobApplicationStruct> {
  @override
  final Iterable<Type> types = const [
    WorkerJobApplicationStruct,
    _$WorkerJobApplicationStruct
  ];
  @override
  final String wireName = 'WorkerJobApplicationStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WorkerJobApplicationStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.jobId;
    if (value != null) {
      result
        ..add('job_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.appliedOn;
    if (value != null) {
      result
        ..add('applied_on')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.applicationStatus;
    if (value != null) {
      result
        ..add('application_status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.jobTitle;
    if (value != null) {
      result
        ..add('job_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobsId;
    if (value != null) {
      result
        ..add('jobs_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orgName;
    if (value != null) {
      result
        ..add('org_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.keySkill;
    if (value != null) {
      result
        ..add('key_skill')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workerName;
    if (value != null) {
      result
        ..add('worker_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  WorkerJobApplicationStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkerJobApplicationStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'job_id':
          result.jobId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'applied_on':
          result.appliedOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'application_status':
          result.applicationStatus = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'job_title':
          result.jobTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jobs_id':
          result.jobsId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'org_name':
          result.orgName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'key_skill':
          result.keySkill = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'worker_name':
          result.workerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$WorkerJobApplicationStruct extends WorkerJobApplicationStruct {
  @override
  final DocumentReference<Object?>? jobId;
  @override
  final DateTime? appliedOn;
  @override
  final int? applicationStatus;
  @override
  final String? jobTitle;
  @override
  final String? jobsId;
  @override
  final String? orgName;
  @override
  final String? keySkill;
  @override
  final String? workerName;
  @override
  final int? status;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$WorkerJobApplicationStruct(
          [void Function(WorkerJobApplicationStructBuilder)? updates]) =>
      (new WorkerJobApplicationStructBuilder()..update(updates))._build();

  _$WorkerJobApplicationStruct._(
      {this.jobId,
      this.appliedOn,
      this.applicationStatus,
      this.jobTitle,
      this.jobsId,
      this.orgName,
      this.keySkill,
      this.workerName,
      this.status,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'WorkerJobApplicationStruct', 'firestoreUtilData');
  }

  @override
  WorkerJobApplicationStruct rebuild(
          void Function(WorkerJobApplicationStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkerJobApplicationStructBuilder toBuilder() =>
      new WorkerJobApplicationStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkerJobApplicationStruct &&
        jobId == other.jobId &&
        appliedOn == other.appliedOn &&
        applicationStatus == other.applicationStatus &&
        jobTitle == other.jobTitle &&
        jobsId == other.jobsId &&
        orgName == other.orgName &&
        keySkill == other.keySkill &&
        workerName == other.workerName &&
        status == other.status &&
        firestoreUtilData == other.firestoreUtilData;
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
                                    $jc($jc(0, jobId.hashCode),
                                        appliedOn.hashCode),
                                    applicationStatus.hashCode),
                                jobTitle.hashCode),
                            jobsId.hashCode),
                        orgName.hashCode),
                    keySkill.hashCode),
                workerName.hashCode),
            status.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkerJobApplicationStruct')
          ..add('jobId', jobId)
          ..add('appliedOn', appliedOn)
          ..add('applicationStatus', applicationStatus)
          ..add('jobTitle', jobTitle)
          ..add('jobsId', jobsId)
          ..add('orgName', orgName)
          ..add('keySkill', keySkill)
          ..add('workerName', workerName)
          ..add('status', status)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class WorkerJobApplicationStructBuilder
    implements
        Builder<WorkerJobApplicationStruct, WorkerJobApplicationStructBuilder> {
  _$WorkerJobApplicationStruct? _$v;

  DocumentReference<Object?>? _jobId;
  DocumentReference<Object?>? get jobId => _$this._jobId;
  set jobId(DocumentReference<Object?>? jobId) => _$this._jobId = jobId;

  DateTime? _appliedOn;
  DateTime? get appliedOn => _$this._appliedOn;
  set appliedOn(DateTime? appliedOn) => _$this._appliedOn = appliedOn;

  int? _applicationStatus;
  int? get applicationStatus => _$this._applicationStatus;
  set applicationStatus(int? applicationStatus) =>
      _$this._applicationStatus = applicationStatus;

  String? _jobTitle;
  String? get jobTitle => _$this._jobTitle;
  set jobTitle(String? jobTitle) => _$this._jobTitle = jobTitle;

  String? _jobsId;
  String? get jobsId => _$this._jobsId;
  set jobsId(String? jobsId) => _$this._jobsId = jobsId;

  String? _orgName;
  String? get orgName => _$this._orgName;
  set orgName(String? orgName) => _$this._orgName = orgName;

  String? _keySkill;
  String? get keySkill => _$this._keySkill;
  set keySkill(String? keySkill) => _$this._keySkill = keySkill;

  String? _workerName;
  String? get workerName => _$this._workerName;
  set workerName(String? workerName) => _$this._workerName = workerName;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  WorkerJobApplicationStructBuilder() {
    WorkerJobApplicationStruct._initializeBuilder(this);
  }

  WorkerJobApplicationStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jobId = $v.jobId;
      _appliedOn = $v.appliedOn;
      _applicationStatus = $v.applicationStatus;
      _jobTitle = $v.jobTitle;
      _jobsId = $v.jobsId;
      _orgName = $v.orgName;
      _keySkill = $v.keySkill;
      _workerName = $v.workerName;
      _status = $v.status;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkerJobApplicationStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkerJobApplicationStruct;
  }

  @override
  void update(void Function(WorkerJobApplicationStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkerJobApplicationStruct build() => _build();

  _$WorkerJobApplicationStruct _build() {
    final _$result = _$v ??
        new _$WorkerJobApplicationStruct._(
            jobId: jobId,
            appliedOn: appliedOn,
            applicationStatus: applicationStatus,
            jobTitle: jobTitle,
            jobsId: jobsId,
            orgName: orgName,
            keySkill: keySkill,
            workerName: workerName,
            status: status,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'WorkerJobApplicationStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
