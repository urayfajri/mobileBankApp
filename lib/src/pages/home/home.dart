import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/home/components/home_action_menu.dart';
import 'package:mobile_bank_app/src/pages/home/components/home_ads.dart';
import 'package:mobile_bank_app/src/pages/home/components/home_user_balance.dart';
import 'package:mobile_bank_app/src/pages/home/components/home_user_info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
