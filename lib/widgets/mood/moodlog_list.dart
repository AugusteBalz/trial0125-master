import 'package:flutter/material.dart';
import 'package:trial0106/globals/globals.dart';

import 'package:intl/intl.dart';

class MoodLogList extends StatelessWidget {
  const MoodLogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          //map the list of transactions to the widgets
          //"for each moodlog "md" draw a widget"


          children: moodEntryList.map((entry) {
            //take off the time from the map key

            DateTime entryTime = entry.dateTime;

            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15,
                          ),
                          child: Text(
                            DateFormat("MMM d, HH:mm").format(entryTime),
                            //writes out the date
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        Column(
                          //map the list of moods to the widgets
                          //"for each moodlog "md" draw a widget"

                          children: entry.eachMood.map((md) {
                            //previous output:
                            // "SecondaryMood.angry_jealous"
                            //this leaves it just with "jealous"

                            String temp = md.moodSecondary.toString();
                            String newMoodS = temp.substring(
                                (temp.indexOf("_") + 1), temp.length);

                            //same goes with primary moods

                            String temp2 = md.moodPrimary.toString();
                            String newMoodP = temp2.substring(
                                (temp2.indexOf(".") + 1), temp2.length);


                            int subStrenght = md.strength;
                            // String something = "${md.strength}"; // string interpolation?

                            //color

                            Color myColor = md.color;

                            //displaying widgets

                            return Container(
                              margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                              ),
                              padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 10),
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //primary mood
                                    Text(newMoodP,
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: myColor,
                                        ),),

                                    //the date
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //secondary mood
                                    Text(
                                      newMoodS,
                                      style: Theme.of(context).textTheme.bodyText2,
                                    ),

                                    //its strenght
                                    Text(
                                      subStrenght.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: myColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
