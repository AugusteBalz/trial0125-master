import 'package:flutter/cupertino.dart';
import 'package:trial0106/globals/colors_of_mood.dart';
import 'package:trial0106/models/moods.dart';

class PrimaryEmotionsBlueprint {
  String emotionName;
  PrimaryMoods emotionP;
  Color color;
  int id;

  PrimaryEmotionsBlueprint({
    required this.emotionName,
    required this.emotionP,
    required this.color,
    required this.id,
  });
}

List<PrimaryEmotionsBlueprint> wholePrimaryEmotionsList = [
  PrimaryEmotionsBlueprint(
    emotionName: "Love",
    emotionP: PrimaryMoods.Love,
    color: loveMoodColor,
    id: 0,
  ),
  PrimaryEmotionsBlueprint(
    emotionName: "Angry",
    emotionP: PrimaryMoods.Angry,
    color: angryMoodColor,
    id: 1,
  ),
  PrimaryEmotionsBlueprint(
    emotionName: "Fear",
    emotionP: PrimaryMoods.Fearful,
    color: fearMoodColor,
    id: 2,
  ),
  PrimaryEmotionsBlueprint(
    emotionName: "Surprise",
    emotionP: PrimaryMoods.Surprise,
    color: surpriseMoodColor,
    id: 3,
  ),
  PrimaryEmotionsBlueprint(
    emotionName: "Joy",
    emotionP: PrimaryMoods.Joy,
    color: joyMoodColor,
    id: 4,
  ),
  PrimaryEmotionsBlueprint(
    emotionName: "Sad",
    emotionP: PrimaryMoods.Sad,
    color: sadMoodColor,
    id: 5,
  ),
  PrimaryEmotionsBlueprint(
    emotionName: "Other",
    emotionP: PrimaryMoods.Other,
    color: otherMoodColor,
    id: 6,
  ),
];
