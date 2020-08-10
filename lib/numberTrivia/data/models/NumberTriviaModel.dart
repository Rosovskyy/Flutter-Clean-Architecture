import 'package:clean_architecture_tdd_course/numberTrivia/domain/entities/NumberTrivia.dart';
import 'package:flutter/cupertino.dart';

class NumberTriviaModel extends NumberTrivia {

  NumberTriviaModel({
    @required int number,
    @required String text,
  });

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      number: (json["number"] as num).toInt(),
      text: json["text"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "number": number,
      "text": text,
    };
  }
}