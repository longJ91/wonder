import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable()
class Chapter {
  int id;
  String title;
  String imageUrl;
  List<int> cardIds;
  Set<int> passCardIds;
  Set<int> failCardIds;

  Chapter({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.cardIds,
    required this.passCardIds,
    required this.failCardIds,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}

/**
 * 
chapter model
{
  id: 1,
  name: business
  cardIds: [
    1,
    2,
    5,
  ],
  knowCardIds: [
    3,
    4,
  ]
}
 */