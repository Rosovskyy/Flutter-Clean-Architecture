import 'package:dartz/dartz.dart';

import 'package:clean_architecture_tdd_course/core/error/error/failures.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/domain/entities/NumberTrivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}