// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordCard _$WordCardFromJson(Map<String, dynamic> json) => WordCard(
      id: json['id'] as int,
      word: json['word'] as String,
      description: json['description'] as String,
      voiceId: json['voiceId'] as int,
    );

Map<String, dynamic> _$WordCardToJson(WordCard instance) => <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'description': instance.description,
      'voiceId': instance.voiceId,
    };
