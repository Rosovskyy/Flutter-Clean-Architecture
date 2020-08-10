import 'dart:convert';

import 'package:clean_architecture_tdd_course/numberTrivia/data/models/NumberTriviaModel.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/domain/entities/NumberTrivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixtureReader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: "Text");

  test(
    "should be a subclass of a NumberTrivia entity",
    () async {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(fixture("trivia.json"));

        final result = NumberTriviaModel.fromJson(jsonMap);

        expect(result, tNumberTriviaModel);
      }
    );

    test(
      'should return a valid model when the JSON number is a double',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(fixture("triviaDouble.json"));

        final result = NumberTriviaModel.fromJson(jsonMap);

        expect(result, tNumberTriviaModel);
      }
    );
  });

  group('fromJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = tNumberTriviaModel.toJson();

        final expectedMapJson = {
          "number": 1,
          "text": "Text",
        };
        
        expect(result, expectedMapJson);
      }
    );
  });
}