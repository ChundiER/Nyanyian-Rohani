// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mazmur_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MazmurRecord> _$mazmurRecordSerializer =
    new _$MazmurRecordSerializer();

class _$MazmurRecordSerializer implements StructuredSerializer<MazmurRecord> {
  @override
  final Iterable<Type> types = const [MazmurRecord, _$MazmurRecord];
  @override
  final String wireName = 'MazmurRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MazmurRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.namaMazmur;
    if (value != null) {
      result
        ..add('namaMazmur')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lirikMazmur;
    if (value != null) {
      result
        ..add('lirikMazmur')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nomorMazmur;
    if (value != null) {
      result
        ..add('nomorMazmur')
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
  MazmurRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MazmurRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'namaMazmur':
          result.namaMazmur = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lirikMazmur':
          result.lirikMazmur = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nomorMazmur':
          result.nomorMazmur = serializers.deserialize(value,
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

class _$MazmurRecord extends MazmurRecord {
  @override
  final String? namaMazmur;
  @override
  final String? lirikMazmur;
  @override
  final int? nomorMazmur;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MazmurRecord([void Function(MazmurRecordBuilder)? updates]) =>
      (new MazmurRecordBuilder()..update(updates))._build();

  _$MazmurRecord._(
      {this.namaMazmur, this.lirikMazmur, this.nomorMazmur, this.ffRef})
      : super._();

  @override
  MazmurRecord rebuild(void Function(MazmurRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MazmurRecordBuilder toBuilder() => new MazmurRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MazmurRecord &&
        namaMazmur == other.namaMazmur &&
        lirikMazmur == other.lirikMazmur &&
        nomorMazmur == other.nomorMazmur &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, namaMazmur.hashCode), lirikMazmur.hashCode),
            nomorMazmur.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MazmurRecord')
          ..add('namaMazmur', namaMazmur)
          ..add('lirikMazmur', lirikMazmur)
          ..add('nomorMazmur', nomorMazmur)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MazmurRecordBuilder
    implements Builder<MazmurRecord, MazmurRecordBuilder> {
  _$MazmurRecord? _$v;

  String? _namaMazmur;
  String? get namaMazmur => _$this._namaMazmur;
  set namaMazmur(String? namaMazmur) => _$this._namaMazmur = namaMazmur;

  String? _lirikMazmur;
  String? get lirikMazmur => _$this._lirikMazmur;
  set lirikMazmur(String? lirikMazmur) => _$this._lirikMazmur = lirikMazmur;

  int? _nomorMazmur;
  int? get nomorMazmur => _$this._nomorMazmur;
  set nomorMazmur(int? nomorMazmur) => _$this._nomorMazmur = nomorMazmur;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MazmurRecordBuilder() {
    MazmurRecord._initializeBuilder(this);
  }

  MazmurRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _namaMazmur = $v.namaMazmur;
      _lirikMazmur = $v.lirikMazmur;
      _nomorMazmur = $v.nomorMazmur;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MazmurRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MazmurRecord;
  }

  @override
  void update(void Function(MazmurRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MazmurRecord build() => _build();

  _$MazmurRecord _build() {
    final _$result = _$v ??
        new _$MazmurRecord._(
            namaMazmur: namaMazmur,
            lirikMazmur: lirikMazmur,
            nomorMazmur: nomorMazmur,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
