import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch/pages/clock_hand.dart';
import 'package:stopwatch/pages/clock_markers.dart';
 
import 'elapse_time_text.dart';

class StopWatchRenderer extends StatelessWidget {
  const StopWatchRenderer({
    Key? key,
    required this.elapsed,
    required this.radius,
  }) : super(key: key);
  final Duration elapsed;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarkers(
              radius: radius,
              seconds: i,
            ),
          ),
        for (var i = 5; i <=60; i += 5)
          Positioned(
            left: radius,
            top: radius,
            child: ClockTextMarker(
              value: i,
              maxValue: 60,
              radius: radius,
            ),
          ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            handLength: radius,
            handThickness: 2,
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            color: Colors.orange,
          ),
        ),
        /*  Transform(
          transform: Matrix4.identity()
            ..translate(50.0, 0.0, 0.0)
            ..rotateZ(pi / 4),
          /* transform: Matrix4.translationValues(50, 0, 0) *
              Matrix4.rotationZ(
                pi / 4,
              ), */
          alignment: Alignment.center,
          child: Container(
            color: Colors.indigo,
          ),
        ), */
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
