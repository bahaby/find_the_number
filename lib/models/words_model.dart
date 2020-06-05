import 'package:find_the_number/data/words_data.dart';

class WordsModel {
  static const alphabet = "abcçdefgğhiıjklmnoöprsştuüvyz";
  List<int> randomLetters;
  List<Map> bestResults;
  WordsModel(){
    refresh();
  }
  void refresh() {
    randomLetters = generatedRandomLetters;
    findBestWord();
  }
  List<int> get generatedRandomLetters {
    List<int> letters = [];
    List<int> randomAlphabet = alphabet.runes.toList();
    for (var i = 0; i < 8; i++) {
      randomAlphabet.shuffle();
      letters.add(randomAlphabet.first);
    }
    return letters;
  }

  void findBestWord() {
    List<Map> results = [];
    List<Map> bestResults = [];
    int bestResultLength = 0;
    WordsData.words.forEach((word) {
      Map liste = match(word, randomLetters);
      if (liste != null) {
        if (bestResultLength < liste['word'].length) {
          bestResultLength = liste['word'].length;
        }
        results.add(liste);
      }
    });
    results.forEach((result) {
      if (result['word'].length == bestResultLength && result['joker'] == "-") {
        bestResults.add(result);
      }
    });
    if (bestResults.isEmpty) {
      results.forEach((result) {
        if (result['word'].length == bestResultLength) {
          bestResults.add(result);
        }
      });
    }
    this.bestResults = bestResults;
  }

  Map match(String word, List letters) {
    List check = word.runes.toList();
    letters.forEach((letter) {
      if (check.contains(letter)) {
        check.remove(letter);
      }
    });
    if (check.length <= 1) {
      return {
        "word": word,
        "joker": (check.isEmpty) ? "-" : String.fromCharCode(check[0]),
      };
    } else
      return null;
  }

  int get score{
    switch (bestResults.first['word'].length) {
      case 3: return 3;
      case 4: return 4;
      case 5: return 5;
      case 6: return 7;
      case 7: return 9;
      case 8: return 11;
      case 9: return 15;
      default: return 0;
    }
  }
}