// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kidung_jemaat_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KidungJemaatRecord> _$kidungJemaatRecordSerializer =
    new _$KidungJemaatRecordSerializer();

class _$KidungJemaatRecordSerializer
    implements StructuredSerializer<KidungJemaatRecord> {
  @override
  final Iterable<Type> types = const [KidungJemaatRecord, _$KidungJemaatRecord];
  @override
  final String wireName = 'KidungJemaatRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, KidungJemaatRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.namaKidungJemaat;
    if (value != null) {
      result
        ..add('namaKidungJemaat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lirikKidungJemaat;
    if (value != null) {
      result
        ..add('lirikKidungJemaat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nomorKidungJemaat;
    if (value != null) {
      result
        ..add('nomorKidungJemaat')
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
  KidungJemaatRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new KidungJemaatRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'namaKidungJemaat':
          result.namaKidungJemaat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lirikKidungJemaat':
          result.lirikKidungJemaat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nomorKidungJemaat':
          result.nomorKidungJemaat = serializers.deserialize(value,
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

class _$KidungJemaatRecord extends KidungJemaatRecord {
  @override
  final String? namaKidungJemaat;
  @override
  final String? lirikKidungJemaat;
  @override
  final int? nomorKidungJemaat;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$KidungJemaatRecord(
          [void Function(KidungJemaatRecordBuilder)? updates]) =>
      (new KidungJemaatRecordBuilder()..update(updates))._build();

  _$KidungJemaatRecord._(
      {this.namaKidungJemaat,
      this.lirikKidungJemaat,
      this.nomorKidungJemaat,
      this.ffRef})
      : super._();

  @override
  KidungJemaatRecord rebuild(
          void Function(KidungJemaatRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KidungJemaatRecordBuilder toBuilder() =>
      new KidungJemaatRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KidungJemaatRecord &&
        namaKidungJemaat == other.namaKidungJemaat &&
        lirikKidungJemaat == other.lirikKidungJemaat &&
        nomorKidungJemaat == other.nomorKidungJemaat &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, namaKidungJemaat.hashCode), lirikKidungJemaat.hashCode),
            nomorKidungJemaat.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'KidungJemaatRecord')
          ..add('namaKidungJemaat', namaKidungJemaat)
          ..add('lirikKidungJemaat', lirikKidungJemaat)
          ..add('nomorKidungJemaat', nomorKidungJemaat)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class KidungJemaatRecordBuilder
    implements Builder<KidungJemaatRecord, KidungJemaatRecordBuilder> {
  _$KidungJemaatRecord? _$v;

  String? _namaKidungJemaat;
  String? get namaKidungJemaat => _$this._namaKidungJemaat;
  set namaKidungJemaat(String? namaKidungJemaat) =>
      _$this._namaKidungJemaat = namaKidungJemaat;

  String? _lirikKidungJemaat;
  String? get lirikKidungJemaat => _$this._lirikKidungJemaat;
  set lirikKidungJemaat(String? lirikKidungJemaat) =>
      _$this._lirikKidungJemaat = lirikKidungJemaat;

  int? _nomorKidungJemaat;
  int? get nomorKidungJemaat => _$this._nomorKidungJemaat;
  set nomorKidungJemaat(int? nomorKidungJemaat) =>
      _$this._nomorKidungJemaat = nomorKidungJemaat;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  KidungJemaatRecordBuilder() {
    KidungJemaatRecord._initializeBuilder(this);
  }

  KidungJemaatRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _namaKidungJemaat = $v.namaKidungJemaat;
      _lirikKidungJemaat = $v.lirikKidungJemaat;
      _nomorKidungJemaat = $v.nomorKidungJemaat;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KidungJemaatRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$KidungJemaatRecord;
  }

  @override
  void update(void Function(KidungJemaatRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  KidungJemaatRecord build() => _build();

  _$KidungJemaatRecord _build() {
    final _$result = _$v ??
        new _$KidungJemaatRecord._(
            namaKidungJemaat: namaKidungJemaat,
            lirikKidungJemaat: lirikKidungJemaat,
            nomorKidungJemaat: nomorKidungJemaat,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
