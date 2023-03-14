// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      cardIds: (json['cardIds'] as List<dynamic>).map((e) => e as int).toList(),
      passCardIds:
          (json['passCardIds'] as List<dynamic>).map((e) => e as int).toSet(),
      failCardIds:
          (json['failCardIds'] as List<dynamic>).map((e) => e as int).toSet(),
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'cardIds': instance.cardIds,
      'passCardIds': instance.passCardIds.toList(),
      'failCardIds': instance.failCardIds.toList(),
    };
