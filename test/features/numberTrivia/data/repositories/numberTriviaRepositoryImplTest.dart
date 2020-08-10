import 'package:clean_architecture_tdd_course/core/error/platform/NetworkInfo.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/data/dataSources/NumberTriviaLocalDataSource.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/data/dataSources/NumberTriviaRemoteDataSource.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/data/models/NumberTriviaModel.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/data/repositories/NumberTriviaRepositoryImpl.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/domain/entities/NumberTrivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  NumberTriviaRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;
    final tNumberTriviaModel = NumberTriviaModel(number: tNumber, text: 'test trivia');
    final NumberTrivia tNumberTrivia = tNumberTriviaModel;

    test(
      'should check if the device is online', () {

        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        repository.getConcreteNumberTrivia(tNumber);

        verify(mockNetworkInfo.isConnected);
    }
    );
  });

  group('device is online', () {
    final tNumber = 1;
    final tNumberTriviaModel = NumberTriviaModel(number: tNumber, text: 'test trivia');
    final NumberTrivia tNumberTrivia = tNumberTriviaModel;

    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
        'should return remote data when the call to remote data source is successful',
        () async {
          when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
              .thenAnswer((_) async => tNumberTriviaModel);
          // act
          final result = await repository.getConcreteNumberTrivia(tNumber);
          // assert
          verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
          expect(result, equals(Right(tNumberTrivia)));
        }
    );
  });
}