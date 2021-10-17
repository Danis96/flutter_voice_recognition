import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechRecognitionProvider extends ChangeNotifier {
  SpeechRecognitionProvider() {
    _speech = stt.SpeechToText();
  }

  stt.SpeechToText? _speech;
  bool isListening = false;
  String text = 'Press the button and start speaking';
  double confidence = 1.0;

  void listen() async {
    if (!isListening) {
      bool available = await _speech!.initialize(onStatus: (val) => print('onStatus: $val'), onError: (val) => print('onError: $val'));
      if (available) {
        isListening = true;
        _speech!.listen(
          onResult: (val) {
            text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              confidence = val.confidence;
            }
            notifyListeners();
          },
        );
      }
      notifyListeners();
    } else {
      isListening = false;
      notifyListeners();
      _speech!.stop();
    }
  }

  IconData returnCorrectIcon() {
    return isListening ? Icons.mic_none : Icons.mic_off;
  }

}
