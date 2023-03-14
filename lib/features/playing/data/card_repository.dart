import '../models/word_card.dart';

class CardRepository {
  CardRepository();

  List<WordCard> getCrads() {
    final List<WordCard> cards = <WordCard>[
      WordCard(
        id: 1,
        word: "accommodate",
        description: "The hotel can accommodate up to 500 guests at a time.",
        voiceId: 1,
      ),
      WordCard(
        id: 2,
        word: "advance",
        description:
            "The company made significant advances in artificial intelligence technology.",
        voiceId: 2,
      ),
      WordCard(
        id: 3,
        word: "beach",
        description: "I enjoy spending time watching the sunset on the beach.",
        voiceId: 3,
      ),
      WordCard(
        id: 4,
        word: "bread",
        description: "I love the smell of fresh bread baking.",
        voiceId: 4,
      ),
      WordCard(
        id: 5,
        word: "choose",
        description: "It's difficult to choose which movie to watch.",
        voiceId: 5,
      ),
      WordCard(
        id: 6,
        word: "compose",
        description: "She enjoys composing music in her free time.",
        voiceId: 6,
      ),
      WordCard(
        id: 7,
        word: "consensus",
        description:
            "The group was able to reach a consensus on the best course of action.",
        voiceId: 7,
      ),
      WordCard(
        id: 8,
        word: "finger",
        description: "He accidentally cut his finger with a knife.",
        voiceId: 8,
      ),
      WordCard(
        id: 9,
        word: "illustrate",
        description: "Can you illustrate your point with an example?",
        voiceId: 9,
      ),
    ];
    return cards;
  }
}
