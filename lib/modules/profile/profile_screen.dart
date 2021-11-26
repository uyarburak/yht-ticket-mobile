import 'package:flutter/material.dart';
import 'package:yht_ticket/services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("404"),
            ElevatedButton(
              onPressed: () {
                AuthService.to.logout();
              },
              child: const Text("ÇIKIŞ"),
            ),
          ],
        ),
      ),
    );
  }
}
