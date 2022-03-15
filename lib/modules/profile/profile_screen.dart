import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:yht_ticket/modules/profile/profile_controller.dart';
import 'package:yht_ticket/services/auth_service.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/theme/text_style.dart';
import 'package:yht_ticket/widgets/button.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  static ThemeData theme = AppTheme.theme;
  static CustomTheme customTheme = AppTheme.customTheme;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            return controller.getProfile();
          },
          color: theme.primaryColor,
          backgroundColor: customTheme.card,
          child: Container(
            padding: FxSpacing.top(24),
            child: ListView(
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(color: customTheme.card, boxShadow: [
                    BoxShadow(
                        color: customTheme.shadowColor.withAlpha(12),
                        blurRadius: MySize.size16!,
                        offset: Offset(0, MySize.size4!))
                  ]),
                  padding: FxSpacing.all(12),
                  margin: FxSpacing.x(20),
                  child: Column(
                    children: <Widget>[
                      controller.loading.isFalse
                          ? _buildProfileInfo()
                          : SkeletonLoader(
                              builder: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor:
                                        customTheme.shimmerHighlightColor,
                                    radius: 27,
                                  ),
                                  FxSpacing.width(12),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width: double.infinity,
                                          height: 10,
                                          color:
                                              customTheme.shimmerHighlightColor,
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          width: double.infinity,
                                          height: 12,
                                          color:
                                              customTheme.shimmerHighlightColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              items: 1,
                              period: const Duration(seconds: 2),
                              highlightColor: customTheme.shimmerBaseColor,
                              direction: SkeletonDirection.ltr,
                            ),
                      _buildMembershipInfo(),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: customTheme.card,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8!)),
                      border:
                          Border.all(color: customTheme.cardDark, width: 1)),
                  margin: Spacing.fromLTRB(
                      MySize.size24!, MySize.size24!, MySize.size24!, 0),
                  padding: Spacing.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          FxText.caption(
                            "KREDİLERİM".toUpperCase(),
                            fontSize: 12,
                            fontWeight: 600,
                            muted: true,
                          ),
                          controller.loading.isFalse
                              ? FxText.b2(
                                  controller.profile.value.credits.toString(),
                                  fontWeight: 600,
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
                      FxButton.small(
                        onPressed: () {
                          //controller.logout();
                        },
                        elevation: 0,
                        borderRadiusAll: 4,
                        backgroundColor: theme.colorScheme.primary,
                        splashColor: theme.colorScheme.onPrimary.withAlpha(30),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.plus,
                              color: theme.colorScheme.onSecondary,
                              size: MySize.size20,
                            ),
                            Container(
                              margin: Spacing.left(8),
                              child: FxText.button(
                                "Kredi Yükle",
                                color: theme.colorScheme.onSecondary,
                                fontWeight: 600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: FxSpacing.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    children: _buildList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMembershipInfo() {
    if (controller.profile.value.isGuest) {
      return Container(
        margin: EdgeInsets.only(top: MySize.size16!),
        padding: EdgeInsets.only(
            left: MySize.size16!,
            top: MySize.size8!,
            bottom: MySize.size8!,
            right: MySize.size16!),
        decoration: BoxDecoration(
            color: theme.colorScheme.error,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size2))),
        child: Row(
          children: <Widget>[
            Icon(
              MdiIcons.informationOutline,
              color: theme.colorScheme.onSecondary,
              size: MySize.size18,
            ),
            Container(
              margin: EdgeInsets.only(left: MySize.size16!),
              child: const FxText.b2(
                "Kayıtsız Kullanıcı",
                color: Color(0xffFFDF00),
                fontWeight: 600,
                letterSpacing: 0.2,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: FxText.caption(
                  "Ücretsiz Üye Ol",
                  color: theme.colorScheme.onPrimary,
                  fontWeight: 600,
                  letterSpacing: 0.2,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(top: MySize.size16!),
      padding: EdgeInsets.only(
          left: MySize.size16!,
          top: MySize.size8!,
          bottom: MySize.size8!,
          right: MySize.size16!),
      decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size2))),
      child: Row(
        children: <Widget>[
          Icon(
            MdiIcons.informationOutline,
            color: theme.colorScheme.onSecondary,
            size: MySize.size18,
          ),
          Container(
            margin: EdgeInsets.only(left: MySize.size16!),
            child: const FxText.b2(
              "Standart Üye",
              color: Color(0xffFFDF00),
              fontWeight: 600,
              letterSpacing: 0.2,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: FxText.caption(
                "Yükselt",
                color: theme.colorScheme.onPrimary,
                fontWeight: 600,
                letterSpacing: 0.2,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    if (controller.profile.value.isGuest) {
      return Row(
        children: [
          FxText.b1('Ula sen kaydolmamissin ki'),
        ],
      );
    }
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(MySize.size32!)),
          child: Image(
            image: NetworkImage(controller.profile.value.photo.isNotEmpty
                ? controller.profile.value.photo
                : 'https://via.placeholder.com/150'),
            width: 54,
            height: 54,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: FxSpacing.left(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FxText.b1(
                controller.profile.value.name,
                fontWeight: 600,
              ),
              FxText.b2(
                controller.profile.value.email,
                fontWeight: 500,
              ),
            ],
          ),
        )
      ],
    );
  }

  List<Widget> _buildList() {
    return [
      _buildSingleRow('Profili Düzenle', FeatherIcons.user),
      const Divider(),
      _buildSingleRow('Bildirimlerim', FeatherIcons.bell),
      const Divider(),
      _buildSingleRow('Dil', FeatherIcons.globe),
      const Divider(),
      _buildSingleRow('Karanlık Mod', FeatherIcons.moon),
      const Divider(),
      _buildSingleRow('Referanslarım', FeatherIcons.users),
      const Divider(),
      _buildSingleRow('Yardım', FeatherIcons.headphones),
      const Divider(),
      _buildSingleRow('Ödeme Geçmişi', FeatherIcons.shoppingCart),
      const Divider(),
      FxSpacing.height(20),
      Center(
        child: RichText(
          text: TextSpan(
            text: 'Kullanım Koşulları',
            style: FxTextStyle.caption(
              decoration: TextDecoration.underline,
              letterSpacing: 0.2,
              color: theme.primaryColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '  ve  ',
                style:
                    FxTextStyle.caption(color: theme.colorScheme.onBackground),
              ),
              TextSpan(
                text: 'Gizlilik Sözleşmesi',
                style: FxTextStyle.caption(
                  decoration: TextDecoration.underline,
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      FxSpacing.height(20),
      FxButton.block(
        onPressed: () {
          AuthService.to.logout();
        },
        elevation: 0,
        borderRadiusAll: 4,
        backgroundColor: theme.colorScheme.secondary,
        splashColor: theme.colorScheme.onPrimary.withAlpha(30),
        child: FxText.button(
          'ÇIKIŞ',
          fontWeight: 600,
          color: theme.colorScheme.onSecondary,
        ),
      ),
      FxSpacing.height(20),
      const Divider(),
      FxSpacing.height(20),
      FxText.button(
        "© 2022 Updown Mobile (v1.0.1)",
        textAlign: TextAlign.center,
        letterSpacing: 0.2,
        color: theme.colorScheme.secondary,
      ),
    ];
  }

  Widget _buildSingleRow(String name, IconData icon) {
    return Padding(
      padding: FxSpacing.y(6),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: theme.colorScheme.onBackground,
          ),
          FxSpacing.width(20),
          Expanded(
            child: FxText.b2(
              name,
            ),
          ),
          FxSpacing.width(20),
          Icon(
            FeatherIcons.chevronRight,
            size: 20,
            color: theme.colorScheme.onBackground,
          ),
        ],
      ),
    );
  }
}
