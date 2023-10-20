import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  AudioPlayer audioPlayer = AudioPlayer();
  AssetSource som = AssetSource("musicas/piano.mp3");
  double volume = 0.5;

  tocarMusica(){
    audioPlayer.play(som);
    audioPlayer.setVolume(volume);
  }

  @override
  Widget build(BuildContext context) {
    tocarMusica();
    return Scaffold(
      appBar: AppBar(
        title: Text("Musicas"),
      ),

    );
  }
}
