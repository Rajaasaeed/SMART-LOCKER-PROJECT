import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

class InputFieldWidget extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool isPassword;
  final bool isPhone;

  const InputFieldWidget(
      {super.key,
      required this.placeholder,
      required this.controller,
      this.isPassword = false,
      this.isPhone = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CupertinoFormRow(
          child: CupertinoTextFormFieldRow(
            // placeholderStyle: TextStyle(color: Colors.black),
              validator: isPassword
                  ? ((value) {
                      final validator = Validator(
                        validators: [
                          RequiredValidator(),
                          MinLengthValidator(length: 8),
                        ],
                      );

                      return validator.validate(
                        context: context,
                        label: placeholder,
                        value: value,
                      );
                    })
                  : isPhone
                      ? ((value) {
                          final validator = Validator(
                            validators: [
                              RequiredValidator(),
                              MinLengthValidator(length: 10),
                              MaxLengthValidator(length: 10),
                            ],
                          );

                          return validator.validate(
                            context: context,
                            label: placeholder,
                            value: value,
                          );
                        })
                      : ((value) {
                          final validator = Validator(
                            validators: [
                              RequiredValidator(),
                              MaxLengthValidator(length: 12),
                              MinLengthValidator(length: 3),
                            ],
                          );

                          return validator.validate(
                            context: context,
                            label: '$placeholder Min 3 Length',
                            value: value,
                          );
                        }),
              keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
              textAlign: TextAlign.start,
              padding: const EdgeInsets.all(5),
              controller: controller,
              obscureText: isPassword,
              placeholder: placeholder)),
    );
  }
}
