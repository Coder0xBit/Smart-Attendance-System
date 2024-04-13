import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[currentLectureCard()]),
    );
  }

  Widget currentLectureCard() {
    return const SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Ongoing Lecture",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Python",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Class : A2",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Start Time : 09:00 AM",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "End Time : 11:00 AM",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
