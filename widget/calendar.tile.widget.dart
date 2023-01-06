/*
import 'package:evdock/app/common/enum.dart';
import 'package:evdock/app/common/utils.common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:riverpod/riverpod.dart';

import '../model/charging_points.model.dart';
import '../screen/dashboard/tab/account.tab.dart';

class MyCalendar extends StatelessWidget {
  final ChargingPointModel point;
  final  VoidCallback? SelectedTime;
   const MyCalendar({Key? key, this.SelectedTime, required this.point}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isOpen = SelectedTime == ScheduleBookingStatus.open;
    CalendarFormat format = CalendarFormat.month;
    DateTime selectedDay = DateTime.now();
    DateTime focusedDay = DateTime.now();
    AccountTab accounttab = AccountTab();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule A Booking"),
        elevation: 10,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: TIME_SLOT.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: isOpen ? (){
                    SelectedTime != isOpen ?"Busy" : "Open";
                  }:null,
                  child: Card(
                    color: isOpen ?
                        Colors.white54 :Colors.white,
                    child: GridTile(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${TIME_SLOT.elementAt(index)}'),
                             const Text('Available'),
                          ],
                        ),
                      header: Center(
                        child: Padding(
                          padding: const EdgeInsets.all( 10.0),
                          child: Text(isOpen == null ? "Busy" : "Open",
                            style:const TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )
                    ),
                      ),
                  ),
                    */
/* child: Center(
                      child: SizedBox(
                        height: 30,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                            ),
                            onPressed: SelectedTime,
                            child: Text(SelectedTime == null ? "Close" : "Open")),
                      ),
                    )*//*

                  ),

        ],
      ),
    );
  }
}
*/
