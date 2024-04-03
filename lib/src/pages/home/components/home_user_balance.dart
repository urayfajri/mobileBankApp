import 'package:flutter/material.dart';

class HomeUserBalance extends StatelessWidget {
  const HomeUserBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserBalanceLeftSection(),
          Icon(
            Icons.expand_more,
            color: Colors.white,
            size: 40,
          )
        ],
      ),
    );
  }
}

class UserBalanceLeftSection extends StatefulWidget {
  const UserBalanceLeftSection({super.key});

  @override
  UserBalanceLeftSectionState createState() => UserBalanceLeftSectionState();
}

class UserBalanceLeftSectionState extends State<UserBalanceLeftSection> {
  bool showBalance = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('RP ${showBalance ? "12342141" : "********"}'),
              IconButton(
                onPressed: () => {
                  setState(() {
                    showBalance = !showBalance;
                  })
                },
                icon: Icon(
                  showBalance
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Row(
            children: [
              Text("1231231231"),
              SizedBox(width: 10),
              Icon(
                Icons.copy,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "TABLUS BISNIS DIGITAL",
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
