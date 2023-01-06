import 'dart:async';

import 'package:evdock/app/common/enum.dart';
import 'package:evdock/app/controller/home_tab.controller.dart';
import 'package:evdock/app/model/user_car.model.dart';
import 'package:evdock/app/screen/booking.screen.dart';
import 'package:evdock/app/widget/charging_point_loading.widget.dart';
import 'package:evdock/app/widget/charging_point_tile.widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../../scanner.dart';
class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeTabController>(
      init: HomeTabController(),
      autoRemove: false,
      didChangeDependencies: (_) async {
        if ((_.controller?.initialized) ?? false) {
          if (_.controller!.initialCameraPosition != null) {
            _.controller?.moveCameraPosition(
                _.controller!.initialCameraPosition!.target,
                zoom: 14);
          }
        }
      },
      initState: (_) {
        _.controller?.googleMapController = Completer();
        if (!(_.controller?.loading ?? false)) {
          _.controller?.locationService();
        }
      },
      builder: (_) {
        return Scaffold(
          body: Column(
            children: [


              if (_.loading) ...[
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        if (_.loadingMessage.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Text(_.loadingMessage),
                        ]
                      ],
                    ),
                  ),
                ),
              ] else if (!_.loading && _.error.isNotEmpty) ...[
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_.error),
                        TextButton(
                          onPressed: _.locationService,
                          child: Text(
                            _.locationPermissionStatus ==
                                    LocationPermission.deniedForever
                                ? "Open Settings"
                                : "Try again",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ] else if (!_.loading &&
                  _.permissionGranted &&
                  _.initialCameraPosition != null) ...[
                Expanded(
                  child: Stack(
                    children: [
                      if (_.googleMap != null) _.googleMap!,
                      // GoogleMap(
                      //   initialCameraPosition: _.initialCameraPosition!,
                      //   myLocationEnabled: true,
                      //   zoomControlsEnabled: false,
                      //   myLocationButtonEnabled: false,
                      //   markers: _.markers.toSet(),
                      //   onMapCreated: (googleMapController) {
                      //     log("message");
                      //     if (!_.googleMapController.isCompleted) {
                      //       _.googleMapController.complete(googleMapController);
                      //     }
                      //   },
                      // ),
                      if (_.chargingPointsLoading)
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            height: 110,
                            child: ListView.builder(
                              itemCount: 5,
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, bottom: 12),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return const ChargingPointLoadingTile();
                              },
                            ),
                          ),
                        )
                      else if (!_.chargingPointsLoading &&
                          _.chargingPointError.isNotEmpty)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _.chargingPointError,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    shadows: [
                                      BoxShadow(
                                          offset: Offset(1, 1),
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          spreadRadius: 5),
                                    ]),
                              ),
                              TextButton(
                                onPressed: _.getNearbyChargingPoints,
                                child: const Text("Try again"),
                              )
                            ],
                          ),
                        )
                      else if (!_.chargingPointsLoading &&
                          (_.chargingPoints?.isNotEmpty ?? false))
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            height: 110,
                            child: ListView.builder(
                              itemCount: _.chargingPoints!.length,
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, bottom: 12),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                final point = _.chargingPoints![index];
                                final isOpen =
                                    point.status == ChargingPointStatus.open;
                                return ChargingPointTile(
                                  point: point,
                                  onTap: () {
                                    final _latLng =
                                        LatLng(point.latitude, point.longitude);
                                    _.moveCameraPosition(_latLng, zoom: 14);
                                  },
                                  onOpenTap: isOpen
                                      ? () {
                                          final _latLng = LatLng(
                                              point.latitude, point.longitude);
                                          _.moveCameraPosition(_latLng,
                                              zoom: 14);
                                          // showChargingPointDetail(point);
                                          Get.toNamed(
                                            BookingScreen.name,
                                            arguments: {"point": point,"nw":null},
                                          );
                                        }
                                      : null,
                                );
                              },
                            ),
                          ),
                        ),
                      if (_.userCars.isNotEmpty)
                        Align(
                          alignment: Alignment.topLeft,
                          child: SafeArea(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              margin: const EdgeInsets.all(12),
                              width: 175,
                              decoration: BoxDecoration(
                                color: Get.theme.cardColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonFormField<UserCarModel>(
                                isExpanded: true,
                                items: _.userCars
                                    .map((element) =>
                                        DropdownMenuItem<UserCarModel>(
                                          child: Text(
                                            element.model,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          value: element,
                                        ))
                                    .toList(),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                value: _.selectedCar,
                                onChanged: _.selectCar,
                              ),
                            ),
                          ),
                        ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(29.0),
                          child: Container(

                            child: FloatingActionButton(
                     backgroundColor:  Colors.transparent,
                              elevation: 0,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Scanner()));
                              },
                              child:  Icon(Icons.document_scanner_outlined,size: 36,),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}
