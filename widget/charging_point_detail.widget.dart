import 'package:cached_network_image/cached_network_image.dart';
import 'package:evdock/app/common/enum.dart';
import 'package:evdock/app/model/charging_points.model.dart';
import 'package:evdock/app/screen/booking.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ChargingPointDetail extends StatelessWidget {
  final ChargingPointModel point;
  const ChargingPointDetail({Key? key, required this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isOpen = point.status == ChargingPointStatus.open;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    point.name,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: Get.back,
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: point.image,
                  height: Get.height * 15 / 100,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("${point.distance} KM"),
                    const SizedBox(width: 12),
                    Container(
                      height: 30,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      decoration: ShapeDecoration(
                          color: isOpen ? Colors.red : Colors.grey,
                          shape: const StadiumBorder()),
                      child: Text(
                        isOpen ? "Open" : "Close",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: List<Widget>.generate(
                      5,
                      (index) => Icon(
                            Icons.star,
                            size: 18,
                            color: (index + 1) <= point.rating
                                ? Colors.yellow
                                : Colors.grey,
                          )),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Get.theme.textTheme.bodyText1!.color,
                      ),
                      children: [
                        const TextSpan(
                          text: "Address: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: point.address)
                      ],
                    ),
                  ),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                    shape: const StadiumBorder(),
                  ),
                  icon: const Icon(Icons.navigation),
                  label: const Text("Start"),
                  onPressed: () async {
                    final mapDir =
                        "https://www.google.com/maps/dir/?api=1&destination=${point.latitude},${point.longitude}";
                    if (await canLaunch(mapDir)) {
                      launch(mapDir);
                    }
                  },
                ),
              ],
            ),
            const Text(
              "Available Chargers:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 75,
              child: ListView.builder(
                itemCount: point.connectors.length,
                scrollDirection: Axis.horizontal,
                itemExtent: 75,
                itemBuilder: (BuildContext context, int index) {
                  final charger = point.connectors[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: charger.available && charger.compatible
                              ? Colors.green.withOpacity(.5)
                              : !charger.available && charger.compatible
                                  ? Colors.blue.withOpacity(.5)
                                  : Colors.red.withOpacity(.5),
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: charger.image,
                          height: 50,
                        ),
                      ),
                      Text(charger.chargerType)
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Amenities:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isOpen
                    ? () {
                        Get.back();
                        Get.toNamed(
                          BookingScreen.name,
                          arguments: {"point": point},
                        );
                      }
                    : null,
                child: const Text("Book Now"),
              ),
            ),
          ],
        ).paddingAll(12),
      ),
    );
  }
}
