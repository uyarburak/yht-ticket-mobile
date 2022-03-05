import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/common_widget.dart';
import 'package:yht_ticket/shared/utils/regex.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';
import 'package:yht_ticket/widgets/input_field.dart';

import 'register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  RegisterScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.yhtTheme.bgLayer1,
        child: Center(
          child: SingleChildScrollView(
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
                    "HESAP OLUŞTUR".toUpperCase(),
                    style: AppTheme.getTextStyle(
                        AppTheme.theme.textTheme.headline6,
                        color: AppTheme.yhtTheme.onBgLayer1,
                        fontWeight: 700,
                        letterSpacing: 0.5),
                  ),
                ),
                Form(
                  key: registerFormKey,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: MySize.size24!,
                        right: MySize.size24!,
                        top: MySize.size24!),
                    child: Column(
                      children: <Widget>[
                        InputField(
                          controller: controller.nameController,
                          icon: MdiIcons.accountOutline,
                          keyboardType: TextInputType.text,
                          placeholder: 'Ad Soyad',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ad soyad gerekli';
                            }

                            return null;
                          },
                        ),
                        CommonWidget.rowHeight(height: MySize.size16!),
                        InputField(
                          controller: controller.emailController,
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
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(
                      left: MySize.size24!,
                      right: MySize.size24!,
                      top: MySize.size24!),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => AppTheme.yhtTheme.primary),
                        padding: MaterialStateProperty.all(Spacing.xy(16, 0))),
                    onPressed: () {
                      controller.register(context, registerFormKey);
                    },
                    child: Text(
                      "KAYIT OL".toUpperCase(),
                      style: AppTheme.getTextStyle(
                          AppTheme.theme.textTheme.bodyText2,
                          fontWeight: 600,
                          color: AppTheme.yhtTheme.onPrimary,
                          letterSpacing: 0.5),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size16!),
                  child: InkWell(
                    onTap: () {
                      Get.offAndToNamed(Routes.LOGIN);
                    },
                    child: Text(
                      "Zaten bir hesabım var",
                      style: AppTheme.getTextStyle(
                          AppTheme.theme.textTheme.bodyText2,
                          color: AppTheme.yhtTheme.onBgLayer1,
                          fontWeight: 500,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
