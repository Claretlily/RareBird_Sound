import 'package:audioplayers/audioplayers.dart';

import 'button.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(XylophoneApp());
}

final AudioPlayer sharedPlayer = AudioPlayer();

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.music_note,
                color: Colors.white,
              ),
              Text(
                '7 Most Unusual Bird Sounds',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PermanentMarker',
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.music_note,
                color: Colors.white,
              ),
            ],
          ),
          backgroundColor: Colors.grey.shade900,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Button(
                color: Colors.red,
                soundNumber: 1,
                text: 'White Bird(Procnias albus)',
                attribution:
                    'Recording of White Bellbird (Procnias albus) by Ricardo Gagliardi from Xeno-canto from Xeno-canto is licensed under CC BY-NC-SA 4.0.',
                player: sharedPlayer,
              ),
              Button(
                color: Colors.orange.shade600,
                soundNumber: 2,
                text: 'Superb Lyrebird(Menura novaehollandiae)',
                attribution:
                    'Recording of Superb Lyrebird (Menura novaehollandiae) by Andrew McCafferty from Xeno-canto is licensed under CC BY-NC-SA 4.0.',
                player: sharedPlayer,
              ),
              Button(
                color: Colors.yellow.shade700,
                soundNumber: 3,
                text: 'Capuchinbird (Perissocephalus tricolor)',
                attribution:
                    'Recording of Capuchinbird (Perissocephalus tricolor) by GABRIEL LEITE from Xeno-canto is licensed under CC BY-NC-SA 4.0.',
                player: sharedPlayer,
              ),
              Button(
                color: Colors.green,
                soundNumber: 4,
                text: 'Great Potoo (Nyctibius grandis)',
                attribution:
                    'Recording of Great Potoo (Nyctibius grandis) by Bruce Lagerquist from Xeno-canto is licensed under CC BY-NC-SA 4.0.',
                player: sharedPlayer,
              ),
              Button(
                color: Colors.teal,
                soundNumber: 5,
                text: 'Southern Cassowary (Casuarius casuarius)',
                attribution:
                    'Recording of Southern Cassowary (Casuarius casuarius) by Phil Gregory from Xeno-canto is licensed under CC BY-NC-SA 3.0.',
                player: sharedPlayer,
              ),
              Button(
                color: Colors.blue,
                soundNumber: 6,
                text: 'Black Sicklebill (Epimachus fastosus)',
                attribution:
                    'Recording of Black Sicklebill (Epimachus fastosus) by Oscar Campbell from Xeno-canto is licensed under CC BY-NC-SA 4.0.',
                player: sharedPlayer,
              ),
              Button(
                color: Colors.purple,
                soundNumber: 7,
                text: 'Stresemann\'s Bristlefront (Merulaxis stresemanni)',
                attribution:
                    'Recording of Stresemann\'s Bristlefront (Merulaxis stresemanni) by Jon King from Xeno-canto is licensed under CC BY-NC-SA 3.0.',
                player: sharedPlayer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
