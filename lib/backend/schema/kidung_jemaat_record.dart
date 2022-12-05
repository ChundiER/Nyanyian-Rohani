import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'kidung_jemaat_record.g.dart';

abstract class KidungJemaatRecord
    implements Built<KidungJemaatRecord, KidungJemaatRecordBuilder> {
  static Serializer<KidungJemaatRecord> get serializer =>
      _$kidungJemaatRecordSerializer;

  String? get namaKidungJemaat;

  String? get lirikKidungJemaat;

  int? get nomorKidungJemaat;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(KidungJemaatRecordBuilder builder) => builder
    ..namaKidungJemaat = ''
    ..lirikKidungJemaat = ''
    ..nomorKidungJemaat = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kidungJemaat');

  static Stream<KidungJemaatRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<KidungJemaatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  KidungJemaatRecord._();
  factory KidungJemaatRecord(
          [void Function(KidungJemaatRecordBuilder) updates]) =
      _$KidungJemaatRecord;

  static KidungJemaatRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createKidungJemaatRecordData({
  String? namaKidungJemaat,
  String? lirikKidungJemaat,
  int? nomorKidungJemaat,
}) {
  final firestoreData = serializers.toFirestore(
    KidungJemaatRecord.serializer,
    KidungJemaatRecord(
      (k) => k
        ..namaKidungJemaat = namaKidungJemaat
        ..lirikKidungJemaat = lirikKidungJemaat
        ..nomorKidungJemaat = nomorKidungJemaat,
    ),
  );

  return firestoreData;
}
