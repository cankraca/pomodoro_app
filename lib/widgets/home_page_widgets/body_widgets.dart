import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/time_provider.dart';

class TimeIndicatorWidget extends StatelessWidget {
  const TimeIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    double progress = 1 -
        timerProvider.currentTimeInSeconds / (timerProvider.maxTimeInSeconds);

    return CircularProgressIndicator(
      strokeWidth: 20.0,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
      backgroundColor: Colors.green,
      value: progress,
    );
  }
}

class StudyBreakWidget extends StatelessWidget {
  const StudyBreakWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeWidget(),
        SizedBox(height: 10.0),
        TimeModeWidget(),
      ],
    );
  }
}

class TimeModeWidget extends StatelessWidget {
  const TimeModeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Text(
      timerProvider.isBreakTime ? 'RELAX' : 'STUDY',
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Text(
      timerProvider.currentTimeDisplay,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class MediaButtons extends StatelessWidget {
  const MediaButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: timerProvider.isEqual ? null : timerProvider.resetTimer,
          icon: const Icon(Icons.replay, size: 30.0),
        ),
        IconButton(
          onPressed: () {
            timerProvider.toggleTimer();
          },
          icon: Icon(
            timerProvider.isRunning ? Icons.pause : Icons.play_arrow,
            size: 45.0,
          ),
        ),
        IconButton(
          onPressed: () {
            timerProvider.jumpNextRound();
          },
          icon: const Icon(Icons.fast_forward, size: 30.0),
        ),
      ],
    );
  }
}

class RoundsWidget extends StatelessWidget {
  const RoundsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Text(
      timerProvider.currentRoundDisplay,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
