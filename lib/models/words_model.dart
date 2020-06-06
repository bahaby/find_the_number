import 'package:find_the_number/data/words_data.dart';

class WordsModel {
  static const alphabet = "abcçdefgğhiıjklmnoöprsştuüvyz";
  List<int> randomLetters; //rastgele oluşturulan harflerin ascii değerlerinin tutulduğu dizi
  List<Map> bestResults; //bulunan kelimelerin tutulduğu dizi
  WordsModel(){
    refresh();
  }
  void refresh() { //random harfleri değiştirip yeniden arama yapmak için
    randomLetters = generatedRandomLetters;
    findBestWords();
  }
  List<int> get generatedRandomLetters { // random harfleri üretmek için
    List<int> letters = [];
    List<int> randomAlphabet = alphabet.runes.toList();
    for (var i = 0; i < 8; i++) {
      randomAlphabet.shuffle();
      letters.add(randomAlphabet.first);
    }
    return letters;
  }

  void findBestWords() { //kelime listesinden bizdeki harflere göreme arama yapmak için
    List<Map> results = []; //3 harf ile 9 harf arasında bulunan bütün sonuçların tutulduğu dizi
    List<Map> bestResults = []; // en uzun ve mümkünse jokersiz olan kelimelerin tutulduğu dizi
    int bestResultLength = 0; //en uzun kelimenin uzunlupunu tutmak için
    WordsData.words.forEach((word) {
      Map liste = match(word, randomLetters); //eşleşme varsa geçici liste Map'ına atama yapılır.
      if (liste != null) {
        if (bestResultLength < liste['word'].length) {
          bestResultLength = liste['word'].length; //en uzun kelimenin uzunluğunu kaydetmek için
        }
        results.add(liste); //result dizisine ekleme yapılır.
      }
    });
    results.forEach((result) {//en uzun kelimeler arasından jokersiz var mı diye bakılır
      if (result['word'].length == bestResultLength && result['joker'] == "-") {
        bestResults.add(result);
      }
    });
    if (bestResults.isEmpty) {//jokersiz kelime bulunamazsa jokerli olanlar bestResult dizisine eklenir.
      results.forEach((result) {
        if (result['word'].length == bestResultLength) {
          bestResults.add(result);
        }
      });
    }
    this.bestResults = bestResults;
  }

  Map match(String word, List letters) { //kelime ile elimizdeki harflerin eşleşmesinin kontrol edildiği fonksiyon
    List check = word.runes.toList(); // kelime harflerine ayrılır ve geçici diziye kaydedilir.
    letters.forEach((letter) { 
      if (check.contains(letter)) { //kelimenin harflerinde elimizdeki harfler varmı diye bakılır.
        check.remove(letter); // eğer var ise geçici kelime dizisinden bulunan harf çıkartılır.
      }
    });
    if (check.length <= 1) { //kelimede 1 veya 0 harf kaldıysa devam edilir
      return {
        "word": word, //kelime 
        "joker": (check.isEmpty) ? "-" : String.fromCharCode(check[0]), // 1 harf kaldıysa joker olarak döndürülür
      };
    } else //kelimede 1 den fazla harf kaldıysa bu kelime aradığımız koşulu saplamaz null döndürülür
      return null;
  }

  int get score{//bulunan sonuca göre puan hesaplanır.
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