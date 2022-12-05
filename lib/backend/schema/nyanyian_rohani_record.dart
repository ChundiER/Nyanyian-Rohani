import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'nyanyian_rohani_record.g.dart';

abstract class NyanyianRohaniRecord
    implements Built<NyanyianRohaniRecord, NyanyianRohaniRecordBuilder> {
  static Serializer<NyanyianRohaniRecord> get serializer =>
      _$nyanyianRohaniRecordSerializer;

  String? get namaNyanyian;

  String? get lirikNyanyian;

  int? get nomorNyanyian;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NyanyianRohaniRecordBuilder builder) => builder
    ..namaNyanyian = ''
    ..lirikNyanyian = ''
    ..nomorNyanyian = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nyanyianRohani');

  static Stream<NyanyianRohaniRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NyanyianRohaniRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NyanyianRohaniRecord._();
  factory NyanyianRohaniRecord(
          [void Function(NyanyianRohaniRecordBuilder) updates]) =
      _$NyanyianRohaniRecord;

  static NyanyianRohaniRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNyanyianRohaniRecordData({
  String? namaNyanyian,
  String? lirikNyanyian,
  int? nomorNyanyian,
}) {
  final firestoreData = serializers.toFirestore(
    NyanyianRohaniRecord.serializer,
    NyanyianRohaniRecord(
      (n) => n
        ..namaNyanyian = namaNyanyian
        ..lirikNyanyian = lirikNyanyian
        ..nomorNyanyian = nomorNyanyian,
    ),
  );

  return firestoreData;
}
