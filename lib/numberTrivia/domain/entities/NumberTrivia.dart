import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class NumberTrivia extends Equatable {
  final String text;
  final int number;

  NumberTrivia({
    this.text,
    this.number
  });
}