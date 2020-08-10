import 'package:clean_architecture_tdd_course/numberTrivia/domain/entities/NumberTrivia.dart';
import 'package:clean_architecture_tdd_course/core/error/error/failures.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/domain/repositories/NumberTriviaRepository.dart';
import 'package:clean_architecture_tdd_course/useCases/useCases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams noParams) async {
    return await repository.getRandomNumberTrivia();
  }
}
