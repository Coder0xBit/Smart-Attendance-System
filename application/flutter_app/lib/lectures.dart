import 'package:flutter/material.dart';

enum LectureStatus { none, upComing, onGoing, cancelled, finished }

class Lecture {
  String? name;
  String? startTime;
  String? endTime;
  LectureStatus lectureStatus = LectureStatus.none;

  Lecture(
      {this.name, this.endTime, this.startTime, required this.lectureStatus});
}

class Lectures extends StatefulWidget {
  const Lectures({super.key});

  @override
  State<Lectures> createState() => LecturesState();
}

class LecturesState extends State<Lectures> {
  List<Lecture> lectureList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    lectureList.add(Lecture(
        name: "AI/ML",
        startTime: "09:00 AM",
        endTime: "11:00 AM",
        lectureStatus: LectureStatus.upComing));
    lectureList.add(Lecture(
        name: "PYTHON",
        startTime: "11:10 AM",
        endTime: "01:10 PM",
        lectureStatus: LectureStatus.upComing));
    lectureList.add(Lecture(
        name: "CAC",
        startTime: "01:30 PM",
        endTime: "3:30 PM",
        lectureStatus: LectureStatus.upComing));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      scrollDirection: Axis.vertical,
      itemCount: lectureList.length,
      itemBuilder: (BuildContext context, int index) {
        return lectureCard(
            context,
            lectureList[index].name ?? "",
            lectureList[index].startTime ?? "",
            lectureList[index].endTime ?? "");
      },
    );
  }

  Widget lectureCard(
      BuildContext context, name, String startTime, String endTime) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(fontSize: 30),
                ),
                Chip(
                  label: const Text("Upcoming"),
                  side: BorderSide.none,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                )
              ],
            ),
            const SizedBox(height: 10),
            Text("StartTime : $startTime"),
            const SizedBox(height: 5),
            Text("Endtime : $endTime"),
          ],
        ),
      ),
    );
  }
}
