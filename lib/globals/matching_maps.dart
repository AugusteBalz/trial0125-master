library mood_as_classes.globals;

import 'package:flutter/material.dart';
import 'package:trial0106/globals/colors_of_mood.dart';
import 'package:trial0106/main.dart';
import 'package:trial0106/models/blueprint_mood.dart';
import 'package:trial0106/models/mood_entries.dart';
import 'package:trial0106/models/mood_select.dart';
import 'package:trial0106/models/moods.dart';
import 'package:trial0106/models/one_mood.dart';
import 'package:trial0106/globals/constants_of_mood.dart';


Map<PrimaryMoods, Color> primaryColors = {

  PrimaryMoods.Love: loveMoodColor,
  PrimaryMoods.Angry: angryMoodColor,
  PrimaryMoods.Fearful: fearMoodColor,
  PrimaryMoods.Surprise: surpriseMoodColor,
  PrimaryMoods.Joy: joyMoodColor,
  PrimaryMoods.Sad: sadMoodColor,
  PrimaryMoods.Other: otherMoodColor,
};


Map<PrimaryMoods, String> primaryMoodToString = {

  PrimaryMoods.Love: "Love",
  PrimaryMoods.Angry: "Angry",
  PrimaryMoods.Fearful: "Fear",
  PrimaryMoods.Surprise: "Surprise",
  PrimaryMoods.Joy: "Joy",
  PrimaryMoods.Sad: "Sad",
  PrimaryMoods.Other: "Other",
};