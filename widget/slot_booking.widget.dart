import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/slot_controller.dart';


class SlotBookingTile extends StatelessWidget {
  final  SlotBook;
  final VoidCallback? onOpenTap;
  final SlotBookingController sbc;
  const SlotBookingTile({Key? key, required this.SlotBook, required this.sbc, this.onOpenTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var temp = SlotBook.slotDateAndTime.toString();
    temp = temp.substring(11, temp.length);
    return
    /*  Column(
      children: [
        Container(
          height: Get.height * 210 / 450,
          alignment: Alignment.center,
          child: GridView.builder(
            itemCount: _.dates.length,
       slotbookingDataList.slotBookingList.length,
            itemBuilder: (BuildContext context, int index) {
              var slotb =
      _.dates[index]; slotbookingDataList
                  .slotBookingList[index];
              var temp = slotb.slotDateAndTime.toString();
              temp = temp.substring(11, temp.length);
              Size size = MediaQuery.of(context).size;
              // return MySlots(SlotBook: slotb); SlotBookingTile(SlotBook: slotb);
              return SlotBookingTile(SlotBook: slotb); Row(
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
                               selected: selectedid == slotb.id,
                               selectedColor: Colors.green,
                                onSelected: (bool selected) {
                                 print(selected);
                                 if (selected) {
                                 print(slotb.slotDateAndTime.toString());
                                selectedid = slotb.id;
                                print(selectedamount);
                                selectedamount = slotb.slotDateAndTime.toString();
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
    );*/
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      /*Container(
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
        width: size.width * 0.55,
        height: size.height * 0.10,
        decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child:*/Row(
            children: [
            /* Expanded(
               child: *//*Obx(()=>*/
               Container(
                 margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 1),
                 height: 30.0,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8)),
                 child: ElevatedButton(
                   style: ButtonStyle(
                     overlayColor: MaterialStateProperty.resolveWith<Color?>(
                           (Set<MaterialState> states) {
                         if (states.contains(MaterialState.pressed)) {
                           return Colors.blueAccent;}return null;
                         },),
                   ),
                   onPressed: onOpenTap,
                     child: Text(temp),
                 ),
               )
                  /*ChoiceChip(
                   label: Text(temp, semanticsLabel: onOpenTap == null? "Booked":"Open"),
                  selected: sbc.selectedid == SlotBook.slotId,
                 // disabledColor:  Colors.grey,//SlotBook.slotAvailability,
                  selectedColor: Colors.green,
                   disabledColor: Colors.black,
                   onSelected: (bool selected) {
                    print(selected);
                    if (selected) {
                      print(SlotBook.slotAvailability.toString());
                      print(SlotBook.slotDateAndTime.toString());
                      sbc.selectedid = SlotBook.slotId;
                      onOpenTap == null? "Booked":"Open";
                      print(sbc.selectedamount);
                      sbc.selectedamount = "${SlotBook.slotDateAndTime}";
                    }
                  }),
          ),*/
            /* ),*/
        ]),
     /*Center(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Center(child: Text(SlotBook.slotAvailability,style: const TextStyle(
               fontWeight: FontWeight.bold
           ),))
         ],
       ),
     )*/
     /* ),*/
    ]);
  }
}
