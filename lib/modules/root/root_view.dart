import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yht_ticket/routes/app_pages.dart';

import 'drawer.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        final title = current?.location;
        return Scaffold(
          // drawer: const DrawerWidget(),
          // appBar: AppBar(
          //   title: Text(title ?? ''),
          //   centerTitle: true,
          // ),
          body: GetRouterOutlet(
            initialRoute: Routes.SPLASH,
          ),
        );
      },
    );
  }
}
