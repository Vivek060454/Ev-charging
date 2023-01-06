import 'package:evdock/app/controller/account_tab.controller.dart';
import 'package:evdock/app/model/charging_points.model.dart';
import 'package:evdock/app/screen/Slot_Booking.screen.dart';
import 'package:evdock/app/screen/reset_password.screen.dart';
import 'package:evdock/app/screen/transactions.screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../widget/calendar.tile.widget.dart';
import '../../DefaultBooking_Screen.dart';
import '../../MY_Bookings.screen.dart';
import '../../booking.screen.dart';

class AccountTab extends StatelessWidget{
static const name = "/account";
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AccountTabController>(
      init: AccountTabController(),
      autoRemove: true,
      initState: (_) {
        if (_.controller?.initialized ?? false) {
          if (_.controller?.walletAmount == null) {
            _.controller?.getWalletbalance();
          }
        }
      },
      builder: (_) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * 25 / 100,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white,
                              Colors.green,
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Wallet Balance",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            if (_.walletLoading)
                              const SizedBox.shrink()
                            else if (!_.walletLoading && _.walletAmount != null)
                              Row(
                                children: [
                                  Text(
                                    "₹${_.walletAmount}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  TextButton.icon(
                                    onPressed: _.addToWallet,
                                    icon:
                                        const Icon(FontAwesomeIcons.moneyBill),
                                    label: const Text("Add Money"),
                                  )
                                ],
                              )
                            else if (!_.walletLoading && _.walletAmount == null)
                              const Text(
                                "Unable to load balance",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.exchangeAlt),
                        iconColor: Get.theme.primaryColor,
                        title: const Text("Transactions"),
                        onTap: () {
                          Get.toNamed(TransactionsScreen.name);
                        },
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.car),
                        iconColor: Get.theme.primaryColor,
                        title: const Text("Manage Vehicle"),
                        // S-Cube code starts
                        onTap: _.getVehicleDetailsfromApi,
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.edit),
                        iconColor: Get.theme.primaryColor,
                        title: const Text("Edit Profile"),
                        onTap: _.getUserDetailsfromApi,
                      ),
                      ListTile(
                        leading: const Icon(Icons.password),
                        iconColor: Get.theme.primaryColor,
                        title: const Text("Reset Password"),
                        onTap: () {
                          Get.toNamed(ResetPassword.name);
                        },
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.recordVinyl),
                        iconColor: Get.theme.primaryColor,
                        title: const Text("Complaints"),
                        onTap: (){
                          _.getComplaintsListfromApi();
                        },
                      ),
                      ListTile(
                        leading: const Icon(FontAwesomeIcons.boxOpen),
                        iconColor: Get.theme.primaryColor,
                        title: const Text("My Bookings"),
                        onTap: () {
                          /*Get.toNamed(MyDefaultBookingScreen.name);*/
                          Get.to(()=>const MyDefaultBookingScreen());
                        },
                      )

                      // S-Cube code ends
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _.signOut,
                child: const Text("Sign Out"),
              ),
            ],
          ),
        );
      },
    );
  }
}
