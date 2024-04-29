import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  // const CustomFormField({Key? key}) : super(key: key);
  final String labelText;

  final String? Function(String?)? validatorFunction;
  final Color primaryColor;
  final Color textColor;
  final Color textFieldBgColor;
  final bool isLabelCenter;
  final TextEditingController? controller;
  final bool numbersOnly;
  const CustomFormField({
    super.key,
    required this.labelText,
    this.validatorFunction,
    this.controller,
    this.numbersOnly=false,
    this.primaryColor = Colors.white38,
    this.textColor = Colors.black,
    this.textFieldBgColor = Colors.white38,
    this.isLabelCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      elevation: 1,
      child: TextFormField(
        controller: controller,
        validator: validatorFunction,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        inputFormatters: numbersOnly?[FilteringTextInputFormatter.allow((RegExp("[.0-9]"))) ]:null,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          filled: true,
          fillColor: textFieldBgColor,
          contentPadding: const EdgeInsets.only(left: 12, right: 12),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: textColor.withOpacity(0.5),
            fontSize: 16,
          ),
          floatingLabelStyle: TextStyle(color: textColor.withOpacity(0.5)),
          label: isLabelCenter
              ? Center(
                  child: Text(
                    labelText,
                  ),
                )
              : Text(
                  labelText,
                ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: textColor.withOpacity(0.5),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: textColor.withOpacity(0.5),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
