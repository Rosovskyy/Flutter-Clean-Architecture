import 'package:clean_architecture_tdd_course/numberTrivia/data/models/NumberTriviaModel.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  Future<NumberTriviaModel> getRandomNumberTrivia();
}