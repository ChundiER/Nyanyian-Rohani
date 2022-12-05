import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'nyanyian_seluruh_record.g.dart';

abstract class NyanyianSeluruhRecord
    implements Built<NyanyianSeluruhRecord, NyanyianSeluruhRecordBuilder> {
  static Serializer<NyanyianSeluruhRecord> get serializer =>
      _$nyanyianSeluruhRecordSerializer;

  String? get namaLagu;

  String? get lirikLagu;

  int? get nomorLagu;

  String? get tipeLagu;

  bool? get favorite;

  String? get audioLagu;

  int? get jumlahClick;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NyanyianSeluruhRecordBuilder builder) =>
      builder
        ..namaLagu = ''
        ..lirikLagu = ''
        ..nomorLagu = 0
        ..tipeLagu = ''
        ..favorite = false
        ..audioLagu = ''
        ..jumlahClick = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nyanyianSeluruh');

  static Stream<NyanyianSeluruhRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NyanyianSeluruhRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NyanyianSeluruhRecord._();
  factory NyanyianSeluruhRecord(
          [void Function(NyanyianSeluruhRecordBuilder) updates]) =
      _$NyanyianSeluruhRecord;

  static NyanyianSeluruhRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNyanyianSeluruhRecordData({
  String? namaLagu,
  String? lirikLagu,
  int? nomorLagu,
  String? tipeLagu,
  bool? favorite,
  String? audioLagu,
  int? jumlahClick,
}) {
  final firestoreData = serializers.toFirestore(
    NyanyianSeluruhRecord.serializer,
    NyanyianSeluruhRecord(
      (n) => n
        ..namaLagu = namaLagu
        ..lirikLagu = lirikLagu
        ..nomorLagu = nomorLagu
        ..tipeLagu = tipeLagu
        ..favorite = favorite
        ..audioLagu = audioLagu
        ..jumlahClick = jumlahClick,
    ),
  );

  return firestoreData;
}
