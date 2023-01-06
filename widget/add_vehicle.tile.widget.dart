// S-Cube files
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/utils.common.dart';
import '../controller/add_vehicle.controller.dart';

class AddvehicleTile extends StatelessWidget {
  AddVehicleController addVehiclecontroller = AddVehicleController();
  final VehicleData;
  AddvehicleTile({Key? key, this.VehicleData}) : super(key: key);
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
            height: size.height * 0.1,
            decoration:  const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xECF1F8FF),
                  Color(0xECF1F8FF),
                  Color(0xECF1F8FF),
                ],
              ),
                /*borderRadius: BorderRadius.circular(15)*/),
            child: Stack(
              /* alignment: Alignment.center,*/
              children: [
                Positioned(
                  top: 5,
                  left: 10,
                  child: Row(
                    children: [
                     /* Text(
                        "${VehicleData.modelId}.",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),*/
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        VehicleData.model,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "VehicleNo:-" + VehicleData.vehicleNo,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 10,
                  child: TextButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () async {
                      final confirm = await showConfirmationDialog(
                          title: "Delete Vehicle Details", content: "Are you sure?");
                      if (!(confirm ?? false)) {
                        return;
                      }
                      addVehiclecontroller
                          .deletevehicledetailsfromApi(VehicleData!.id);
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text(""),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
