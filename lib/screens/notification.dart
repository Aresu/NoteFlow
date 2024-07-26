import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class Notification_Screen extends StatelessWidget {
  const Notification_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.all(0),
          child: Text(
            "Inbox",
            style: TextStyle(
              color: Color.fromARGB(255, 223, 223, 223),
              fontSize: 18.0,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.setting,
                color: Color.fromARGB(255, 223, 223, 223),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.filter_square,
                color: Color.fromARGB(255, 223, 223, 223),
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Iconsax.direct_inbox,
              color: Color.fromARGB(255, 223, 223, 223),
              size: 60,
            ),
            SizedBox(height: 20),
            Text(
              "You're all caught up",
              style: TextStyle(
                fontSize: 12.0,
                color: Color.fromARGB(255, 223, 223, 223),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "You'll be notified here for @mentions, page activity and page invites",
              style: TextStyle(
                fontSize: 12.0,
                color: Color.fromARGB(255, 104, 104, 104),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 249, 249, 247),
    );
  }
}
