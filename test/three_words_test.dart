import 'package:flutter_test/flutter_test.dart';

import 'package:three_words/three_words.dart';

void main() {
  test('all words should contain 9973 words', () {
    final words = Words();
    expect(words.all.length, 9973);
  });

  test('should return words which length is 4 or more',  () {
    final words = Words();
    var filteredWords = words.wordsLongerThan(length: 4);
    filteredWords.sort((wordA, wordB) => wordA.length.compareTo(wordB.length));
    expect(filteredWords[0].length, 4);
  });

  test('should return words with max 19 characters',  () {
    final words = Words();
    var filteredWords = words.wordsLongerThan(length: 200);
    expect(filteredWords[0].length, 19);
  });

  test('should return words with first word starting with z on descending sort',  () {
    final words = Words();
    var filteredWords = words.wordsLongerThan(length: 3, sorting: Sorting.descending);
    expect(filteredWords[0].startsWith('z'), true);
  });

  test('should return words with first word starting with a on ascending sort',  () {
    final words = Words();
    var filteredWords = words.wordsLongerThan(length: 3, sorting: Sorting.ascending);
    expect(filteredWords[0].startsWith('a'), true);
  });

  test('should return words with first word starting with a on default sort',  () {
    final words = Words();
    var filteredWords = words.wordsLongerThan(length: 3);
    expect(filteredWords[0].startsWith('a'), true);
  });

  test('should return three random words', () {
    final words = Words();
    var filteredWords = words.randomWords(number: 3);
    expect(filteredWords.length, 3);
  });

  test('should return twelve random words', () {
    final words = Words();
    var filteredWords = words.randomWords();
    expect(filteredWords.length, 12);
  });
}
