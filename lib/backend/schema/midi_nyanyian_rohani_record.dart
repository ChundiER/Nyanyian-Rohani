import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'midi_nyanyian_rohani_record.g.dart';

abstract class MidiNyanyianRohaniRecord
    implements
        Built<MidiNyanyianRohaniRecord, MidiNyanyianRohaniRecordBuilder> {
  static Serializer<MidiNyanyianRohaniRecord> get serializer =>
      _$midiNyanyianRohaniRecordSerializer;

  String? get namaLagu;

  String? get lirikLagu;

  int? get nomorLagu;

  String? get tipeLagu;

  bool? get favorite;

  String? get audioLagu;

  String? get kategoriLagu;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MidiNyanyianRohaniRecordBuilder builder) =>
      builder
        ..namaLagu = ''
        ..lirikLagu = ''
        ..nomorLagu = 0
        ..tipeLagu = ''
        ..favorite = false
        ..audioLagu = ''
        ..kategoriLagu = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('midiNyanyianRohani');

  static Stream<MidiNyanyianRohaniRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MidiNyanyianRohaniRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MidiNyanyianRohaniRecord._();
  factory MidiNyanyianRohaniRecord(
          [void Function(MidiNyanyianRohaniRecordBuilder) updates]) =
      _$MidiNyanyianRohaniRecord;

  static MidiNyanyianRohaniRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMidiNyanyianRohaniRecordData({
  String? namaLagu,
  String? lirikLagu,
  int? nomorLagu,
  String? tipeLagu,
  bool? favorite,
  String? audioLagu,
  String? kategoriLagu,
}) {
  final firestoreData = serializers.toFirestore(
    MidiNyanyianRohaniRecord.serializer,
    MidiNyanyianRohaniRecord(
      (m) => m
        ..namaLagu = namaLagu
        ..lirikLagu = lirikLagu
        ..nomorLagu = nomorLagu
        ..tipeLagu = tipeLagu
        ..favorite = favorite
        ..audioLagu = audioLagu
        ..kategoriLagu = kategoriLagu,
    ),
  );

  return firestoreData;
}
