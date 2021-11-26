import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/modules/login/login_controller.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/common_widget.dart';
import 'package:yht_ticket/shared/utils/regex.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';
import 'package:yht_ticket/widgets/input_field.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.customTheme.bgLayer1,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                './assets/icons/ticket-outline.png',
                color: AppTheme.theme.colorScheme.primary,
                width: 36,
                height: 36,
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size24!),
                child: Text(
                  "TEKRAR HOŞGELDİN!".toUpperCase(),
                  style: AppTheme.getTextStyle(
                    AppTheme.theme.textTheme.headline6,
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Form(
                key: controller.loginFormKey,
                child: Container(
                  padding: EdgeInsets.only(
                      left: MySize.size24!,
                      right: MySize.size24!,
                      top: MySize.size24!),
                  child: Column(
                    children: <Widget>[
                      InputField(
                        controller: controller.loginEmailController,
                        icon: MdiIcons.emailOutline,
                        keyboardType: TextInputType.emailAddress,
                        placeholder: 'E-posta adresi',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'E-posta adresi gerekli';
                          }
                          if (!Regex.isEmail(value)) {
                            return 'E-posta formatı hatalı.';
                          }

                          return null;
                        },
                      ),
                      CommonWidget.rowHeight(height: MySize.size16!),
                      InputField(
                        controller: controller.loginPasswordController,
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
                                color: AppTheme.theme.colorScheme.onBackground,
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
                      color: AppTheme.theme.primaryColor.withAlpha(24),
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
                    controller.login(context);
                  },
                  child: Text(
                    "GİRİŞ".toUpperCase(),
                    style: AppTheme.getTextStyle(
                      AppTheme.theme.textTheme.bodyText2,
                      fontWeight: 600,
                      color: AppTheme.theme.colorScheme.onPrimary,
                      letterSpacing: 0.5,
                    ),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(Spacing.xy(16, 0))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size16!),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text(
                    "Hesap oluşturmak istiyorum",
                    style: AppTheme.getTextStyle(
                      AppTheme.theme.textTheme.bodyText2,
                      color: AppTheme.theme.colorScheme.onBackground,
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
