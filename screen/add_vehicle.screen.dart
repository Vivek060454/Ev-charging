import 'package:evdock/app/common/always_disbaled_focus_node.dart';
import 'package:evdock/app/controller/add_vehicle.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard/tab/account.tab.dart';

class AddVehicleScreen extends StatelessWidget {
  static const name = "/add_vehicle";
  final bool? showSkip;
  const AddVehicleScreen({Key? key, this.showSkip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final disabledFocusNode = AlwaysDisabledFocusNode();
    return GetX<AddVehicleController>(
      init: AddVehicleController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add Vehicle"),
            actions: [
              if (showSkip ?? false)
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.white),
                  child: const Text("Skip"),
                  onPressed: () {
                    Get.back();
                  },
                ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: _.formKey,
              autovalidateMode: _.autovalidateMode,
              child: Column(
                children: [
                  TextFormField(
                    focusNode: disabledFocusNode,
                    controller: _.carModelController,
                    showCursor: false,
                    enableInteractiveSelection: false,
                    enableSuggestions: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Select Model",
                      labelText: "Select Model",
                    ),
                    onTap: _.selectVehicle,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Car model is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    keyboardType: _.textInputType,
                    textCapitalization: TextCapitalization.characters,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Vehicle No. eg: MH01AB1234",
                      labelText: "Vehicle Number",
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Vehicle number is required";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _.input.vehicleNo = value;
                    },
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text("Add Vehicle"),
                      onPressed: _.addVehicle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
