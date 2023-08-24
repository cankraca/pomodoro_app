import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/slider_provider.dart';
import '../../provider/time_provider.dart';

class TimeandRoundWidget extends StatelessWidget {
  const TimeandRoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<SliderProvider>(context);
    return Column(
      children: [
        DurationWidget(
          title: 'Study Duration',
          sliderValue: SliderProvider.studyDurationSliderValue,
          max: 60,
          min: 5,
          updateValue: (newValue) {
            sliderProvider.updateWorkDurationSliderValue(newValue);
          },
          minText: 'min',
        ),
        DurationWidget(
          title: 'Short break duration',
          sliderValue: SliderProvider.shortBreakDurationSliderValue,
          max: 30,
          min: 1,
          updateValue: (newValue) {
            sliderProvider.updateShortBreakDurationSliderValue(newValue);
          },
          minText: 'min',
        ),
        DurationWidget(
          title: 'Long break duration',
          sliderValue: SliderProvider.longBreakDurationSliderValue,
          max: 45,
          min: 1,
          updateValue: (newValue) {
            sliderProvider.updateLongBreakDurationSliderValue(newValue);
          },
          minText: 'min',
        ),
        DurationWidget(
          title: 'Rounds',
          sliderValue: SliderProvider.roundSliderValue,
          max: 15,
          min: 2,
          updateValue: (newValue) {
            sliderProvider.updateRoundSliderValue(newValue);
          },
          minText: '',
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class DurationWidget extends StatelessWidget {
  DurationWidget({
    super.key,
    required this.title,
    required this.sliderValue,
    required this.max,
    required this.min,
    required this.updateValue,
    required this.minText,
  });
  final String title;
  final double max;
  final double min;
  int sliderValue;
  String minText;
  void Function(int newValue) updateValue;

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Stack(
            children: [
              TextWithPadding(text: title),
              Slider(
                label: "$sliderValue",
                max: max,
                min: min,
                value: sliderValue.toDouble(),
                onChanged: (value) {
                  sliderValue = value.toInt();
                  updateValue(sliderValue);
                  timerProvider.resetTimer();
                },
              ),
              Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text('${min.toInt()} $minText')),
              Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text('${max.toInt()} $minText')),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class TextWithPadding extends StatelessWidget {
  const TextWithPadding({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
