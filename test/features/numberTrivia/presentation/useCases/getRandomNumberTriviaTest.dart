import 'package:clean_architecture_tdd_course/numberTrivia/domain/entities/NumberTrivia.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/domain/repositories/NumberTriviaRepository.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/domain/useCases/GetConreteNumberTrivia.dart';
import 'package:clean_architecture_tdd_course/numberTrivia/domain/useCases/GetRandomNumberTrivia.dart';
import 'package:clean_architecture_tdd_course/useCases/useCases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: "test");

  test(
    'should get trivia for the number from the repository',
        () async {
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));

      final result = await usecase(NoParams());

      expect(result, Right(tNumberTrivia));

      verify(mockNumberTriviaRepository.getRandomNumberTrivia());

      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}