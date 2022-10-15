// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  String name;
  TextEditingController controller = TextEditingController();
  bool isObscure;
  final String? Function(String?) validator;

  FieldWidget({
    Key? key,
    required this.name,
    required this.controller,
    required this.isObscure,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
      child: TextFormField(
        textAlign: TextAlign.center,
        autocorrect: true,
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: name,
          filled: true,
          fillColor: Colors.grey,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        controller: controller,
        validator: validator,
      ),
    );
  }
}
