import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/shared/utils/regex.dart';
import 'package:yht_ticket/theme/new_app_theme.dart';
import 'package:yht_ticket/theme/text_style.dart';
import 'package:yht_ticket/widgets/button.dart';
import 'package:yht_ticket/widgets/container.dart';
import 'package:yht_ticket/widgets/spacing.dart';
import 'package:yht_ticket/widgets/text.dart';

import 'register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  RegisterScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

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
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        FxContainer.rounded(
                          height: 120,
                          color: theme.colorScheme.secondary,
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                        FxSpacing.height(16),
                        const FxText.h6(
                          "Hesap Oluştur",
                          fontWeight: 600,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  controller: controller.firstNameController,
                                  autofocus: true,
                                  style: FxTextStyle.b1(
                                      letterSpacing: 0.1,
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    hintText: "Ad",
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
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onEditingComplete: () {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            FxSpacing.width(8),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  controller: controller.lastNameController,
                                  style: FxTextStyle.b1(
                                      letterSpacing: 0.1,
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    hintText: "Soyad",
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
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onEditingComplete: () {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: controller.emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'E-posta adresi gerekli';
                              }
                              if (!Regex.isEmail(value)) {
                                return 'E-posta formatı hatalı.';
                              }

                              return null;
                            },
                            style: FxTextStyle.b1(
                                letterSpacing: 0.1,
                                color: theme.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintText: "E-posta adresi",
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
                                MdiIcons.email,
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
                          margin: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: controller.usernameController,
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
                                MdiIcons.at,
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
                            onFieldSubmitted: (_) => controller.register(),
                          ),
                        ),
                        FxSpacing.height(40),
                        FxButton.block(
                          elevation: 0,
                          borderRadiusAll: 4,
                          onPressed: controller.register,
                          child: FxText.b2(
                            "KAYIT OL",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
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
  }
}
