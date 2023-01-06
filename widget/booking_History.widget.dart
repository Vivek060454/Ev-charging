import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/Booking_History.data.dart';

class MyBookingHistoryTile extends StatelessWidget {
  final Bookinghistory history;
  MyBookingHistoryTile({
    Key? key,
    required this.history,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Get.theme.cardColor),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${history.custName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${history.stationName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${history.bookingDateAndTime}",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${history.requestedAmount}"
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${history.custVehicleNo}"
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
