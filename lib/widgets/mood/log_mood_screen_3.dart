import 'package:flutter/material.dart';
import 'package:trial0106/globals/globals.dart';
import 'package:trial0106/globals/matching_maps.dart';
import 'package:trial0106/helpers/db_helper.dart';
import 'package:trial0106/widgets/mood/display_one_slider.dart';

class LogMoodScreen3 extends StatefulWidget {
  const LogMoodScreen3({Key? key}) : super(key: key);

  @override
  State<LogMoodScreen3> createState() => _LogMoodScreen3State();
}

class _LogMoodScreen3State extends State<LogMoodScreen3> {

//  File _storedMoodEntryList;


  void _addNewMoodEntryFinal() async {

    //TODO: does not work adding items to database
  //  await DBHelper.insert('user_mood_database2.db', oneEntry.toListOfMaps());

    setState(() {
      //puts it reversed
      moodEntryList.insert(0, oneEntry);




    });
  }


  // double currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("How strong are these emotions?",
            style: Theme.of(context).textTheme.headline2),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);

                  _addNewMoodEntryFinal();



                  //TODO: make it work!!!! details: after logging a mood person should be forwarded to "history" tab

                  /*  setState(() {
                      BottomNavi().changePage(2);

                    });


                  HomePage();

                   */


                },
                child: Text(
                  "Done",
                  style: Theme.of(context).textTheme.headline3,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: Column(
              //TODO: make it stretch
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: oneEntry.eachMood.map((md) {
                //previous output:
                // "SecondaryMood.angry_jealous"
                //this leaves it just with "jealous"

                //previous output:
                // "SecondaryMood.angry_jealous"
                //this leaves it just with "jealous"


                String? temp = secondaryMoodToString[md.moodSecondary];
                String newMoodS = (temp != null) ? temp : "ERROR";



                //same goes with primary moods

                String? temp2 = primaryMoodToString[md.moodPrimary];
                String newMoodP = (temp2 != null) ? temp2 : "ERROR";

                //color

                Color myColor = md.color;

                //displaying widgets

                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //primary mood
                            Text(
                              newMoodP,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: myColor,
                                  ),
                            ),

                            //the date
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //secondary mood
                            Text(
                              newMoodS,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),

                            DisplayOneSlider(md: md),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
