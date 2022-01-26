import 'package:flutter/cupertino.dart';
import 'package:trial0106/globals/colors_of_mood.dart';
import 'package:trial0106/models/moods.dart';

class PrimaryEmotionsBlueprint {
  String emotionName;
  PrimaryMoods emotionP;
  Color color;

  PrimaryEmotionsBlueprint({
    required this.emotionName,
    required this.emotionP,
    required this.color,
  });
}

List<PrimaryEmotionsBlueprint> wholePrimaryEmotionsList = [
  PrimaryEmotionsBlueprint(
      emotionName: "Love", emotionP: PrimaryMoods.Love, color: loveMoodColor),
  PrimaryEmotionsBlueprint(
      emotionName: "Angry",
      emotionP: PrimaryMoods.Angry,
      color: angryMoodColor),
  PrimaryEmotionsBlueprint(
      emotionName: "Fear",
      emotionP: PrimaryMoods.Fearful,
      color: fearMoodColor),
  PrimaryEmotionsBlueprint(
      emotionName: "Surprise",
      emotionP: PrimaryMoods.Surprise,
      color: surpriseMoodColor),
  PrimaryEmotionsBlueprint(
      emotionName: "Joy", emotionP: PrimaryMoods.Joy, color: joyMoodColor),
  PrimaryEmotionsBlueprint(
      emotionName: "Sad", emotionP: PrimaryMoods.Sad, color: sadMoodColor),
  PrimaryEmotionsBlueprint(
      emotionName: "Other",
      emotionP: PrimaryMoods.Other,
      color: otherMoodColor),
];
