import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child: DingDongApp(),
      ),
    ),
  ));
}

class DingDongApp extends StatefulWidget {
  const DingDongApp({super.key});

  @override
  State<DingDongApp> createState() => _DingDongAppState();
}

class _DingDongAppState extends State<DingDongApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        noteWidget(Colors.red, 1),
        noteWidget(Colors.orange, 2),
        noteWidget(Colors.yellow, 3),
        noteWidget(Colors.green, 4),
        noteWidget(Colors.teal, 5),
        noteWidget(Colors.blue, 6),
        noteWidget(Colors.purple, 7),
      ],
    );
  }

  void playMusic(int noteNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('assets_note$noteNumber.wav'));
  }

  Expanded noteWidget(Color color, int number) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            enableFeedback: false,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ))),
        onPressed: () {
          playMusic(number);
        },
        child: SizedBox(),
      ),
    );
  }
}
