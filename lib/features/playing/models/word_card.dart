import 'package:json_annotation/json_annotation.dart';

part 'word_card.g.dart';

@JsonSerializable()
class WordCard {
  int id;
  String word;
  String description;
  int voiceId;

  WordCard({
    required this.id,
    required this.word,
    required this.description,
    required this.voiceId,
  });

  factory WordCard.fromJson(Map<String, dynamic> json) =>
      _$WordCardFromJson(json);

  Map<String, dynamic> toJson() => _$WordCardToJson(this);
}

/**
 * 
card model
{
  id: 1,
  word: apple,
  description: desc,
  voiceId: 음성
}
 */