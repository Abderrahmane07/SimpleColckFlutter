import 'package:flutter/material.dart';
import 'package:new_clock/ui/style.dart';
import 'package:new_clock/utils/time_model.dart';
import 'package:new_clock/widgets/clock_widget.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
            var currentTime = DateTime.now();
            String seconds = currentTime.second < 10
                ? "0${currentTime.second}"
                : "${currentTime.second}";
            String minutes = currentTime.minute < 10
                ? "0${currentTime.minute}"
                : "${currentTime.minute}";
            String hours = currentTime.hour < 10
                ? "0${currentTime.hour}"
                : "${currentTime.hour}";
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today",
                      style: AppStyle.mainTextThin,
                    ),
                    Text("$hours:$minutes:$seconds", style: AppStyle.mainText),
                  ],
                ),
                Center(
                    child: ClockWidget(TimeModel(currentTime.hour,
                        currentTime.minute, currentTime.second))),
              ],
            );
          }),
          const SizedBox(
            height: 60,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select another time zone",
                style: TextStyle(fontSize: 18),
              ),
              Divider(
                color: Colors.black45,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 52,
                  height: 100,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: AppStyle.primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tangier",
                            style: AppStyle.mainTextWhite,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
