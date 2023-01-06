import 'package:evdock/app/controller/BookingHistory.Controller.dart';
import 'package:evdock/app/controller/transactions.controller.dart';
import 'package:evdock/app/widget/transaction_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/Upcoming_Booking.Controller.dart';
import '../widget/Upcoming_Bookings.Tile.dart';
import '../widget/booking_History.widget.dart';

class MyBookingHistory extends StatefulWidget {
  static const name = "/MyBookings";
  const MyBookingHistory({Key? key}) : super(key: key);

  @override
  State<MyBookingHistory> createState() => _MyBookingScreenState();

}

class _MyBookingScreenState extends State<MyBookingHistory> with SingleTickerProviderStateMixin{
/*  late TabController Controller;

  @override
  void onInit() {
    super.initState();
   Controller = TabController(length: 2, vsync: this);
   Controller.addListener(() {
     setState((){
     });
   });
  }
  @override
  void onDispose() {
    Controller.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return GetX<BookingHistoryController>(
      init: BookingHistoryController(),
      builder: (_) {
        return Scaffold(
              body: Column(
                    children: [
                      if (_.loading)
                        const Expanded(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ))
                      else if (!_.loading && _.history.isEmpty)
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("No Bookings History"),
                                TextButton(
                                  onPressed: _.getbookingHistory,
                                  child: const Text("Try again"),
                                )
                              ],
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: ListView.builder(
                            itemCount: _.history.length,
                            itemBuilder: (BuildContext context, int index) {
                              final hh = _.history[index];
                              return MyBookingHistoryTile(
                                history: hh,
                              );
                            },
                          ),
                        ),
                    ],
              ),
            );
      },
    );
  }
}
