import 'package:cached_network_image/cached_network_image.dart';
import 'package:evdock/app/model/charging_points.model.dart';
import 'package:flutter/material.dart';

class ChargerTypePickerWidget extends StatelessWidget {
  final List<Connector> connectors;
  final Function(Connector) onChanged;
  final Connector? value;
  const ChargerTypePickerWidget({Key? key, required this.connectors, required this.onChanged, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 12),
        itemCount: connectors.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 75,
        itemBuilder: (BuildContext context, int index) {
          final charger = connectors[index];
          return GestureDetector(
            onTap: () => onChanged(charger),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: charger.connectorId == value?.connectorId
                        ? Colors.yellow.withOpacity(.5)
                        : charger.available && charger.compatible
                            ? Colors.green.withOpacity(.5)
                            : !charger.available && charger.compatible
                                ? Colors.blue.withOpacity(.5)
                                : Colors.red.withOpacity(.5),
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: charger.image,
                    height: 45,
                  ),
                ),
                SizedBox(
                    height: 30,
                    child: Text(charger.chargerType)),
              ],
            ),
          );
          // if (charger == ChargerType.ccs2) {
          //   return GestureDetector(
          //     onTap: () => onChanged(charger),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         AnimatedContainer(
          //           duration: const Duration(milliseconds: 200),
          //           padding: const EdgeInsets.all(4),
          //           decoration: BoxDecoration(
          //             color: value?.connectorId == charger.connectorId
          //                 ? Colors.green.withOpacity(.5)
          //                 : Colors.blue.withOpacity(.5),
          //             shape: BoxShape.circle,
          //           ),
          //           child: CachedNetworkImage(
          //             imageUrl: charger.image,
          //             height: 50,
          //           ),
          //         ),
          //         const Text("CCS2")
          //       ],
          //     ),
          //   );
          // } else if (charger == ChargerType.chAdeMo) {
          //   return GestureDetector(
          //     onTap: () => onChanged(charger),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         AnimatedContainer(
          //           duration: const Duration(milliseconds: 200),
          //           padding: const EdgeInsets.all(4),
          //           decoration: BoxDecoration(
          //             color: value == ChargerType.chAdeMo
          //                 ? Colors.green.withOpacity(.5)
          //                 : Colors.blue.withOpacity(.5),
          //             shape: BoxShape.circle,
          //           ),
          //           child: Image.asset(
          //             "assets/chargers/CHAdeMo.png",
          //             height: 50,
          //           ),
          //         ),
          //         const Text("CHAdeMo")
          //       ],
          //     ),
          //   );
          // } else if (charger == ChargerType.gbT) {
          //   return GestureDetector(
          //     onTap: () => onChanged(charger),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         AnimatedContainer(
          //           duration: const Duration(milliseconds: 200),
          //           padding: const EdgeInsets.all(4),
          //           decoration: BoxDecoration(
          //             color: value == ChargerType.gbT
          //                 ? Colors.green.withOpacity(.5)
          //                 : Colors.blue.withOpacity(.5),
          //             shape: BoxShape.circle,
          //           ),
          //           child: Image.asset(
          //             "assets/chargers/GBT.png",
          //             height: 50,
          //           ),
          //         ),
          //         const Text("GB/T")
          //       ],
          //     ),
          //   );
          // }
          // return const SizedBox.shrink();
        },
      ),
    );
  }
}
