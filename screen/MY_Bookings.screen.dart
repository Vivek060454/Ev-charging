import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../controller/Upcoming_Booking.Controller.dart';
import '../data/MyBookings_Upcoming.data.dart';
import '../widget/Upcoming_Bookings.Tile.dart';

class MyBookingScreen  extends StatelessWidget {
  static const name = "/MyBookings";
  final upcomingBookings? value;
  const MyBookingScreen ({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MyUpcomingBookingController>(
      init: MyUpcomingBookingController(),
      builder: (_) {
        return Scaffold(
          body: Column(
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
                        const Text("No Bookings found"),
                        TextButton(
                          onPressed: _.getBookings,
                          child: const Text("Try again"),
                        )
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: _.bookings.length,
                    itemBuilder: (BuildContext context, int index) {
                      final booking = _.bookings[index];
                      print(booking);
                      print(booking.cancelNow);
                      print(value?.cancelNow);
                      final isOpenCancelNow = booking.cancelNow == "Y" ? true:false;
                      final isOpenChargeNow = booking.chargeNow == "Y" ? true:false;
                      print(isOpenCancelNow);
                      return MyBookingTile(
                        Bookings: booking,
                        uc: _,
                        onChargeTap: isOpenChargeNow ? (){
                          ("${_.chargenowupcomingBookingApi("${booking.bookingId}")}");

                        }:null,
                        onOpenTap: isOpenCancelNow ? (){
                          ("${_.cancelupcomingbookingApi("${booking.bookingId}")}");
                        }: null,
                      );
                    },
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
                            },*//*
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