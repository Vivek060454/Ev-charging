import 'package:evdock/app/controller/account_tab.controller.dart';
import 'package:evdock/app/controller/booking.controller.dart';
import 'package:evdock/app/controller/complaints.controller.dart';
import 'package:evdock/app/controller/slot_controller.dart';
import 'package:evdock/app/model/charging_points.model.dart';
import 'package:evdock/app/screen/MY_Bookings.screen.dart';
import 'package:evdock/app/screen/Show_Slots.Screen.dart';
import 'package:evdock/app/screen/Slot_Booking.screen.dart';
import 'package:evdock/app/widget/charger_type_picker.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/Connectors_amount.data.dart';
import '../widget/calendar.tile.widget.dart';
import 'Sample_Slots_Dates.Screen.dart';

class BookingScreen extends StatelessWidget {
  AccountTabController aa = AccountTabController();
  Connectors_amounts nw = Connectors_amounts();
 /* SlotBookingController sb = SlotBookingController();*/
  static const name = "/booking_screen";

  final ChargingPointModel point;
   BookingScreen({Key? key, required this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      init: BookingController(point),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Charging Request"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      "Directions",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ).marginOnly(top: 12, left: 14, right: 14),
                Row(
                  children: [
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                        shape: const StadiumBorder(),
                      ),
                      icon: const Icon(Icons.navigation),
                      label: const Text("Start",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      onPressed: () async {
                        final mapDir =
                            "https://www.google.com/maps/dir/?api=1&destination=${point.latitude},${point.longitude}";
                        if (await canLaunch(mapDir)) {
                          launch(mapDir);
                        }
                      },
                    ).marginOnly(top: 1, left: 14, right: 4)
                  ],
                ),
                ListTile(
                  title: const Text("Name",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  subtitle: Text(point.name),
                ),
                ListTile(
                  title: const Text("Address",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  subtitle: Text("${point.address}\n"),
                ),
                const SizedBox(height: 15),
                ListTile(
                  title: const Text("Select Charger Type",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  subtitle: ChargerTypePickerWidget(
                    connectors: point.connectors,
                    onChanged: _.onSelectCHarger,
                    value: _.chargerType,
                  ),
                ),
                ListTile(
                  title: const Text("Select Amount",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ChoiceChip(
                        label: const Text("₹100"),
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
                        label: const Text("₹200"),
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
                        label: const Text("₹500"),
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
                Form(
                  key: _.additionalForm,
                  child: ExpansionTile(
                    title: const Text("Additional Fields (optional)",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    initiallyExpanded: false,
                    maintainState: true,
                    children: [
                      TextFormField(
                        initialValue: _.userName,
                        textCapitalization: TextCapitalization.characters,
                        decoration: const InputDecoration(
                          labelText: "Name",
                          hintText: "Name",
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          if (value!.trim().isNotEmpty) {
                            _.data.name = value.trim();
                          } else {
                            _.data.name = null;
                          }
                        },
                      ).marginAll(12),
                      TextFormField(
                        initialValue: _.userPhone,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          labelText: "Mobile Number",
                          hintText: "Mobile Number",
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          if (value!.trim().isNotEmpty) {
                            _.data.mobileNo = value.trim();
                          } else {
                            _.data.mobileNo = null;
                          }
                        },
                      ).marginAll(12),
                      TextFormField(
                        initialValue: _.vehicleNumber,
                        textCapitalization: TextCapitalization.characters,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        decoration: const InputDecoration(
                          labelText: "Vehicle Number",
                          hintText: "Vehicle Number",
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          if (value!.trim().isNotEmpty) {
                            _.data.vehicleNo = value.trim();
                          } else {
                            _.data.vehicleNo = null;
                          }
                        },
                      ).marginAll(12),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text("Amenities:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  subtitle: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 22,
                    ),
                    shrinkWrap: true,
                    itemCount: point.amenities.length,
                    itemBuilder: (context, index) => RichText(
                      text: TextSpan(
                        text: "• ",
                        children: [
                          TextSpan(
                            text: point.amenities[index].name,
                            style: TextStyle(
                              color: Get.theme.textTheme.bodyText1!.color,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                        style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _.bookPoint();
                    },
                    child: const Text("Charge Now"),
                  ),
                ).paddingAll(12),
                 SizedBox(
                   width: double.infinity,
                   child:
                   ElevatedButton(
                          onPressed: (){
                           /* nw.connectors = '333';
                            nw.amounts = "150";*/
                           /* Get.back();
                            Get.toNamed(
                              SlotBooking.name,
                              arguments: {"point": point,nw:nw},
                            );*/
                           // _.getsampleslotDateApi();
                           _.getslotDateApi();
                            /*Get.back();
                            Get.toNamed(
                              SlotDateScreen.name,
                              arguments: {"point": point},
                            );*/
                           //print(SlotBooking(point: point,));
                            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SlotBooking(point: point, nw: nw)));
                             //print(SlotBooking(point: point, nw: nw,));
                          },
                          child: const Text("Book A Slot"),
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
