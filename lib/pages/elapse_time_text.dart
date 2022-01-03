import 'package:flutter/material.dart';

class ElapsedTimeText extends StatelessWidget {
  const ElapsedTimeText({
    Key? key,
    required this.elapsed,
  }) : super(key: key);
  final Duration elapsed;
  @override
  Widget build(BuildContext context) {
    final hundreds = (elapsed.inMilliseconds / 10) % 100;
    final minutes = elapsed.inMinutes % 60;
    final seconds = elapsed.inSeconds % 60;
    final hundredStr = hundreds.toStringAsFixed(0).padLeft(2, '0');
    final minutsStr = minutes.toString().padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');
    const width = 12.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeDigit(text: minutsStr.substring(0, 1), width: width),
        TimeDigit(text: minutsStr.substring(1, 2), width: width),
        const TimeDigit(text: ':', width: 6),
        TimeDigit(text: secondsStr.substring(0, 1), width: width),
        TimeDigit(text: secondsStr.substring(1, 2), width: width),
        const TimeDigit(text: '.', width: 6),
        TimeDigit(text: hundredStr.substring(0, 1), width: width),
        TimeDigit(text: hundredStr.substring(1, 2), width: width),
      ],
    );
  }
}

class TimeDigit extends StatelessWidget {
  const TimeDigit({
    Key? key,
    required this.text,
    required this.width,
  }) : super(key: key);
  final String text;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
