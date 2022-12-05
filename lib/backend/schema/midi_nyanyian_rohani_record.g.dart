// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'midi_nyanyian_rohani_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MidiNyanyianRohaniRecord> _$midiNyanyianRohaniRecordSerializer =
    new _$MidiNyanyianRohaniRecordSerializer();

class _$MidiNyanyianRohaniRecordSerializer
    implements StructuredSerializer<MidiNyanyianRohaniRecord> {
  @override
  final Iterable<Type> types = const [
    MidiNyanyianRohaniRecord,
    _$MidiNyanyianRohaniRecord
  ];
  @override
  final String wireName = 'MidiNyanyianRohaniRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MidiNyanyianRohaniRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.namaLagu;
    if (value != null) {
      result
        ..add('namaLagu')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lirikLagu;
    if (value != null) {
      result
        ..add('lirikLagu')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nomorLagu;
    if (value != null) {
      result
        ..add('nomorLagu')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tipeLagu;
    if (value != null) {
      result
        ..add('tipeLagu')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.favorite;
    if (value != null) {
      result
        ..add('favorite')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.audioLagu;
    if (value != null) {
      result
        ..add('audioLagu')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.kategoriLagu;
    if (value != null) {
      result
        ..add('kategoriLagu')
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
  MidiNyanyianRohaniRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MidiNyanyianRohaniRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'namaLagu':
          result.namaLagu = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lirikLagu':
          result.lirikLagu = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nomorLagu':
          result.nomorLagu = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'tipeLagu':
          result.tipeLagu = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'favorite':
          result.favorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'audioLagu':
          result.audioLagu = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'kategoriLagu':
          result.kategoriLagu = serializers.deserialize(value,
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

class _$MidiNyanyianRohaniRecord extends MidiNyanyianRohaniRecord {
  @override
  final String? namaLagu;
  @override
  final String? lirikLagu;
  @override
  final int? nomorLagu;
  @override
  final String? tipeLagu;
  @override
  final bool? favorite;
  @override
  final String? audioLagu;
  @override
  final String? kategoriLagu;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MidiNyanyianRohaniRecord(
          [void Function(MidiNyanyianRohaniRecordBuilder)? updates]) =>
      (new MidiNyanyianRohaniRecordBuilder()..update(updates))._build();

  _$MidiNyanyianRohaniRecord._(
      {this.namaLagu,
      this.lirikLagu,
      this.nomorLagu,
      this.tipeLagu,
      this.favorite,
      this.audioLagu,
      this.kategoriLagu,
      this.ffRef})
      : super._();

  @override
  MidiNyanyianRohaniRecord rebuild(
          void Function(MidiNyanyianRohaniRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MidiNyanyianRohaniRecordBuilder toBuilder() =>
      new MidiNyanyianRohaniRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MidiNyanyianRohaniRecord &&
        namaLagu == other.namaLagu &&
        lirikLagu == other.lirikLagu &&
        nomorLagu == other.nomorLagu &&
        tipeLagu == other.tipeLagu &&
        favorite == other.favorite &&
        audioLagu == other.audioLagu &&
        kategoriLagu == other.kategoriLagu &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, namaLagu.hashCode), lirikLagu.hashCode),
                            nomorLagu.hashCode),
                        tipeLagu.hashCode),
                    favorite.hashCode),
                audioLagu.hashCode),
            kategoriLagu.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MidiNyanyianRohaniRecord')
          ..add('namaLagu', namaLagu)
          ..add('lirikLagu', lirikLagu)
          ..add('nomorLagu', nomorLagu)
          ..add('tipeLagu', tipeLagu)
          ..add('favorite', favorite)
          ..add('audioLagu', audioLagu)
          ..add('kategoriLagu', kategoriLagu)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MidiNyanyianRohaniRecordBuilder
    implements
        Builder<MidiNyanyianRohaniRecord, MidiNyanyianRohaniRecordBuilder> {
  _$MidiNyanyianRohaniRecord? _$v;

  String? _namaLagu;
  String? get namaLagu => _$this._namaLagu;
  set namaLagu(String? namaLagu) => _$this._namaLagu = namaLagu;

  String? _lirikLagu;
  String? get lirikLagu => _$this._lirikLagu;
  set lirikLagu(String? lirikLagu) => _$this._lirikLagu = lirikLagu;

  int? _nomorLagu;
  int? get nomorLagu => _$this._nomorLagu;
  set nomorLagu(int? nomorLagu) => _$this._nomorLagu = nomorLagu;

  String? _tipeLagu;
  String? get tipeLagu => _$this._tipeLagu;
  set tipeLagu(String? tipeLagu) => _$this._tipeLagu = tipeLagu;

  bool? _favorite;
  bool? get favorite => _$this._favorite;
  set favorite(bool? favorite) => _$this._favorite = favorite;

  String? _audioLagu;
  String? get audioLagu => _$this._audioLagu;
  set audioLagu(String? audioLagu) => _$this._audioLagu = audioLagu;

  String? _kategoriLagu;
  String? get kategoriLagu => _$this._kategoriLagu;
  set kategoriLagu(String? kategoriLagu) => _$this._kategoriLagu = kategoriLagu;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MidiNyanyianRohaniRecordBuilder() {
    MidiNyanyianRohaniRecord._initializeBuilder(this);
  }

  MidiNyanyianRohaniRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _namaLagu = $v.namaLagu;
      _lirikLagu = $v.lirikLagu;
      _nomorLagu = $v.nomorLagu;
      _tipeLagu = $v.tipeLagu;
      _favorite = $v.favorite;
      _audioLagu = $v.audioLagu;
      _kategoriLagu = $v.kategoriLagu;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MidiNyanyianRohaniRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MidiNyanyianRohaniRecord;
  }

  @override
  void update(void Function(MidiNyanyianRohaniRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MidiNyanyianRohaniRecord build() => _build();

  _$MidiNyanyianRohaniRecord _build() {
    final _$result = _$v ??
        new _$MidiNyanyianRohaniRecord._(
            namaLagu: namaLagu,
            lirikLagu: lirikLagu,
            nomorLagu: nomorLagu,
            tipeLagu: tipeLagu,
            favorite: favorite,
            audioLagu: audioLagu,
            kategoriLagu: kategoriLagu,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
