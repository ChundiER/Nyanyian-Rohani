import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mazmur_record.g.dart';

abstract class MazmurRecord
    implements Built<MazmurRecord, MazmurRecordBuilder> {
  static Serializer<MazmurRecord> get serializer => _$mazmurRecordSerializer;

  String? get namaMazmur;

  String? get lirikMazmur;

  int? get nomorMazmur;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MazmurRecordBuilder builder) => builder
    ..namaMazmur = ''
    ..lirikMazmur = ''
    ..nomorMazmur = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Mazmur');

  static Stream<MazmurRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MazmurRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MazmurRecord._();
  factory MazmurRecord([void Function(MazmurRecordBuilder) updates]) =
      _$MazmurRecord;

  static MazmurRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMazmurRecordData({
  String? namaMazmur,
  String? lirikMazmur,
  int? nomorMazmur,
}) {
  final firestoreData = serializers.toFirestore(
    MazmurRecord.serializer,
    MazmurRecord(
      (m) => m
        ..namaMazmur = namaMazmur
        ..lirikMazmur = lirikMazmur
        ..nomorMazmur = nomorMazmur,
    ),
  );

  return firestoreData;
}
