import 'package:clean_architecture_tdd_course/core/error/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/error/platform/NetworkInfo.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/data/dataSources/NumberTriviaLocalDataSource.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/data/dataSources/NumberTriviaRemoteDataSource.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/domain/entities/NumberTrivia.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/domain/repositories/NumberTriviaRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.getConcreteNumberTrivia(number));
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw null;
  }
  
}