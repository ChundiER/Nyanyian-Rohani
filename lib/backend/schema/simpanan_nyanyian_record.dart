import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'simpanan_nyanyian_record.g.dart';

abstract class SimpananNyanyianRecord
    implements Built<SimpananNyanyianRecord, SimpananNyanyianRecordBuilder> {
  static Serializer<SimpananNyanyianRecord> get serializer =>
      _$simpananNyanyianRecordSerializer;

  String? get namaLagu;

  String? get lirikLagu;

  int? get nomorLagu;

  String? get tipeLagu;

  bool? get favorite;

  String? get audioLagu;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(SimpananNyanyianRecordBuilder builder) =>
      builder
        ..namaLagu = ''
        ..lirikLagu = ''
        ..nomorLagu = 0
        ..tipeLagu = ''
        ..favorite = false
        ..audioLagu = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('simpananNyanyian')
          : FirebaseFirestore.instance.collectionGroup('simpananNyanyian');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('simpananNyanyian').doc();

  static Stream<SimpananNyanyianRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SimpananNyanyianRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SimpananNyanyianRecord._();
  factory SimpananNyanyianRecord(
          [void Function(SimpananNyanyianRecordBuilder) updates]) =
      _$SimpananNyanyianRecord;

  static SimpananNyanyianRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSimpananNyanyianRecordData({
  String? namaLagu,
  String? lirikLagu,
  int? nomorLagu,
  String? tipeLagu,
  bool? favorite,
  String? audioLagu,
}) {
  final firestoreData = serializers.toFirestore(
    SimpananNyanyianRecord.serializer,
    SimpananNyanyianRecord(
      (s) => s
        ..namaLagu = namaLagu
        ..lirikLagu = lirikLagu
        ..nomorLagu = nomorLagu
        ..tipeLagu = tipeLagu
        ..favorite = favorite
        ..audioLagu = audioLagu,
    ),
  );

  return firestoreData;
}
