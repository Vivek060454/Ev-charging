/*
import 'package:evdock/app/model/slot_booking.model.dart';
import 'package:evdock/app/model/slotdate.model.dart';
import 'package:evdock/app/widget/slot_Date_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../controller/slot_controller.dart';
import '../data/Newslotbooking.data.dart';
import '../data/slot_Booking.data.dart';
import '../model/add_vehicle.model.dart';
import '../model/charging_points.model.dart';
import '../service/network.service.dart';
import '../widget/NewSlot_booking.widget.dart';
import '../widget/add_vehicle.tile.widget.dart';
import '../widget/calendar.tile.widget.dart';
import '../widget/charger_type_picker.widget.dart';
import '../widget/slot_booking.widget.dart';
import 'Slot_Picker_example.screen.dart';
import 'booking.screen.dart';

class SlotDateScreen extends StatelessWidget {
  final NetworkService _networkService = Get.find();
  static const name = "/slot_booking";
  final ChargingPointModel point;
  */
/*final slotBooking nw;*//*

  final chargingPointId;
  final connectorId;
  final connectorName;
  final userContactNo;
  //final requestedBookingDate;
  final custName;
  final custMobileNo;
  final custVehicleNo;
  final requestedAmount;
  SlotDateScreen({
    Key? key,
    required this.point,
    this.chargingPointId,
    this.connectorId,
    this.connectorName,
    this.userContactNo,
    */
/*this.requestedBookingDate*//*
 this.custName,
    this.custMobileNo,
    this.custVehicleNo,
    this.requestedAmount,
    */
/*required this.nw,*//*

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<SlotBookingController>(
      init: SlotBookingController(point),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Schedule Booking"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                ListTile(
                  title: const Text("Name",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  subtitle: Text(point.name),
                ),
                ListTile(
                  title: const Text(
                    "Select Charger Type",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: ChargerTypePickerWidget(
                    connectors: point.connectors,
                    onChanged: _.onSelectCHarger,
                    value: _.chargerType,
                  ),
                ),
                ListTile(
                  title: const Text(
                    "Select Amount",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ChoiceChip(
                        label: const Text("???100"),
                        selected: _.amount == "100",
                        selectedColor: Colors.green,
                        onSelected: (value) {
                          if (value) {
                            _.amount = "100";
                          }
                        },
                      ),
                      const SizedBox(width: 12),
                      ChoiceChip(
                        label: const Text("???200"),
                        selected: _.amount == "200",
                        selectedColor: Colors.green,
                        onSelected: (value) {
                          if (value) {
                            _.amount = "200";
                          }
                        },
                      ),
                      const SizedBox(width: 12),
                      ChoiceChip(
                        label: const Text("???500"),
                        selected: _.amount == "500",
                        selectedColor: Colors.green,
                        onSelected: (value) {
                          if (value) {
                            _.amount = "500";
                          }
                        },
                      ),
                      const SizedBox(width: 12),
                      ChoiceChip(
                        label: const Text("Full Charge"),
                        selected: _.amount == "0",
                        selectedColor: Colors.green,
                        onSelected: (value) {
                          if (value) {
                            _.amount = "0";
                          }
                        },
                      ),
                    ],
                  ),
                ),

                ListTile(
                  title:const Text("Select Dates",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  subtitle:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: Get.height * 5 / 100,
                          //alignment: Alignment.topLeft,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: slotdateDataList.slotDateList.length,
                            itemBuilder: (BuildContext context, int index) {
                              var slot = slotdateDataList.slotDateList[index];
                              //Size size = MediaQuery.of(context).size;
                              return
                                */
/* SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(vertical: 2),
                                      width: size.width * 0.35,
                                      height: size.height * 0.05,
                                      decoration:  BoxDecoration(
                                        color: Get.theme.cardColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child:
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _.showslotsApi(widget.chargingPointId,widget.connectorId,widget.SlotData.slotBookingDate);
                                              Get.back();
                                            },
                                            child:Text(
                                              "${slot.slotBookingDate}",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )*//*

                                Obx(() => SlotDateleTile(SlotData: slot, connectorId:_.chargerType?.connectorId, chargingPointId: point.chargingPointId));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(title: const Text("Select Slots",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 210 / 450,
                        //alignment: Alignment.center,
                        child: GridView.builder(
                          itemCount: */
/*_.dates.length,*//*
 slotbookingDataList.slotBookingList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var slotb = */
/*_.dates[index];*//*
 slotbookingDataList
                                .slotBookingList[index];
                            var temp = slotb.slotDateAndTime.toString();
                            temp = temp.substring(11, temp.length);
                            Size size = MediaQuery.of(context).size;
                            // return MySlots(SlotBook: slotb); SlotBookingTile(SlotBook: slotb);
                            return */
/*SlotBookingTile(SlotBook: slotb);*//*
 Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Obx(
                                        () =>*/
/* Container(
                                           margin: const EdgeInsets.symmetric(horizontal: 5),
                                            width: size.width * 0.5,
                                            height: size.height * 0.5,
                                            decoration: BoxDecoration(
                                            color: Get.theme.cardColor,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                           child:*//*

                                    ChoiceChip(
                                        label: Text(temp),
                                        selected: _.selectedid == slotb.id,
                                        selectedColor: Colors.green,
                                        onSelected: (bool selected) {
                                          print(selected);
                                          if (selected) {
                                            print(slotb.slotDateAndTime.toString());
                                            _.selectedid = slotb.id;
                                            print(_.selectedamount);
                                            _.selectedamount = slotb.slotDateAndTime.toString();
                                          };
                                        }),
                                    */
/*),*//*

                                  ),
                                ),
                              ],
                            );
                          },
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                        ),
                      )
                    ],
                  ),
                ),
                */
/*GridTile(
                     child: SlotPickerWidget(
                         sloot: "${nw.slotDateAndTime}",
                         onChanged: _.onSelectDates,
                         value: _.bookType,
                     )),*//*

                */
/*Column(
                  children: [
                    Container(
                        height: Get.height * 210/ 450,
                        alignment: Alignment.center,
                        child:
                        GridView.builder(
                            itemCount: slotbookingDataList.slotBookingList.length,
                            itemBuilder: (BuildContext context, int index){
                              var slotb = slotbookingDataList.slotBookingList[index];
                              return  SlotBookingTile(SlotBook: slotb);
                            }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),)
                    ),

                  ],
                ),*//*

                */
/* const Text(
                  "Select Slots",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ).marginOnly(top: 1, left: 20, right: 5),
                Column(
                  children: [
                    Container(
                      height: Get.height * 210 / 450,
                      alignment: Alignment.center,
                      child: GridView.builder(
                        itemCount: *//*
*/
/*_.dates.length,*//*
*/
/* slotbookingDataList
                            .slotBookingList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var slotb = *//*
*/
/*_.dates[index];*//*
*/
/* slotbookingDataList
                              .slotBookingList[index];
                          var temp = slotb.slotDateAndTime.toString();
                          temp = temp.substring(11, temp.length);
                          Size size = MediaQuery.of(context).size;
                          // return MySlots(SlotBook: slotb); SlotBookingTile(SlotBook: slotb);
                          return *//*
*/
/*SlotBookingTile(SlotBook: slotb);*//*
*/
/* Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Obx(
                                  () => Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                    width: size.width * 0.5,
                                    height: size.height * 0.5,
                                    decoration: BoxDecoration(
                                      color: Get.theme.cardColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                    ChoiceChip(
                                        label: Text(temp),
                                        selected: _.selectedid == slotb.id,
                                        selectedColor: Colors.green,
                                        onSelected: (bool selected) {
                                          print(selected);
                                          if (selected) {
                                            print(slotb.slotDateAndTime.toString());
                                            _.selectedid = slotb.id;
                                            print(_.selectedamount);
                                            _.selectedamount =
                                                slotb.slotDateAndTime.toString();
                                          };
                                        }),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                      ),
                    )
                  ],
                ),*//*

                const SizedBox(
                  height: 40,
                ),
                Align(
                  */
/* alignment: Alignment.bottomCenter,*//*

                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        _.getnewslotbookingApi();
                      },
                      child: const Text("Book Now"),
                    ),
                  ).paddingAll(12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

*/
