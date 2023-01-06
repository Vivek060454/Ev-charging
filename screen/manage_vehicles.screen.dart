import 'package:evdock/app/controller/manage_vehicles.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageVehiclesScreen extends StatelessWidget {
  static const name = "/vehicles";
  const ManageVehiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ManageVehiclesController>(
      init: ManageVehiclesController(),
      builder: (_) {
        return SingleChildScrollView(
          child: Scaffold(
            appBar: AppBar(title: const Text("My Vehicles")),
            body: Column(
              children: [
                if (_.loading)
                  const Expanded(
                      child: Center(
                    child: CircularProgressIndicator(),
                  ))
                else if (!_.loading && _.vehicles.isEmpty)
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("No transactions found"),
                          TextButton(
                            onPressed: _.getUserCars,
                            child: const Text("Try again"),
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
