import 'package:flutter/material.dart';

class Contain extends StatelessWidget {
  String? txt;
  Image imageGet;
   Contain({Key? key,required this.txt,required this.imageGet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                         Container(
      height: 200,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: imageGet,
            ),
             Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,),
              child: Text(txt!,
                style: const TextStyle(color: Colors.black,fontSize: 18,),
                maxLines: 2,
                textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    )
    ;
  }
}
