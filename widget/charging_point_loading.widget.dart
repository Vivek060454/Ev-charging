import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChargingPointLoadingTile extends StatelessWidget {
  const ChargingPointLoadingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[200]!,
      baseColor: Colors.white,
      child: Container(
        // height: 100,
        width: 200,
        margin: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
