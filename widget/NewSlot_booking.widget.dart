
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/slot_controller.dart';
import '../data/slot_Booking.data.dart';

class SlotPickerWidget extends StatelessWidget {
  final List<slotBooking> sloot;
  final Function(slotBooking) onChanged;
  final slotBooking? value;
   SlotPickerWidget({Key? key, required this.sloot, required this.onChanged, required this.value}) : super(key: key);
  /*SlotBookingController SBC = SlotBookingController();*/
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 12),
        itemCount: sloot.length,
        scrollDirection: Axis.horizontal,
       // itemExtent: 75,
        itemBuilder: (BuildContext context, int index) {
          final slotbook = sloot[index];
          return GestureDetector(
            onTap: () => onChanged(slotbook),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*ChoiceChip(
                    label: Text("${slotbook.slotDateAndTime}"),
                    selected: SBC.dates == slotbook.id*//*_selectedIndex==widget.SlotBook.id,*//*,
                    selectedColor: Colors.green,
                    onSelected: (bool value) {
                      // print("sdf"+this._selectedIndex.toString());
                      isSelected = value;
                      // print("val"+value.toString());
                      print(slotbook.slotDateAndTime);
                      if (value) {
                        //   print("hii"+widget.SlotBook.id);
                        slotbook.id;
                        // widget.SlotBook.slotDateAndTime = widget.SlotBook.slotDateAndTime;
                      }}
                     *//* labelStyle: TextStyle(
                          color: isSelected ? Colors.blue : Colors.red,
                        ),
                       selectedColor: Colors.green,
                       child: Text(
                          "${slotbook.slotDateAndTime}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ).marginOnly(top: 20, left: 2, right: 1),*//*
                    ),*/
                /* AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: slotbook.id == value?.id
                        ? Colors.yellow.withOpacity(.5)
                        : slotbook.slotAvailability != null
                        ? Colors.green.withOpacity(.5)
                          : Colors.red.withOpacity(.5),
                        *//*:
                        ? Colors.grey.withOpacity(.5)
                        : Colors.red.withOpacity(.5),*/
              ],
            ),
          );
        }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      ),
    );
  }
}
