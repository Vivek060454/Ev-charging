import 'package:evdock/app/controller/dashboard.controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  static const name = "/dashboard";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
      init: DashboardController(),
      builder: (_) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bolt),
                label: "Charging",
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.userAlt),
                label: "Account",
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(FontAwesomeIcons.cog),
              //   label: "Settings",
              // ),
            ],
            onTap: (index) {
              _.currentIndex = index;
            },
          ),
          body: _.children[_.currentIndex],
        );
      },
    );
  }
}
