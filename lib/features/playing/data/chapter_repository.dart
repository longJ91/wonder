import '../models/chapter.dart';

class ChapterRepository {
  ChapterRepository();

  List<Chapter> getChapters() {
    final List<Chapter> chaters = [
      Chapter(
        id: 1,
        title: "title",
        imageUrl: "imageUrl",
        cardIds: [
          1,
          2,
          3,
          4,
          5,
        ],
        passCardIds: <int>{},
        failCardIds: <int>{},
      ),
      Chapter(
        id: 2,
        title: "title2",
        imageUrl: "imageUrl2",
        cardIds: [
          5,
          6,
          7,
          8,
          9,
        ],
        passCardIds: <int>{},
        failCardIds: <int>{},
      )
    ];
    return chaters;
  }
}
