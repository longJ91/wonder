import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:word/features/playing/bloc/chapter_state.dart';
import 'package:word/features/playing/data/card_repository.dart';
import 'package:word/features/playing/data/chapter_repository.dart';

import 'chapter_event.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  final ChapterRepository chapterRepository;
  final CardRepository cardRepository;

  ChapterBloc({required this.chapterRepository, required this.cardRepository})
      : super(const ChapterState()) {
    on<ChapterFetched>(_onChapterFetched);
    on<PassCardEvent>(_onPassCardEvent);
    on<FailCardEvent>(_onFailCardEvent);
    on<FinishEvent>(_onFinishEvent);
  }

  Future<void> _onChapterFetched(
      ChapterFetched event, Emitter<ChapterState> emit) async {
    try {
      if (state.status == ChapterStatus.empty) {
        final chapters = chapterRepository.getChapters();
        final cards = cardRepository.getCrads();
        return emit(state.copyWith(
          status: ChapterStatus.initial,
          chapters: chapters,
          cards: cards,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: ChapterStatus.error));
    }
  }

  Future<void> _onPassCardEvent(
      PassCardEvent event, Emitter<ChapterState> emit) async {
    state.chapters.elementAt(event.chapterIdx).passCardIds.add(event.cardId);

    try {
      emit(state.copyWith(chapters: state.chapters));
    } catch (_) {
      emit(state.copyWith(status: ChapterStatus.error));
    }
  }

  Future<void> _onFailCardEvent(
      FailCardEvent event, Emitter<ChapterState> emit) async {
    state.chapters.elementAt(event.chapterIdx).failCardIds.add(event.cardId);

    try {
      emit(state.copyWith(chapters: state.chapters));
    } catch (_) {
      emit(state.copyWith(status: ChapterStatus.error));
    }
  }

  Future<void> _onFinishEvent(
      FinishEvent event, Emitter<ChapterState> emit) async {
    return emit(state.copyWith(
      status: ChapterStatus.finish,
    ));
  }
}
