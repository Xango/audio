import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as JA;
import 'package:audioplayers/audioplayers.dart' as AP;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String prefix = "assets/audio/";
  final String audioPath = "assets/audio/inthedark.mp3";
  final JA.AudioPlayer player = JA.AudioPlayer();

  /// Callback with Just Audio Package
  void _justAudio() async {
    await player.setAsset(audioPath);
    player.play();
  }

  void _audioPlayers() {
    // https://github.com/bluefireteam/audioplayers/blob/master/packages/audioplayers/doc/audio_cache.md
    final String audio = "inthedark.mp3";
    AP.AudioCache player = AP.AudioCache(prefix: prefix);
    player.play(audio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              // Uncomment to produce error
              _justAudio();

              //Comment aus when using _justAudio
              // _audioPlayers();
            },
            child: Text("Play"),
          ),
        ),
      ),
    );
  }
}
