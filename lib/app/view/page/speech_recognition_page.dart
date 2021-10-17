import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voice_rec/app/providers/speech_recognition_provider.dart';

class SpeechScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SpeechRecognitionProvider provider = Provider.of<SpeechRecognitionProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Correctness: ${(provider.confidence * 100.0).toStringAsFixed(1)}%')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
          animate: provider.isListening,
          glowColor: Theme.of(context).primaryColor,
          endRadius: 75.0,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(onPressed: provider.listen, child: Icon(provider.returnCorrectIcon()))),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: Text(provider.text, style: const TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
