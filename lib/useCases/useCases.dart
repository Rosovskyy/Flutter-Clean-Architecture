import 'package:dartz/dartz.dart';

import 'package:clean_architecture_tdd_course/numberTrivia/domain/entities/NumberTrivia.dart';
import 'package:clean_architecture_tdd_course/core/error/error/failures.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class Params extends Equatable {
  final int number;

  Params({this.number});
}

class NoParams extends Equatable {}
