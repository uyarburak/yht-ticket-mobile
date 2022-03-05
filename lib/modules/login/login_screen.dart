import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/common_widget.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';
import 'package:yht_ticket/widgets/input_field.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.yhtTheme.bgLayer1,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                './assets/icons/ticket-outline.png',
                color: AppTheme.yhtTheme.primary,
                width: 36,
                height: 36,
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size24!),
                child: Text(
                  "TEKRAR HOŞGELDİN!".toUpperCase(),
                  style: AppTheme.getTextStyle(
                    AppTheme.theme.textTheme.headline6,
                    color: AppTheme.yhtTheme.onBgLayer1,
                    fontWeight: 700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Form(
                key: loginFormKey,
                child: Container(
                  padding: EdgeInsets.only(
                      left: MySize.size24!,
                      right: MySize.size24!,
                      top: MySize.size24!),
                  child: Column(
                    children: <Widget>[
                      InputField(
                        controller: controller.emailController,
                        icon: MdiIcons.emailOutline,
                        keyboardType: TextInputType.emailAddress,
                        placeholder: 'Kullanıcı adı',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Kullanıcı adı adresi gerekli';
                          }

                          return null;
                        },
                      ),
                      CommonWidget.rowHeight(height: MySize.size16!),
                      InputField(
                        controller: controller.passwordController,
                        icon: MdiIcons.lockOutline,
                        keyboardType: TextInputType.emailAddress,
                        placeholder: 'Parola',
                        password: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Boş bırakılamaz.';
                          }

                          return null;
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size8!),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.FORGOT_PASSWORD);
                            },
                            child: Text(
                              "Şifremi unuttum",
                              style: AppTheme.getTextStyle(
                                AppTheme.theme.textTheme.bodyText2,
                                color: AppTheme.yhtTheme.onBgLayer1,
                                letterSpacing: 0,
                                fontWeight: 500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size12!)),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.yhtTheme.primary.withAlpha(24),
                      blurRadius: 5,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                margin: EdgeInsets.only(
                  left: MySize.size24!,
                  right: MySize.size24!,
                  top: MySize.size16!,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    controller.login(context, loginFormKey);
                  },
                  child: Text(
                    "GİRİŞ".toUpperCase(),
                    style: AppTheme.getTextStyle(
                      AppTheme.theme.textTheme.bodyText2,
                      fontWeight: 600,
                      color: AppTheme.yhtTheme.onPrimary,
                      letterSpacing: 0.5,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => AppTheme.yhtTheme.primary),
                      padding: MaterialStateProperty.all(Spacing.xy(16, 0))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size16!),
                child: InkWell(
                  onTap: () {
                    Get.offAndToNamed(Routes.REGISTER);
                  },
                  child: Text(
                    "Hesap oluşturmak istiyorum",
                    style: AppTheme.getTextStyle(
                      AppTheme.theme.textTheme.bodyText2,
                      color: AppTheme.yhtTheme.onBgLayer1,
                      fontWeight: 500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
