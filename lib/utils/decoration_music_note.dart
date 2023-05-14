import 'package:flutter_builder/utils/decoration_builder.dart';

class DecorationMusicNote implements DecorationBuilder {
  final _character = '♪';
  int? _characterNum;

  @override
  set characterNum(int characterNum) {
    _characterNum = characterNum;
  }

  @override
  String output() {
    String outputString = '';
    for (var i = 0; i < _characterNum!; i++) {
      outputString = '$outputString$_character';
    }
    return outputString;
  }
}