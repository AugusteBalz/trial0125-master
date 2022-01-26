import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trial0106/globals/globals.dart';
import 'package:trial0106/models/mood_entries.dart';
import 'package:trial0106/models/moods.dart';
import 'package:trial0106/models/one_mood.dart';

/// Icons by svgrepo.com (https://www.svgrepo.com/collection/job-and-professions-3/)

Map<PrimaryMoods, double> countingPrimaryOccurencesDefault = {};
Map<PrimaryMoods, double> countingPrimaryOccurences = {};

int wholeMonthsCount = 0;

class PieChartSample3 extends StatefulWidget {
  const PieChartSample3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
                pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                }),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: showingSections()),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    calculateMonthlyStats();

    return List.generate(countingPrimaryOccurences.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      double value = countingPrimaryOccurences.values.elementAt(i);

      //show right percentage
      String name = (value / wholeMonthsCount * 100).round().toString();

      Color? coloredBy =
          primaryColors[countingPrimaryOccurences.keys.elementAt(i)];

      Color coloredBy2 = (coloredBy != null) ? coloredBy : Colors.grey;

      return PieChartSectionData(
        color: coloredBy2,
        value: value,
        title: name + '%',
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff)),
        badgeWidget: _Badge(
          '4',
          size: widgetSize,
          borderColor: coloredBy2,
        ),
        badgePositionPercentageOffset: .98,
      );
    });
  }
}

class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Color borderColor;

  const _Badge(
    this.svgAsset, {
    Key? key,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Text(
          svgAsset,
          //fit: BoxFit.contain,
        ),
      ),
    );
  }
}

void calculateMonthlyStats() {
  List<MoodEntry> thisMonthsEntries = [];
  int thisMonthNumber = DateTime.now().month;

  //we select only moods that were added this month

  for (MoodEntry entry in moodEntryList) {
    if (thisMonthNumber == entry.dateTime.month) {
      thisMonthsEntries.add(entry);
    }
  }

  //we clean anything that was here before
  countingPrimaryOccurences.clear();
  wholeMonthsCount = 0;

  //make a list in order by color

  primaryColors.forEach((key, value) {
    countingPrimaryOccurences.putIfAbsent(key, () => 0);
  });

  for (MoodEntry entry in thisMonthsEntries) {
    for (OneMood mood in entry.eachMood) {
      if (countingPrimaryOccurences.containsKey(mood.moodPrimary)) {
        double? k = countingPrimaryOccurences[mood.moodPrimary];
        if (k == null) {
          //if its null we add a new count
          k = 1;
        } else {
          //if its not null we increase the count by one
          k = k + 1;
        }

        //we add a new count
        countingPrimaryOccurences[mood.moodPrimary] = k;
      } else {
        //if its empty we add 1
        countingPrimaryOccurences.putIfAbsent(mood.moodPrimary, () => 1);
      }

      wholeMonthsCount = wholeMonthsCount + 1;
    }
  }
}
