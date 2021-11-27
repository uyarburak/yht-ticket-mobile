import 'package:flutter/material.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';
import 'package:yht_ticket/widgets/notification_icon_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppTheme.customTheme.bgLayer1,
          child: ListView(
            shrinkWrap: true,
            padding: Spacing.zero,
            children: <Widget>[
              Container(
                margin: Spacing.fromLTRB(24, 16, 24, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Selam, Yolcu",
                        style: AppTheme.getTextStyle(
                            AppTheme.theme.textTheme.bodyText1,
                            color: AppTheme.theme.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                    ),
                    const NotificationIconButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
