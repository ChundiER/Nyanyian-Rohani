// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nyanyian_rohani_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NyanyianRohaniRecord> _$nyanyianRohaniRecordSerializer =
    new _$NyanyianRohaniRecordSerializer();

class _$NyanyianRohaniRecordSerializer
    implements StructuredSerializer<NyanyianRohaniRecord> {
  @override
  final Iterable<Type> types = const [
    NyanyianRohaniRecord,
    _$NyanyianRohaniRecord
  ];
  @override
  final String wireName = 'NyanyianRohaniRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NyanyianRohaniRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.namaNyanyian;
    if (value != null) {
      result
        ..add('namaNyanyian')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lirikNyanyian;
    if (value != null) {
      result
        ..add('lirikNyanyian')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nomorNyanyian;
    if (value != null) {
      result
        ..add('nomorNyanyian')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  NyanyianRohaniRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NyanyianRohaniRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'namaNyanyian':
          result.namaNyanyian = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lirikNyanyian':
          result.lirikNyanyian = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nomorNyanyian':
          result.nomorNyanyian = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$NyanyianRohaniRecord extends NyanyianRohaniRecord {
  @override
  final String? namaNyanyian;
  @override
  final String? lirikNyanyian;
  @override
  final int? nomorNyanyian;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NyanyianRohaniRecord(
          [void Function(NyanyianRohaniRecordBuilder)? updates]) =>
      (new NyanyianRohaniRecordBuilder()..update(updates))._build();

  _$NyanyianRohaniRecord._(
      {this.namaNyanyian, this.lirikNyanyian, this.nomorNyanyian, this.ffRef})
      : super._();

  @override
  NyanyianRohaniRecord rebuild(
          void Function(NyanyianRohaniRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NyanyianRohaniRecordBuilder toBuilder() =>
      new NyanyianRohaniRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NyanyianRohaniRecord &&
        namaNyanyian == other.namaNyanyian &&
        lirikNyanyian == other.lirikNyanyian &&
        nomorNyanyian == other.nomorNyanyian &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, namaNyanyian.hashCode), lirikNyanyian.hashCode),
            nomorNyanyian.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NyanyianRohaniRecord')
          ..add('namaNyanyian', namaNyanyian)
          ..add('lirikNyanyian', lirikNyanyian)
          ..add('nomorNyanyian', nomorNyanyian)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NyanyianRohaniRecordBuilder
    implements Builder<NyanyianRohaniRecord, NyanyianRohaniRecordBuilder> {
  _$NyanyianRohaniRecord? _$v;

  String? _namaNyanyian;
  String? get namaNyanyian => _$this._namaNyanyian;
  set namaNyanyian(String? namaNyanyian) => _$this._namaNyanyian = namaNyanyian;

  String? _lirikNyanyian;
  String? get lirikNyanyian => _$this._lirikNyanyian;
  set lirikNyanyian(String? lirikNyanyian) =>
      _$this._lirikNyanyian = lirikNyanyian;

  int? _nomorNyanyian;
  int? get nomorNyanyian => _$this._nomorNyanyian;
  set nomorNyanyian(int? nomorNyanyian) =>
      _$this._nomorNyanyian = nomorNyanyian;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NyanyianRohaniRecordBuilder() {
    NyanyianRohaniRecord._initializeBuilder(this);
  }

  NyanyianRohaniRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _namaNyanyian = $v.namaNyanyian;
      _lirikNyanyian = $v.lirikNyanyian;
      _nomorNyanyian = $v.nomorNyanyian;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NyanyianRohaniRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NyanyianRohaniRecord;
  }

  @override
  void update(void Function(NyanyianRohaniRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NyanyianRohaniRecord build() => _build();

  _$NyanyianRohaniRecord _build() {
    final _$result = _$v ??
        new _$NyanyianRohaniRecord._(
            namaNyanyian: namaNyanyian,
            lirikNyanyian: lirikNyanyian,
            nomorNyanyian: nomorNyanyian,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
