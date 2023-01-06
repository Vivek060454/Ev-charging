import 'package:evdock/app/controller/transactions.controller.dart';
import 'package:evdock/app/widget/transaction_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/Upcoming_Booking.Controller.dart';
import '../controller/booking.controller.dart';
import '../model/charging_points.model.dart';
import '../widget/Upcoming_Bookings.Tile.dart';
import '../widget/booking_History.widget.dart';
import 'BookingHistory.screen.dart';

class Showdates extends StatefulWidget {
  static const name = "/showDates";
  //final ChargingPointModel point;
  const Showdates({Key? key}) : super(key: key);
  @override
  State<Showdates> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<Showdates> with SingleTickerProviderStateMixin{
  late final ChargingPointModel point;
  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      init: BookingController(point),
      builder: (_) {
        return Scaffold(
          body: Column(
            children: [
              if (_.loading)
                const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ))
              else if (!_.loading && _.Date.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("No Date found"),
                        TextButton(
                          onPressed: _.getslotDateApi(),
                          child: const Text("Try again"),
                        )
                      ],
                    ),
                  ),
                ),
              /* Row(
                    children: [
                      if (_.loading)
                        const Expanded(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ))
                      else if (!_.loading && _.bookings.isEmpty)
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
                              final booking = _.history[index];
                              return MyBookingHistoryTile(
                                history: booking,
                                */
              /*onReceipt: () async {
                              if (transaction.cancelNow != null) {
                                _.downloadAndOpenFile(transaction.cancelNow!);
                              }
                            },*/
              /*
                              );
                            },
                          ),
                        ),
                      const Expanded(
                          child: Center(
                              child:
                              MyBookingHistory())),
                    ],
                  ),*/
            ],
          ),
        );
      },
    );
  }
}
