import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/modules/alert/alert_controller.dart';
import 'package:yht_ticket/theme/theme_data.dart';
import 'package:yht_ticket/widgets/button.dart';
import 'package:yht_ticket/widgets/text.dart';

class AlertInfoDialog extends StatelessWidget {
  final VoidCallback onCancelPressed;

  const AlertInfoDialog({Key? key, required this.onCancelPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.theme;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_2.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.sh2("Aishah Mcconnell", fontWeight: 700),
                      FxText.b2("ais@mcc.com", fontWeight: 500),
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 12),
                        child: FxButton(
                            onPressed: () {},
                            elevation: 0,
                            borderRadiusAll: 4,
                            child: FxText.b2(
                              "Manage all accounts",
                              fontWeight: 600,
                              color: theme.colorScheme.onPrimary,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: theme.dividerColor,
            thickness: 1,
            height: 0,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_1.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.sh2("Liana Fitzgeraldl", fontWeight: 700),
                      FxText.b2("liana.fits@gmail.com", fontWeight: 500),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: AssetImage("./assets/images/profile/avatar.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.sh2("Sally Lee", fontWeight: 700),
                      FxText.b2("sallylee@qq.com", fontWeight: 500),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_2.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.sh2("Shamima Ballard", fontWeight: 700),
                      FxText.b2(
                        "ballard@gmail.com",
                        fontWeight: 500,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: theme.dividerColor,
            thickness: 1,
            height: 0,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
            alignment: AlignmentDirectional.center,
            child: TextButton(
                onPressed: onCancelPressed,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      MdiIcons.logoutVariant,
                      size: 18,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: FxText.b2(
                        "Alarmı iptal et",
                        fontWeight: 600,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
