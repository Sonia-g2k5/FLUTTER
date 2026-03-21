import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text to Speech',
      home: TTSExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TTSExample extends StatefulWidget {
  @override
  _TTSExampleState createState() => _TTSExampleState();
}

class _TTSExampleState extends State<TTSExample> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textController = TextEditingController();

  Future speak() async {
    String text = textController.text;

    if (text.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  Future stop() async {
    await flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text to Speech"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: "Enter text",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: speak,
                  child: Text("Speak"),
                ),

                SizedBox(width: 20),

                ElevatedButton(
                  onPressed: stop,
                  child: Text("Stop"),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
