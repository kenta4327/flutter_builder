import 'package:flutter/material.dart';
import 'package:flutter_builder/utils/decoration_builder.dart';
import 'package:flutter_builder/utils/decoration_music_note.dart';
import 'package:flutter_builder/utils/decoration_star.dart';
import 'package:flutter_builder/utils/director.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();
  String _outputText = '';
  DecorationBuilder? _decorationStar;
  DecorationBuilder? _decorationMusicNote;

  @override
  void initState() {
    super.initState();

    _decorationStar = DecorationStar();
    Director director = Director(_decorationStar!);
    director.construct();

    _decorationMusicNote = DecorationMusicNote();
    director = Director(_decorationMusicNote!);
    director.construct();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _outputSar() {
    setState(() {
      _outputText = _decorationStar!.output();
    });
  }

  void _outputMusicNote() {
    setState(() {
      _outputText = _decorationMusicNote!.output();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _outputSar,
                  child: Text('☆3出力'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _outputMusicNote,
                  child: Text('♪3出力'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              _outputText,
            ),
          ],
        ),
      ),
    );
  }
}
