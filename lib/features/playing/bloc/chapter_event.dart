import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ChapterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChapterFetched extends ChapterEvent {}

class PassCardEvent extends ChapterEvent {
  final int chapterIdx;
  final int cardId;

  PassCardEvent({
    required this.chapterIdx,
    required this.cardId,
  });

  @override
  List<Object?> get props => [
        chapterIdx,
        cardId,
      ];
}

class FailCardEvent extends ChapterEvent {
  final int chapterIdx;
  final int cardId;

  FailCardEvent({
    required this.chapterIdx,
    required this.cardId,
  });

  @override
  List<Object?> get props => [
        chapterIdx,
        cardId,
      ];
}

class FinishEvent extends ChapterEvent {
  // final int totlaCards;
  // final int totalPassCards;

  // FinishEvent({
  //   required this.totlaCards,
  //   required this.totalPassCards,
  // });

  @override
  List<Object?> get props => [
        // totlaCards,
        // totalPassCards,
      ];
}
