import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/widgets/button.dart';
import 'package:yht_ticket/widgets/container.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = AppTheme.theme;
    var customTheme = AppTheme.customTheme;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxContainer(
            margin: FxSpacing.x(20),
            //olor: customTheme.cardDark,
            borderRadiusAll: 16,
            child: const Image(
              image: AssetImage(
                  'assets/images/push-notifications-concept-illustration_114360-4730.webp'),
            ),
          ),
          FxSpacing.height(36),
          FxText.h1(
            'Tren bileti bulamadın mı?',
            fontWeight: 700,
            textAlign: TextAlign.center,
            color: theme.colorScheme.secondary,
          ),
          FxSpacing.height(20),
          FxText.b2(
            'Hemen alarm kur, koltuk boşaldığında haberin olsun!',
            xMuted: true,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(20),
          Container(
            margin: FxSpacing.x(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FxButton.outlined(
                        onPressed: () {},
                        splashColor: theme.colorScheme.onPrimary.withAlpha(90),
                        elevation: 0,
                        borderRadiusAll: 4,
                        child: FxText.l1(
                          'Kaydol',
                          color: theme.colorScheme.secondary,
                        ),
                        borderColor: theme.colorScheme.secondary,
                      ),
                    ),
                    FxSpacing.width(20),
                    Expanded(
                      child: FxButton.block(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        backgroundColor: theme.primaryColor,
                        splashColor: theme.colorScheme.onPrimary.withAlpha(30),
                        elevation: 0,
                        borderRadiusAll: 4,
                        child: FxText.l1(
                          'Giriş Yap',
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                FxSpacing.height(20),
                FxButton.text(
                  onPressed: () {},
                  splashColor: theme.colorScheme.onPrimary.withAlpha(90),
                  elevation: 0,
                  borderRadiusAll: 4,
                  child: FxText.l1(
                    'Kaydolmadan Devam Et',
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
