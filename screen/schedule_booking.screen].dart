import 'package:flutter/material.dart';

class ScheduleBooking extends StatelessWidget {
  static const name = "/schedule_booking";
  const ScheduleBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScheduleBooking"),
        elevation: 1,
      ),
    );
  }
}
