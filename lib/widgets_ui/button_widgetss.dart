import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String name;
  VoidCallback isonpressed;
  ButtonWidget({Key? key,required this.name,required this.isonpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: ElevatedButton(
        onPressed: isonpressed,
        style: ElevatedButton.styleFrom(
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
