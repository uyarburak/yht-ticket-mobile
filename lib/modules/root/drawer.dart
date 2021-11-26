import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/services/auth_service.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.red,
          ),
          ListTile(
            title: const Text('Ana Sayfa'),
            onTap: () {
              Get.rootDelegate.toNamed(Routes.HOME);
              //to close the drawer

              Navigator.of(context).pop();
            },
          ),
          if (AuthService.to.isLoggedInValue)
            ListTile(
              title: const Text(
                'Çıkış',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: () {
                AuthService.to.logout();
                //Get.rootDelegate.toNamed(Routes.LOGIN);
                //to close the drawer

                Navigator.of(context).pop();
              },
            ),
          if (!AuthService.to.isLoggedInValue)
            ListTile(
              title: const Text(
                'Giriş',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                //Get.rootDelegate.toNamed(Routes.LOGIN);
                //to close the drawer

                Navigator.of(context).pop();
              },
            ),
        ],
      ),
    );
  }
}
