/*
import 'package:evdock/app/controller/transactions.controller.dart';
import 'package:evdock/app/model/slot_booking.model.dart';
import 'package:evdock/app/widget/transaction_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../common/enum.dart';
import '../common/utils.common.dart';
import '../controller/slot_controller.dart';
import '../data/slot_date.data.dart';
import '../model/charging_points.model.dart';
import 'dashboard/tab/account.tab.dart';

class ExampleSlotsScreen extends StatelessWidget {
  static const name = "/exampleslot";
  final ChargingPointModel point;
  final  VoidCallback? SelectedTime;
  const ExampleSlotsScreen({Key? key, required this.point, required this.SelectedTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isOpen = SelectedTime == ScheduleBookingStatus.open;
    CalendarFormat format = CalendarFormat.month;
    DateTime selectedDay = DateTime.now();
    DateTime focusedDay = DateTime.now();
    AccountTab accounttab = AccountTab();
    return GetX<SlotBookingController>(
      init: SlotBookingController(point),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("Transactions")),
          body: Column(
            children: [
              if (_.loading)
                const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ))
              else if (!_.loading && _.dates.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("No transactions found"),
                        TextButton(
                          onPressed: null, */
/*_.showslotsApi(point.chargingPointId, "${_.chargerType?.connectorId}", "${sd.slotBookingDate}"),*//*

                          child: Text("Try again"),
                        )
                      ],
                    ),
                  ),
                )
              else
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
                )
            ],
          ),
        );
      },
    );
  }
}
*/
