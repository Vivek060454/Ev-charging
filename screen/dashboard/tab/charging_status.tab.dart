import 'package:evdock/app/common/theme.common.dart';
import 'package:evdock/app/controller/charging_status_tab.controller.dart';
import 'package:evdock/app/model/charging_status.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargingStatusTab extends StatelessWidget {

  const ChargingStatusTab({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ChargingStatusTabController>(
      init: ChargingStatusTabController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("Charging Status")),
          body: Column(
            children: [
              if (_.chargingStatus.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Get.theme.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 175,
                  child: DropdownButtonFormField<ChargingStatusModel>(
                    isExpanded: true,
                    isDense: true,
                    decoration: const InputDecoration(
                      labelText: "Charging For",
                      border: InputBorder.none,
                    ),
                    value: _.selectedStatus,
                    items: _.chargingStatus
                        .map((element) => DropdownMenuItem<ChargingStatusModel>(
                              child: Text("${element.vehicleNo}"),
                              value: element,
                            ))
                        .toList(),
                    onChanged: (value) {
                      _.selectedStatus = value;
                      _.pauseLoad = false;
                    },
                    onTap: () {
                      _.pauseLoad = true;
                    },
                  ),
                ),
              if (_.loading)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (!_.loading && _.selectedStatus == null)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not charging in process"),
                        TextButton(
                          onPressed: _.getChargingStatus,
                          child: const Text("Try again"),
                        ),
                      ],
                    ),
                  ),
                )
              else if (!_.loading && _.selectedStatus != null)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (_.selectedStatus?.chargingPercent !=
                                          null &&
                                      _.selectedStatus?.chargingPercent !=
                                          0.0) ...[
                                    SizedBox(
                                      height: Get.size.height * 25 / 100,
                                      width: Get.size.height * 25 / 100,
                                      child: CircularProgressIndicator(
                                        value:
                                            _.selectedStatus!.chargingPercent! /
                                                100,
                                        strokeWidth: 10,
                                        backgroundColor: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "${_.selectedStatus!.chargingPercent}%",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Get.theme.primaryColor),
                                    )
                                  ] else
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: "Charging percentage: ",
                                        children: [
                                          TextSpan(
                                            text: "N/A",
                                            style: TextStyle(
                                              color: Get.theme.textTheme
                                                  .bodyText1!.color,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Requested Amount: ",
                            style: const TextStyle(color: kPrimaryColor),
                            children: [
                              TextSpan(
                                text: "₹${_.selectedStatus!.requestedAmount}",
                                style: TextStyle(
                                  color: Get.theme.textTheme.bodyText1!.color,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.size.width * 40 / 100,
                                child: Column(
                                  children: [
                                    const Text(
                                      "Estimated\nTime",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                    const SizedBox(height: 12),
                                    Text("${_.selectedStatus!.estimatedTime!.isEmpty
                                                       ? "N/A" : _.selectedStatus!.estimatedTime}")
                                  ],
                                ),
                              ),
                              const VerticalDivider(thickness: 3),
                              SizedBox(
                                width: Get.size.width * 40 / 100,
                                child: Column(
                                  children: [
                                    const Text(
                                      "Charging\nSpeed",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                        "${_.selectedStatus!.chargingSpeed} KW")
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                            width: Get.size.width * 80 / 100,
                            child: const Divider(thickness: 3)),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: Get.size.width * 40 / 100,
                                child: Column(
                                  children: [
                                    const Text(
                                      "Requested\nKWH",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                    const SizedBox(height: 12),
                                    Text("${_.selectedStatus!.requestedKwh}")
                                  ],
                                ),
                              ),
                              const VerticalDivider(thickness: 3),
                              SizedBox(
                                width: Get.size.width * 40 / 100,
                                child: Column(
                                  children: [
                                    const Text(
                                      "Current\nKWH",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                    const SizedBox(height: 12),
                                    Text("${_.selectedStatus!.currentKwh}")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Column(
                          children: [
                            SizedBox(
                              width: Get.size.width * 40 / 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                  _.getStopCharging("${_.selectedStatus?.id}");
                                  },
                                  child: const Text('Stop Charging')),
                            ),
                          ],
                        ),
                      ],
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
