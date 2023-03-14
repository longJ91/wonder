import 'package:equatable/equatable.dart';

import '../models/word_card.dart';
import '../models/chapter.dart';

enum ChapterStatus { empty, initial, play, review, finish, error }

class ChapterState extends Equatable {
  const ChapterState({
    this.status = ChapterStatus.empty,
    this.chapters = const <Chapter>[],
    this.cards = const <WordCard>[],
  });

  final ChapterStatus status;
  final List<Chapter> chapters;
  final List<WordCard> cards;

  ChapterState copyWith({
    ChapterStatus? status,
    List<Chapter>? chapters,
    List<WordCard>? cards,
  }) {
    return ChapterState(
      status: status ?? this.status,
      chapters: chapters ?? this.chapters,
      cards: cards ?? this.cards,
    );
  }

  @override
  String toString() {
    return '''ChapterState { status: $status, chapters: ${chapters.length} }''';
  }

  @override
  List<Object?> get props => [
        status,
        chapters,
        cards,
      ];
}
