// S-Cube files
import 'package:evdock/app/screen/add_vehicle.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/add_vehicle.model.dart';
import '../widget/add_vehicle.tile.widget.dart';

class ManageVehicleScreen extends StatelessWidget {
  static const name = "/manage_vehicle";
  const ManageVehicleScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add Vehicle")),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: Get.height * 310/ 450,
                  alignment: Alignment.center,
                  /*padding: const EdgeInsets.all(1),*/
                  decoration: const BoxDecoration(),
                  child: ListView.builder(
                    itemCount: AddVehicleDataList.vehicleList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var vehicle = AddVehicleDataList.vehicleList[index];
                      return AddvehicleTile(VehicleData: vehicle);
                    },
                  ),
                ),
                const SizedBox(
                  height: 125,
                ),
                Column(
                  children: [
                    Container(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            Get.toNamed(AddVehicleScreen.name);
                          },
                          label: const Text('Add Vehicle'),
                          icon: const Icon(Icons.add),
                          backgroundColor: Colors.green,
                        )),
                  ],
                )
              ]),
        ));
  }
}
