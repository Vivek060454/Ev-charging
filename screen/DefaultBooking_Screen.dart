import 'package:evdock/app/controller/transactions.controller.dart';
import 'package:evdock/app/widget/transaction_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/Upcoming_Booking.Controller.dart';
import '../widget/Upcoming_Bookings.Tile.dart';
import '../widget/booking_History.widget.dart';
import 'BookingHistory.screen.dart';
import 'MY_Bookings.screen.dart';

class MyDefaultBookingScreen extends StatefulWidget {
  static const name = "/MyDefaultBookings";
  const MyDefaultBookingScreen({Key? key}) : super(key: key);

  @override
  State<MyDefaultBookingScreen> createState() => _MyDefaultBookingScreenState();


}

class _MyDefaultBookingScreenState extends State<MyDefaultBookingScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:  const Text("My Bookings" ),
          bottom:  const TabBar(
              tabs: [
                Tab(text: 'Scheduled Bookings',),
                Tab(text: 'Booking History',),
              ]),
        ),
         body:    TabBarView(
           children: [
           MyBookingScreen(),
           MyBookingHistory(),
        ],),
      ),
    );
  }
}
