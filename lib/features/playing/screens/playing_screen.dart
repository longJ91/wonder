import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:word/features/playing/bloc/chapter_bloc.dart';
import 'package:word/features/playing/bloc/chapter_event.dart';
import 'package:word/features/playing/bloc/chapter_state.dart';
import 'package:word/features/playing/data/card_repository.dart';
import 'package:word/features/playing/data/chapter_repository.dart';

import '../../app.dart';
import '../widgets/example_card.dart';

class PlayingView extends StatelessWidget {
  const PlayingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => ChapterBloc(
          chapterRepository: ChapterRepository(),
          cardRepository: CardRepository(),
        )..add(ChapterFetched()),
        child: const Play(),
      ),
    );
  }
}

class Play extends StatefulWidget {
  const Play({super.key});

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  int cardIndex = 0;
  String totalCount = "";
  CardSwiperController cardSwiperController = CardSwiperController();

  @override
  void initState() {
    super.initState();
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Colors.grey[300],
    minimumSize: const Size(88, 100),
    padding: const EdgeInsets.symmetric(horizontal: 2),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    TapsWidgetState? tapsWidgetState =
        context.findAncestorStateOfType<TapsWidgetState>();
    double progressBarWidth = MediaQuery.of(context).size.width * 0.8;

    return BlocBuilder<ChapterBloc, ChapterState>(builder: (context, state) {
      if (state.status == ChapterStatus.empty) {
        return const SizedBox();
      } else {
        final cards = state.chapters
            .elementAt(0)
            .cardIds
            .map((wordCardId) => ExampleCard(state.cards.elementAt(wordCardId)))
            .toList();

        totalCount = "$cardIndex/${cards.length}";
        progressBarWidth /= cards.length;

        return Column(
          children: [
            Flexible(
                flex: 1,
                // fit: FlexFit.tight,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  // height: MediaQuery.of(context).size.height * 1,
                )),
            Flexible(
              child: SizedBox(
                // color: Colors.blueGrey,
                width: MediaQuery.of(context).size.width * 0.8,
                // height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 10,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xFFE0E0E0),
                          ),
                          // width: MediaQuery.of(context).size.wid
                        ),
                        Container(
                          width: progressBarWidth * cardIndex,
                          height: 10,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xFF64B5F6),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "chapter.${state.chapters.elementAt(0).id}",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            totalCount,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 14,
              fit: FlexFit.tight,
              child: CardSwiper(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                cards: cards,
                controller: cardSwiperController,
                onSwipe: (currentIndex, detectedDirection) => {
                  setState(() {
                    cardIndex++;
                    totalCount = "$cardIndex/${cards.length}";
                  }),
                  if (detectedDirection == CardSwiperDirection.right)
                    {
                      BlocProvider.of<ChapterBloc>(context).add(PassCardEvent(
                          chapterIdx: state.chapters.elementAt(0).id - 1,
                          cardId: cards[currentIndex].card.id)),
                    }
                  else if (detectedDirection == CardSwiperDirection.left)
                    {
                      BlocProvider.of<ChapterBloc>(context).add(FailCardEvent(
                          chapterIdx: state.chapters.elementAt(0).id - 1,
                          cardId: cards[currentIndex].card.id))
                    }
                },
                onEnd: () => {
                  Dialog(
                    child: SizedBox(
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const FlutterLogo(
                            size: 150,
                          ),
                          const Text(
                            "This is a Custom Dialog",
                            style: TextStyle(fontSize: 20),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Close"))
                        ],
                      ),
                    ),
                  ),
                  setState(() {
                    // ChapterStatus 변경 Event 추가
                    tapsWidgetState?.onItemTapped(0);
                  })
                },
              ),
            ),
            Flexible(
              flex: 4,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 3,
                    child: Center(
                      child: SizedBox(
                        height: 70,
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text('힌트보기')),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Center(
                      child: SizedBox(
                        height: 70,
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text('소리듣기')),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: Row(
                children: [
                  Flexible(
                    child: Center(
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: SizedBox(
                        width: 78,
                        height: 78,
                        child: FittedBox(
                            child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            cardSwiperController.swipeLeft();
                          },
                          child: const Icon(
                            Icons.close_rounded,
                            size: 40,
                            color: Color.fromARGB(255, 247, 113, 104),
                          ),
                        )),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: SizedBox(
                        width: 78,
                        height: 78,
                        child: FittedBox(
                            child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            cardSwiperController.swipeRight();
                          },
                          child: const Icon(
                            Icons.favorite,
                            size: 38,
                            color: Colors.blue,
                          ),
                        )),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {},
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    });
  }
}
