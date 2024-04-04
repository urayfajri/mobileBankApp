import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/home/components/home_action_menu.dart';
import 'package:mobile_bank_app/src/pages/home/components/home_ads.dart';
import 'package:mobile_bank_app/src/pages/home/components/home_appbar_notification.dart';
import 'package:mobile_bank_app/src/pages/home/components/home_btn_logout.dart';
import 'package:mobile_bank_app/src/pages/home/components/home_user_balance.dart';
import 'package:mobile_bank_app/src/pages/home/components/home_user_info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 125,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.asset(
            'assets/images/logo_bni.png',
          ),
        ),
        actions: const [
          AppBarNotificationIcon(),
          HomeBtnLogout(),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                children: [
                  UserAccountInfo(),
                  SizedBox(height: 15),
                  HomeUserBalance(),
                  SizedBox(height: 10),
                  ActionMenuList(),
                ],
              ),
            ),
            HomeAds(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
