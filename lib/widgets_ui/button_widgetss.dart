import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String name;
  VoidCallback isOnPressed;
  ButtonWidget({Key? key,required this.name,required this.isOnPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: ElevatedButton(
        onPressed: isOnPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          fixedSize: const Size(240, 80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child:   Text(name),
      ),
    );
  }
}
