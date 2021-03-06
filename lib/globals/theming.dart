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



int previousIndex = 0; //for theme toggling

ThemeModel currentModel = ThemeModel();

//---


// Define the default `TextTheme`. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.

TextTheme textTextTheme = const TextTheme(
  //for appbar
  headline1: TextStyle(fontSize: 27.0, fontWeight: FontWeight.w200),

  //secondary appbar
  headline2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w200),

  //for additional appbar things (as "done", "next")
  headline3: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),

  //for mood choice chips
  headline4: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w200),

  //for smallest emotions
  headline6: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w200),

  // for smallest emotions appbar things
  bodyText1: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400),

  //for bigger sub-emotions
  bodyText2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),

  //for the date
  subtitle1: TextStyle(
      fontWeight: FontWeight.bold, fontSize: 12, color: Colors.blueGrey),
);