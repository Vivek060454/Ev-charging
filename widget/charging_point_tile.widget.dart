import 'package:evdock/app/model/charging_points.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargingPointTile extends StatelessWidget {
  final ChargingPointModel point;
  final VoidCallback? onOpenTap;
  final VoidCallback? onTap;
  const ChargingPointTile(
      {Key? key, required this.point, this.onOpenTap, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 100,
        width: 250,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              point.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${point.address}\n",
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${point.distance} KM"),
                Row(
                  children: List<Widget>.generate(
                      5,
                      (index) => Icon(
                            Icons.star,
                            size: 16,
                            color: (index + 1) <= point.rating
                                ? Colors.yellow
                                : Colors.grey,
                          )),
                ),
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                      onPressed: onOpenTap,
                      child: Text(onOpenTap == null ? "Close" : "Open")),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
