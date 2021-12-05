import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:yht_ticket/modules/profile/profile_controller.dart';
import 'package:yht_ticket/services/auth_service.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              return controller.getProfile();
            },
            color: AppTheme.theme.primaryColor,
            backgroundColor: Colors.white,
            child: Container(
              color: AppTheme.customTheme.bgLayer1,
              child: ListView(
                padding: EdgeInsets.only(top: MySize.size24!),
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.customTheme.bgLayer1,
                        boxShadow: [
                          BoxShadow(
                              color: AppTheme.theme.cardTheme.shadowColor!
                                  .withAlpha(12),
                              blurRadius: MySize.size16!,
                              offset: Offset(0, MySize.size4!))
                        ]),
                    padding: EdgeInsets.all(MySize.size16!),
                    margin: EdgeInsets.only(
                        left: MySize.size24!, right: MySize.size24!),
                    child: Column(
                      children: <Widget>[
                        controller.loading.isFalse
                            ? Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size32!)),
                                    child: Image(
                                      image: NetworkImage(controller
                                              .profile.value.photo ??
                                          'https://via.placeholder.com/150'),
                                      width: MySize.size64,
                                      height: MySize.size64,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: MySize.size16!),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          controller.profile.value.name,
                                          style: AppTheme.getTextStyle(
                                              AppTheme
                                                  .theme.textTheme.bodyText1,
                                              color: AppTheme.theme.colorScheme
                                                  .onBackground,
                                              fontWeight: 600),
                                        ),
                                        Text(
                                          controller.profile.value.email,
                                          style: AppTheme.getTextStyle(
                                              AppTheme
                                                  .theme.textTheme.bodyText2,
                                              color: AppTheme.theme.colorScheme
                                                  .onBackground,
                                              fontWeight: 500),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : SkeletonLoader(
                                builder: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: MySize.size32,
                                    ),
                                    SizedBox(width: MySize.size16!),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            height: 10,
                                            color: Colors.white,
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            width: double.infinity,
                                            height: 12,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                items: 1,
                                period: const Duration(seconds: 2),
                                highlightColor: AppTheme
                                    .theme.colorScheme.primary
                                    .withAlpha(28),
                                direction: SkeletonDirection.ltr,
                              ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16!),
                          padding: EdgeInsets.only(
                              left: MySize.size16!,
                              top: MySize.size8!,
                              bottom: MySize.size8!,
                              right: MySize.size16!),
                          decoration: BoxDecoration(
                              color: AppTheme.theme.colorScheme.primary,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size2))),
                          child: Row(
                            children: <Widget>[
                              Icon(MdiIcons.informationOutline,
                                  color: AppTheme.theme.colorScheme.onPrimary,
                                  size: MySize.size18),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size16!),
                                child: Text(
                                  "Standart Üye",
                                  style: AppTheme.getTextStyle(
                                      AppTheme.theme.textTheme.bodyText2,
                                      color: const Color(0xffFFDF00),
                                      fontWeight: 600,
                                      letterSpacing: 0.2),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Yükselt",
                                    style: AppTheme.getTextStyle(
                                        AppTheme.theme.textTheme.caption,
                                        color: AppTheme
                                            .theme.colorScheme.onPrimary,
                                        fontWeight: 600,
                                        letterSpacing: 0.2),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.customTheme.bgLayer1,
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size8!)),
                        border: Border.all(
                            color: AppTheme.customTheme.bgLayer4, width: 1)),
                    margin: Spacing.fromLTRB(24, 24, 24, 0),
                    padding: Spacing.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "KREDİLERİM".toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  AppTheme.theme.textTheme.caption,
                                  fontSize: 12,
                                  fontWeight: 600,
                                  xMuted: true),
                            ),
                            controller.loading.isFalse
                                ? Text(
                                    controller.profile.value.credits.toString(),
                                    style: AppTheme.getTextStyle(
                                        AppTheme.theme.textTheme.bodyText2,
                                        fontWeight: 600),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(2.0),
                                    height: 18,
                                    width: 18,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 1,
                                    ),
                                  ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppTheme.theme.colorScheme.primary
                                .withAlpha(28),
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                MdiIcons.plus,
                                color: AppTheme.theme.colorScheme.primary,
                                size: MySize.size20,
                              ),
                              Container(
                                margin: Spacing.left(8),
                                child: Text(
                                  "Kredi Yükle",
                                  style: AppTheme.getTextStyle(
                                      AppTheme.theme.textTheme.bodyText2,
                                      color: AppTheme.theme.colorScheme.primary,
                                      fontWeight: 600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.customTheme.bgLayer1,
                        boxShadow: [
                          BoxShadow(
                              color: AppTheme.theme.cardTheme.shadowColor!
                                  .withAlpha(12),
                              blurRadius: MySize.size16!,
                              offset: Offset(0, MySize.size4!))
                        ]),
                    padding: EdgeInsets.all(MySize.size16!),
                    margin: EdgeInsets.only(
                        left: MySize.size24!,
                        right: MySize.size24!,
                        top: MySize.size24!),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Arkadaşına öner",
                                  style: AppTheme.getTextStyle(
                                      AppTheme.theme.textTheme.bodyText2,
                                      color: AppTheme
                                          .theme.colorScheme.onBackground,
                                      fontWeight: 600),
                                ),
                                Text(
                                  "1 kredi kazan",
                                  style: AppTheme.getTextStyle(
                                      AppTheme.theme.textTheme.caption,
                                      color: AppTheme.theme.colorScheme.primary,
                                      fontWeight: 600),
                                )
                              ],
                            ),
                            Icon(
                              MdiIcons.chevronRight,
                              size: MySize.size22,
                              color: AppTheme.theme.colorScheme.onBackground,
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16!),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Reklam izle",
                                    style: AppTheme.getTextStyle(
                                        AppTheme.theme.textTheme.bodyText2,
                                        color: AppTheme
                                            .theme.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                  Text(
                                    "1 kredi kazan",
                                    style: AppTheme.getTextStyle(
                                        AppTheme.theme.textTheme.caption,
                                        color:
                                            AppTheme.theme.colorScheme.primary,
                                        fontWeight: 600),
                                  )
                                ],
                              ),
                              Icon(
                                MdiIcons.chevronRight,
                                size: MySize.size22,
                                color: AppTheme.theme.colorScheme.onBackground,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.customTheme.bgLayer1,
                        boxShadow: [
                          BoxShadow(
                              color: AppTheme.theme.cardTheme.shadowColor!
                                  .withAlpha(12),
                              blurRadius: MySize.size16!,
                              offset: Offset(0, MySize.size4!))
                        ]),
                    padding: EdgeInsets.all(MySize.size16!),
                    margin: EdgeInsets.only(
                        left: MySize.size24!,
                        right: MySize.size24!,
                        top: MySize.size24!),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              MdiIcons.mapMarkerOutline,
                              size: MySize.size22,
                              color: AppTheme.theme.colorScheme.onBackground,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MySize.size16!),
                              child: Text(
                                "Bildirim tercihlerim",
                                style: AppTheme.getTextStyle(
                                    AppTheme.theme.textTheme.subtitle2,
                                    color: AppTheme
                                        .theme.colorScheme.onBackground
                                        .withAlpha(240),
                                    letterSpacing: 0,
                                    fontWeight: 600),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  MdiIcons.chevronRight,
                                  size: MySize.size22,
                                  color:
                                      AppTheme.theme.colorScheme.onBackground,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16!),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                MdiIcons.creditCardOutline,
                                size: MySize.size22,
                                color: AppTheme.theme.colorScheme.onBackground,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size16!),
                                child: Text(
                                  "Geçmiş ödemelerim",
                                  style: AppTheme.getTextStyle(
                                      AppTheme.theme.textTheme.subtitle2,
                                      color: AppTheme
                                          .theme.colorScheme.onBackground
                                          .withAlpha(240),
                                      letterSpacing: 0,
                                      fontWeight: 600),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    MdiIcons.chevronRight,
                                    size: MySize.size22,
                                    color:
                                        AppTheme.theme.colorScheme.onBackground,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16!),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                MdiIcons.security,
                                size: MySize.size22,
                                color: AppTheme.theme.colorScheme.onBackground,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size16!),
                                child: Text(
                                  "Kullanım koşulları",
                                  style: AppTheme.getTextStyle(
                                      AppTheme.theme.textTheme.subtitle2,
                                      color: AppTheme
                                          .theme.colorScheme.onBackground
                                          .withAlpha(240),
                                      letterSpacing: 0,
                                      fontWeight: 600),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    MdiIcons.chevronRight,
                                    size: MySize.size22,
                                    color:
                                        AppTheme.theme.colorScheme.onBackground,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size16!),
                    child: Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(Spacing.xy(16, 0))),
                        onPressed: () {
                          AuthService.to.logout();
                        },
                        child: Text(
                          "ÇIKIŞ".toUpperCase(),
                          style: AppTheme.getTextStyle(
                              AppTheme.theme.textTheme.caption,
                              letterSpacing: 0.5,
                              color: AppTheme.theme.colorScheme.onPrimary,
                              fontWeight: 600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
