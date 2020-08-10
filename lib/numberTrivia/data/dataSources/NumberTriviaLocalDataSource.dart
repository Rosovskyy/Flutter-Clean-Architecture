import 'package:clean_architecture_tdd_course/numberTrivia/data/models/NumberTriviaModel.dart';

abstract class NumberTriviaLocalDataSource {

  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}