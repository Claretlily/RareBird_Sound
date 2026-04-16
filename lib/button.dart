import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final AudioPlayer player;
  final Color color;
  final int soundNumber;
  final String text;
  final String attribution;

  const Button(
      {super.key,
      required this.color,
      required this.soundNumber,
      required this.text,
      required this.attribution,
      required this.player});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isPlaying = false;

  void toggleSound() async {
    if (isPlaying) {
      await widget.player.stop();
      setState(() => isPlaying = false);
    } else {
      await widget.player.stop(); // Stop any currently playing sound
      await widget.player.play(AssetSource('note${widget.soundNumber}.wav'));
      setState(() => isPlaying = true);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.player.onPlayerComplete.listen((_) {
      if (mounted) setState(() => isPlaying = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: widget.color,
              minimumSize: Size(double.infinity, double.infinity),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: toggleSound,
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Positioned(
            top: 4,
            left: 4,
            child: Builder(builder: (context) {
              return IconButton(
                selectedIcon: Icon(Icons.info_outline, color: Colors.white),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Credit'),
                      content: Text(widget.attribution),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.info_outline, color: Colors.white),
              );
            }),
          ),
        ],
      ),
    );
  }
}
