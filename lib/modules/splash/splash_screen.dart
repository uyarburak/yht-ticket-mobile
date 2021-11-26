import 'package:flutter/material.dart';
import 'package:yht_ticket/shared/constants/colors.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hourglass_bottom,
            color: ColorConstants.darkGray,
            size: 30.0,
          ),
          const Text(
            'Yükleniyor...',
            style: TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
