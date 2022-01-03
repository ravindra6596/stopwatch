import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch/pages/reset_buton.dart';
import 'package:stopwatch/pages/start_stop_btn.dart';
import 'package:stopwatch/pages/stopwatch_renderer.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch>
    with SingleTickerProviderStateMixin {
  Duration previouslyElapsed = Duration.zero;
  Duration currentlyElapsed = Duration.zero;
  Duration get elapsed => previouslyElapsed + currentlyElapsed;
  late final Ticker ticker;
  bool isRunning = false;
  @override
  void initState() {
    super.initState();
    ticker = createTicker((_elapsed) {
      setState(() {
        currentlyElapsed = _elapsed;
      });
    });
  }

  @override
  void dispose() {
    ticker.dispose();
    super.dispose();
  }

  toggelRunning() {
    setState(() {
      isRunning = !isRunning;
      if (isRunning) {
        ticker.start();
      } else {
        ticker.stop();
        previouslyElapsed += currentlyElapsed;
        currentlyElapsed = Duration.zero;
      }
    });
  }

  reset() {
    ticker.stop();
    setState(() {
      isRunning = false;
      previouslyElapsed = Duration.zero;
      currentlyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopWatchRenderer(
              elapsed: elapsed,
              radius: radius,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 80,
                width: 80,
                child: ResetButton(
                  onPressed: reset,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 80,
                width: 80,
                child: StartStopButton(
                  onPressed: toggelRunning,
                  isRunning: isRunning,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
