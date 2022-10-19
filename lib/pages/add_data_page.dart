import 'package:customer_data/widgets_ui/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_screen.dart';
import '../widgets_ui/button_widgetss.dart';
import '../widgets_ui/field_widget.dart';
import 'customer_list.dart';


class AddCustomer extends StatelessWidget {
  AddCustomer({Key? key}) : super(key: key);

    final _formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController strn = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController creditLimit = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController dueDays = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController openingBalance = TextEditingController();
  TextEditingController shopName = TextEditingController();
  TextEditingController ntn = TextEditingController();
  String? _chosenValue;
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String dateStr = "${today.day}-${today.month}-${today.year}";
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Add Customer'),
          ),
          body: SingleChildScrollView(
            padding:
            const EdgeInsets.only(top: 30, bottom: 10, left: 15, right: 15),
            child: ChangeNotifierProvider<AddDataPageProvider>(
                create: (context)=>AddDataPageProvider(),
                child: Consumer<AddDataPageProvider>(
                  builder: (context,provider,child){
                    return Column(
                      children: [
                        FieldWidget(
                            name: 'Customer ID ',
                            controller: id,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Id ';
                              }
                              return null;
                            }
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 16, right: 16, bottom: 10),
                          width: double.infinity,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Created Date: ',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                dateStr,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),

                        DropDownWidget(optionName: 'Customer Group Option',clr: true),
                        DropDownWidget(optionName: 'Customer Category',clr: true,),
                        DropDownWidget(optionName: 'Customer Brand Option',clr: true,),
                        DropDownWidget(optionName: 'Customer City',clr: true,),


                        FieldWidget(
                            name: 'Customer Name',
                            controller: name,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Customer Name';
                              }
                              return null;
                            }),
                        FieldWidget(
                            name: 'Shop Name',
                            controller: shopName,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Shop Name';
                              }
                              return null;
                            }),
                        FieldWidget(
                            name: 'Mobile No ',
                            controller: mobileNumber,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length < 12) {
                                return 'Enter Mobile Number ';
                              }
                              return null;
                            }),
                        FieldWidget(
                            name: 'Address',
                            controller: address,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Address';
                              }
                              return null;
                            }),
                        FieldWidget(
                            name: 'STRN',
                            controller: strn,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter STRN';
                              }
                              return null;
                            }
                        ),
                        FieldWidget(
                            name: 'NTN',
                            controller: ntn,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter NTN ';
                              }
                              return null;
                            }),
                        FieldWidget(
                            name: 'CNIC',
                            controller: cnic,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length < 14) {
                                return 'Enter CNIC Number ';
                              }
                              return null;
                            }),
                        FieldWidget(
                            name: 'Due Days',
                            controller: dueDays,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty ) {
                                return 'Enter Due Days ';
                              }
                              return null;
                            }),
                        FieldWidget(
                            name: 'Credit Limit',
                            controller: creditLimit,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty ) {
                                return 'Enter Credit Limit ';
                              }
                              return null;
                            }),


                        // Container(
                        //   margin: const EdgeInsets.only(
                        //       top: 10, left: 16, right: 16, bottom: 10),
                        //   width: double.infinity,
                        //   height: 60,
                        //   decoration: const BoxDecoration(
                        //       color: Colors.grey,
                        //       borderRadius: BorderRadius.all(Radius.circular(8))),
                        //   child: Center(
                        //     child: DropdownButton(
                        //         value: _chosenValue,
                        //         items: <String>[
                        //           'In Station',
                        //           'Out Station',
                        //         ].map<DropdownMenuItem<String>>((String value) {
                        //           return DropdownMenuItem<String>(
                        //             value: value,
                        //             child: Text(value),
                        //           );
                        //         }).toList(),
                        //         hint: const Text(
                        //           "Select Option",
                        //           style: TextStyle(
                        //             color: Colors.black,
                        //           ),
                        //         ),
                        //         onChanged: (String? value) {
                        //           _chosenValue = value;
                        //           provider.notifyListeners();
                        //         }
                        //     ),
                        //   ),
                        // ),



                        FieldWidget(
                            name: 'Opening Balance',
                            controller: openingBalance,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Opening Balance';
                              }
                              return null;
                            }),
                        ButtonWidget(
                          name: 'Save',
                          isOnPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  const CustomerList()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Data Saved Successfully')));
                            }
                          },
                        ),
                      ],
                    );
                  },
                )

            ),
          ),
        ),
      ),
    );
  }
}




