import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/slot_controller.dart';

class SlotDateleTile  extends StatelessWidget {
  final   SlotData;
  final  connectorId;
  final  chargingPointId;
  final SlotBookingController SBC;
  const SlotDateleTile ({Key? key, this.SlotData, this.connectorId, this.chargingPointId, required this.SBC}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(()=>/*GestureDetector(
          onTap: (){
            SBC.showslotsApi(chargingPointId,"${connectorId}","${SlotData.slotBookingDate}");
          },
          child:*/ ChoiceChip(
              label: Text(SlotData.slotBookingDate),
              selected:SBC.selecteddateid == SlotData.dateId,
              selectedColor: Colors.green,
              onSelected: (bool selected) {
                print(selected);
                if (selected) {

                  SBC.showslotsApi(chargingPointId,"${connectorId}","${SlotData.slotBookingDate}");
                  print(SlotData.slotBookingDate.toString());
                  SBC.selecteddateid = SlotData.dateId;

                  /*GestureDetector(
                    onTap: (){
                      SBC.showslotsApi(chargingPointId,"${connectorId}","${SlotData.slotBookingDate}");
                    },
                  );*/
                }
              }
          ),
        )/*)*/

      ],
    );
  }
}
