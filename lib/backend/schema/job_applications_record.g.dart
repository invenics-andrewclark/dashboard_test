// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_applications_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JobApplicationsRecord> _$jobApplicationsRecordSerializer =
    new _$JobApplicationsRecordSerializer();

class _$JobApplicationsRecordSerializer
    implements StructuredSerializer<JobApplicationsRecord> {
  @override
  final Iterable<Type> types = const [
    JobApplicationsRecord,
    _$JobApplicationsRecord
  ];
  @override
  final String wireName = 'JobApplicationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, JobApplicationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.appliedDate;
    if (value != null) {
      result
        ..add('applied_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.applicationStatus;
    if (value != null) {
      result
        ..add('application_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workerId;
    if (value != null) {
      result
        ..add('worker_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.workerName;
    if (value != null) {
      result
        ..add('worker_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.skillName;
    if (value != null) {
      result
        ..add('skill_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.experienceLevel;
    if (value != null) {
      result
        ..add('experience_level')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workerImage;
    if (value != null) {
      result
        ..add('worker_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobId;
    if (value != null) {
      result
        ..add('job_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.organisationId;
    if (value != null) {
      result
        ..add('organisation_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.jobTitle;
    if (value != null) {
      result
        ..add('jobTitle')
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
  JobApplicationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JobApplicationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'applied_date':
          result.appliedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'application_status':
          result.applicationStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'comments':
          result.comments = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'worker_id':
          result.workerId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'worker_name':
          result.workerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'skill_name':
          result.skillName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'experience_level':
          result.experienceLevel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'worker_image':
          result.workerImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_id':
          result.jobId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'organisation_id':
          result.organisationId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'jobTitle':
          result.jobTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'organisation_name':
          result.organisationName = serializers.deserialize(value,
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

class _$JobApplicationsRecord extends JobApplicationsRecord {
  @override
  final DateTime? appliedDate;
  @override
  final String? applicationStatus;
  @override
  final String? comments;
  @override
  final DocumentReference<Object?>? workerId;
  @override
  final String? workerName;
  @override
  final String? gender;
  @override
  final String? skillName;
  @override
  final String? experienceLevel;
  @override
  final String? workerImage;
  @override
  final DocumentReference<Object?>? jobId;
  @override
  final DocumentReference<Object?>? organisationId;
  @override
  final String? jobTitle;
  @override
  final String? organisationName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$JobApplicationsRecord(
          [void Function(JobApplicationsRecordBuilder)? updates]) =>
      (new JobApplicationsRecordBuilder()..update(updates))._build();

  _$JobApplicationsRecord._(
      {this.appliedDate,
      this.applicationStatus,
      this.comments,
      this.workerId,
      this.workerName,
      this.gender,
      this.skillName,
      this.experienceLevel,
      this.workerImage,
      this.jobId,
      this.organisationId,
      this.jobTitle,
      this.organisationName,
      this.ffRef})
      : super._();

  @override
  JobApplicationsRecord rebuild(
          void Function(JobApplicationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JobApplicationsRecordBuilder toBuilder() =>
      new JobApplicationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobApplicationsRecord &&
        appliedDate == other.appliedDate &&
        applicationStatus == other.applicationStatus &&
        comments == other.comments &&
        workerId == other.workerId &&
        workerName == other.workerName &&
        gender == other.gender &&
        skillName == other.skillName &&
        experienceLevel == other.experienceLevel &&
        workerImage == other.workerImage &&
        jobId == other.jobId &&
        organisationId == other.organisationId &&
        jobTitle == other.jobTitle &&
        organisationName == other.organisationName &&
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            0,
                                                            appliedDate
                                                                .hashCode),
                                                        applicationStatus
                                                            .hashCode),
                                                    comments.hashCode),
                                                workerId.hashCode),
                                            workerName.hashCode),
                                        gender.hashCode),
                                    skillName.hashCode),
                                experienceLevel.hashCode),
                            workerImage.hashCode),
                        jobId.hashCode),
                    organisationId.hashCode),
                jobTitle.hashCode),
            organisationName.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JobApplicationsRecord')
          ..add('appliedDate', appliedDate)
          ..add('applicationStatus', applicationStatus)
          ..add('comments', comments)
          ..add('workerId', workerId)
          ..add('workerName', workerName)
          ..add('gender', gender)
          ..add('skillName', skillName)
          ..add('experienceLevel', experienceLevel)
          ..add('workerImage', workerImage)
          ..add('jobId', jobId)
          ..add('organisationId', organisationId)
          ..add('jobTitle', jobTitle)
          ..add('organisationName', organisationName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class JobApplicationsRecordBuilder
    implements Builder<JobApplicationsRecord, JobApplicationsRecordBuilder> {
  _$JobApplicationsRecord? _$v;

  DateTime? _appliedDate;
  DateTime? get appliedDate => _$this._appliedDate;
  set appliedDate(DateTime? appliedDate) => _$this._appliedDate = appliedDate;

  String? _applicationStatus;
  String? get applicationStatus => _$this._applicationStatus;
  set applicationStatus(String? applicationStatus) =>
      _$this._applicationStatus = applicationStatus;

  String? _comments;
  String? get comments => _$this._comments;
  set comments(String? comments) => _$this._comments = comments;

  DocumentReference<Object?>? _workerId;
  DocumentReference<Object?>? get workerId => _$this._workerId;
  set workerId(DocumentReference<Object?>? workerId) =>
      _$this._workerId = workerId;

  String? _workerName;
  String? get workerName => _$this._workerName;
  set workerName(String? workerName) => _$this._workerName = workerName;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  String? _skillName;
  String? get skillName => _$this._skillName;
  set skillName(String? skillName) => _$this._skillName = skillName;

  String? _experienceLevel;
  String? get experienceLevel => _$this._experienceLevel;
  set experienceLevel(String? experienceLevel) =>
      _$this._experienceLevel = experienceLevel;

  String? _workerImage;
  String? get workerImage => _$this._workerImage;
  set workerImage(String? workerImage) => _$this._workerImage = workerImage;

  DocumentReference<Object?>? _jobId;
  DocumentReference<Object?>? get jobId => _$this._jobId;
  set jobId(DocumentReference<Object?>? jobId) => _$this._jobId = jobId;

  DocumentReference<Object?>? _organisationId;
  DocumentReference<Object?>? get organisationId => _$this._organisationId;
  set organisationId(DocumentReference<Object?>? organisationId) =>
      _$this._organisationId = organisationId;

  String? _jobTitle;
  String? get jobTitle => _$this._jobTitle;
  set jobTitle(String? jobTitle) => _$this._jobTitle = jobTitle;

  String? _organisationName;
  String? get organisationName => _$this._organisationName;
  set organisationName(String? organisationName) =>
      _$this._organisationName = organisationName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  JobApplicationsRecordBuilder() {
    JobApplicationsRecord._initializeBuilder(this);
  }

  JobApplicationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appliedDate = $v.appliedDate;
      _applicationStatus = $v.applicationStatus;
      _comments = $v.comments;
      _workerId = $v.workerId;
      _workerName = $v.workerName;
      _gender = $v.gender;
      _skillName = $v.skillName;
      _experienceLevel = $v.experienceLevel;
      _workerImage = $v.workerImage;
      _jobId = $v.jobId;
      _organisationId = $v.organisationId;
      _jobTitle = $v.jobTitle;
      _organisationName = $v.organisationName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JobApplicationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JobApplicationsRecord;
  }

  @override
  void update(void Function(JobApplicationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JobApplicationsRecord build() => _build();

  _$JobApplicationsRecord _build() {
    final _$result = _$v ??
        new _$JobApplicationsRecord._(
            appliedDate: appliedDate,
            applicationStatus: applicationStatus,
            comments: comments,
            workerId: workerId,
            workerName: workerName,
            gender: gender,
            skillName: skillName,
            experienceLevel: experienceLevel,
            workerImage: workerImage,
            jobId: jobId,
            organisationId: organisationId,
            jobTitle: jobTitle,
            organisationName: organisationName,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
