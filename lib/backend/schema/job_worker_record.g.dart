// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_worker_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JobWorkerRecord> _$jobWorkerRecordSerializer =
    new _$JobWorkerRecordSerializer();

class _$JobWorkerRecordSerializer
    implements StructuredSerializer<JobWorkerRecord> {
  @override
  final Iterable<Type> types = const [JobWorkerRecord, _$JobWorkerRecord];
  @override
  final String wireName = 'JobWorkerRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, JobWorkerRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.contractSigned;
    if (value != null) {
      result
        ..add('contract_signed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.salary;
    if (value != null) {
      result
        ..add('salary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.modeOfSalary;
    if (value != null) {
      result
        ..add('mode_of_salary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobReference;
    if (value != null) {
      result
        ..add('job_reference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('end_date')
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
  JobWorkerRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JobWorkerRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'contract_signed':
          result.contractSigned = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'salary':
          result.salary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mode_of_salary':
          result.modeOfSalary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_reference':
          result.jobReference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'end_date':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'worker_id':
          result.workerId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$JobWorkerRecord extends JobWorkerRecord {
  @override
  final bool? contractSigned;
  @override
  final String? salary;
  @override
  final String? modeOfSalary;
  @override
  final DocumentReference<Object?>? jobReference;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final DocumentReference<Object?>? workerId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$JobWorkerRecord([void Function(JobWorkerRecordBuilder)? updates]) =>
      (new JobWorkerRecordBuilder()..update(updates))._build();

  _$JobWorkerRecord._(
      {this.contractSigned,
      this.salary,
      this.modeOfSalary,
      this.jobReference,
      this.startDate,
      this.endDate,
      this.workerId,
      this.ffRef})
      : super._();

  @override
  JobWorkerRecord rebuild(void Function(JobWorkerRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JobWorkerRecordBuilder toBuilder() =>
      new JobWorkerRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JobWorkerRecord &&
        contractSigned == other.contractSigned &&
        salary == other.salary &&
        modeOfSalary == other.modeOfSalary &&
        jobReference == other.jobReference &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        workerId == other.workerId &&
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
                            $jc($jc(0, contractSigned.hashCode),
                                salary.hashCode),
                            modeOfSalary.hashCode),
                        jobReference.hashCode),
                    startDate.hashCode),
                endDate.hashCode),
            workerId.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JobWorkerRecord')
          ..add('contractSigned', contractSigned)
          ..add('salary', salary)
          ..add('modeOfSalary', modeOfSalary)
          ..add('jobReference', jobReference)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('workerId', workerId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class JobWorkerRecordBuilder
    implements Builder<JobWorkerRecord, JobWorkerRecordBuilder> {
  _$JobWorkerRecord? _$v;

  bool? _contractSigned;
  bool? get contractSigned => _$this._contractSigned;
  set contractSigned(bool? contractSigned) =>
      _$this._contractSigned = contractSigned;

  String? _salary;
  String? get salary => _$this._salary;
  set salary(String? salary) => _$this._salary = salary;

  String? _modeOfSalary;
  String? get modeOfSalary => _$this._modeOfSalary;
  set modeOfSalary(String? modeOfSalary) => _$this._modeOfSalary = modeOfSalary;

  DocumentReference<Object?>? _jobReference;
  DocumentReference<Object?>? get jobReference => _$this._jobReference;
  set jobReference(DocumentReference<Object?>? jobReference) =>
      _$this._jobReference = jobReference;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  String? _endDate;
  String? get endDate => _$this._endDate;
  set endDate(String? endDate) => _$this._endDate = endDate;

  DocumentReference<Object?>? _workerId;
  DocumentReference<Object?>? get workerId => _$this._workerId;
  set workerId(DocumentReference<Object?>? workerId) =>
      _$this._workerId = workerId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  JobWorkerRecordBuilder() {
    JobWorkerRecord._initializeBuilder(this);
  }

  JobWorkerRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contractSigned = $v.contractSigned;
      _salary = $v.salary;
      _modeOfSalary = $v.modeOfSalary;
      _jobReference = $v.jobReference;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _workerId = $v.workerId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JobWorkerRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JobWorkerRecord;
  }

  @override
  void update(void Function(JobWorkerRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JobWorkerRecord build() => _build();

  _$JobWorkerRecord _build() {
    final _$result = _$v ??
        new _$JobWorkerRecord._(
            contractSigned: contractSigned,
            salary: salary,
            modeOfSalary: modeOfSalary,
            jobReference: jobReference,
            startDate: startDate,
            endDate: endDate,
            workerId: workerId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
