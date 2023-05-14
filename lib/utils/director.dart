import 'package:flutter_builder/utils/decoration_builder.dart';

class Director {
  DecorationBuilder? _decorationBuilder;

  Director(DecorationBuilder decorationBuilder) {
    _decorationBuilder = decorationBuilder;
  }

  void construct() {
    _decorationBuilder?.characterNum = 3;
  }
}