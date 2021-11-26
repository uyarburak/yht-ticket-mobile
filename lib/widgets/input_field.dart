import 'package:flutter/material.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconData icon;
  final String placeholder;
  final bool password;
  final String? Function(String?)? validator;

  InputField({
    required this.controller,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.placeholder = '',
    this.password = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.theme.colorScheme.background,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16!))),
      padding: EdgeInsets.all(MySize.size12!),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(MySize.size6!),
            decoration: BoxDecoration(
                color: AppTheme.theme.colorScheme.primary,
                borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(MySize.size8!),
              child: Icon(
                icon,
                color: AppTheme.theme.colorScheme.onPrimary,
                size: MySize.size20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: MySize.size16!),
              child: TextFormField(
                controller: controller,
                style: AppTheme.getTextStyle(
                  AppTheme.theme.textTheme.bodyText1,
                  letterSpacing: 0.1,
                  color: AppTheme.theme.colorScheme.onBackground,
                  fontWeight: 500,
                ),
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: AppTheme.getTextStyle(
                    AppTheme.theme.textTheme.subtitle2,
                    letterSpacing: 0.1,
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 500,
                  ),
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
                  isDense: true,
                  contentPadding: const EdgeInsets.all(0),
                ),
                keyboardType: keyboardType,
                obscureText: password,
                autocorrect: false,
                validator: validator,
              ),
            ),
          )
        ],
      ),
    );
  }
}
