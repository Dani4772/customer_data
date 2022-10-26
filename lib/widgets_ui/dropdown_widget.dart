import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_screen.dart';

class DropDownWidget extends StatelessWidget {
  String? optionName;
  bool? clr;
  String? choosenValue;
  DropDownWidget({Key? key,required this.optionName,this.clr,this.choosenValue,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<DropDownWidgetProvider>(create: (context)=>DropDownWidgetProvider(),
    child: Consumer<DropDownWidgetProvider>(builder: (context,provider,child){
      return Container(
          margin: const EdgeInsets.only(
              top: 10, left: 16, right: 16, bottom: 10),
          width: double.infinity,
          height: 60,
          decoration:  BoxDecoration(
              color: clr==true?Colors.pink:Colors.blue,
              borderRadius: const BorderRadius.all(Radius.circular(8))),

          child: Center(
            child: DropdownButton<String>(
                value: choosenValue,
                underline: const SizedBox(),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white, // <-- SEE HERE
                ),
                dropdownColor: Colors.blue,
                style: const TextStyle(
                  color: Colors.white
                ),
                items: <String>[
                  'Adnan',
                  'Farhan',
                  'Hamza',
                  'Ali',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(
                  optionName!,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                onChanged: (String? value) {
                  choosenValue = value;
                  provider.notifyListeners();
                }
            ),
          ),
        );

    },),
    );
  }
}
