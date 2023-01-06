// S-Cube files
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/utils.common.dart';
import '../controller/Upcoming_Booking.Controller.dart';
import '../controller/add_vehicle.controller.dart';

class MyBookingTile  extends StatelessWidget {
  final MyUpcomingBookingController uc;
  final VoidCallback? onOpenTap;
  final VoidCallback? onChargeTap;
  bool buttonenabled = false;
  final /*upcomingBookings */Bookings;
  MyBookingTile ({Key? key, this.Bookings, this.onOpenTap, required this.uc, this.onChargeTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            width: size.width * 0.99,
            height: size.height * 0.20,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Get.theme.cardColor),
            child: Stack(

              children: [
                Positioned(
                  top: 5,
                  left: 20,
                  child: Row(
                    children: [
                      Text(
                        "${Bookings.custName}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Text(
                      "${Bookings.stationName}",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Text(
                      "${Bookings.connectorName}",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 48,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Text(
                      "${Bookings.bookingDateAndTime}",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 65,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Text(
                      "${Bookings.requestedAmount}",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 10,
                  top: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:   Text(
                      "${Bookings.bookingStatus}",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 100,
                  child:  ElevatedButton(
                   /* style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),*/
                    onPressed: onOpenTap,
                 //     Bookings.cancelNow == "Y" ? true : false
                    child: Text(onOpenTap == null ? "Not Available" : "CancelBooking")),

                  /*ElevatedButton(
                    onPressed: () async {
                     *//* if(buttonenabled == "${Bookings.cancelNow}"){
                        showToast("Booking Cannot be Cancelled");}
                      else{*//*
                        ("${uc.cancelupcomingbookingApi(Bookings!.bookingId)}");
                     *//* }*//*
                      },
                    child: Text("Cancel Now:- " + "${Bookings.cancelNow}",),),*/
                ),

                Positioned(
                  right: 5,
                  top: 100,
                  child: ElevatedButton(
                      onPressed: onChargeTap,
                      //     Bookings.cancelNow == "Y" ? true : false
                      child: Text(onChargeTap == null ? "Not Available" : "Charge Now")),
                  /*ElevatedButton(onPressed: () {
                    ("${uc.chargenowupcomingBookingApi(Bookings!.bookingId)}");},
                      child: Text("Charge Now:- " + "${Bookings.chargeNow}",)
                  ),*/
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
