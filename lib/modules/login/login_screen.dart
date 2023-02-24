import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/theme/text_style.dart';
import 'package:yht_ticket/widgets/button.dart';
import 'package:yht_ticket/widgets/container.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = AppTheme.theme;
    var customTheme = AppTheme.customTheme;

    return Obx(
      () => Scaffold(
        body: Container(
          margin: FxSpacing.top(36),
          padding: FxSpacing.x(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(MdiIcons.chevronLeft),
              ),
              Expanded(
                child: Form(
                  key: controller.formKey,
                  child: Center(
                    child: ListView(
                      children: [
                        FxContainer.rounded(
                          height: 120,
                          color: theme.colorScheme.secondary,
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                        Container(
                          margin: FxSpacing.top(16),
                          child: const Center(
                            child: FxText.h6("Giriş Yap", fontWeight: 600),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: controller.emailController,
                            autofocus: true,
                            style: FxTextStyle.b1(
                                letterSpacing: 0.1,
                                color: theme.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintText: "Kullanıcı Adı",
                              hintStyle: FxTextStyle.sh2(
                                  letterSpacing: 0.1,
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: customTheme.card,
                              prefixIcon: const Icon(
                                MdiIcons.accountOutline,
                                size: 22,
                              ),
                              isDense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.sentences,
                            onEditingComplete: () {
                              FocusScope.of(context).nextFocus();
                            },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: TextFormField(
                            controller: controller.passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Boş bırakılamaz.';
                              }

                              return null;
                            },
                            obscureText: !controller.isPasswordVisible.value,
                            style: FxTextStyle.b1(
                                letterSpacing: 0.1,
                                color: theme.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintStyle: FxTextStyle.sh2(
                                  letterSpacing: 0.1,
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 500),
                              hintText: "Parola",
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: customTheme.card,
                              prefixIcon: const Icon(
                                MdiIcons.lockOutline,
                                size: 22,
                              ),
                              suffixIcon: InkWell(
                                onTap: controller.onPasswordVisibilityPressed,
                                child: Icon(
                                  controller.isPasswordVisible.value
                                      ? MdiIcons.eyeOffOutline
                                      : MdiIcons.eyeOutline,
                                  size: 22,
                                ),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            textCapitalization: TextCapitalization.sentences,
                            onFieldSubmitted: (_) => controller.login(),
                          ),
                        ),
                        FxSpacing.height(8),
                        InkWell(
                          onTap: () {
                            //Get.toNamed(Routes.FORGOT_PASSWORD);
                          },
                          child: FxText.b2(
                            "Parolamı unuttum",
                            letterSpacing: 0,
                            fontWeight: 500,
                            color: theme.colorScheme.secondary,
                            textAlign: TextAlign.end,
                            xMuted: true,
                          ),
                        ),
                        FxSpacing.height(40),
                        FxButton.block(
                          elevation: 0,
                          borderRadiusAll: 4,
                          onPressed: controller.login,
                          child: FxText.b2(
                            "Giriş",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                        FxSpacing.height(22),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                          child: FxText.b2(
                            "Hesap oluşturmak istiyorum",
                            letterSpacing: 0,
                            fontWeight: 500,
                            color: theme.colorScheme.secondary,
                            decoration: TextDecoration.underline,
                            textAlign: TextAlign.center,
                            muted: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

/*
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
    */
  }
}
