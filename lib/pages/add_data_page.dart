import 'package:customer_data/providers/add_data_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets_ui/button_widgetss.dart';
import '../widgets_ui/field_widget.dart';


class AddCustomer extends StatelessWidget {
  AddCustomer({Key? key}) : super(key: key);

    final _formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController shopName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController previousBalance = TextEditingController();
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
                              provider.ValidationCheck(value);
                            }
                        ),
                        FieldWidget(
                            name: 'Shop Name',
                            controller: shopName,
                            isObscure: false,
                            validator: (value) {
                              provider.ValidationCheck(value);
                            }
                        ),
                        FieldWidget(
                            name: 'Mobile No ',
                            controller: mobileNumber,
                            isObscure: false,
                            validator: (value) {
                              provider.ValidationCheck(value);
                            }),
                        FieldWidget(
                            name: 'City',
                            controller: city,
                            isObscure: false,
                            validator: (value) {
                              provider.ValidationCheck(value);
                            }),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 16, right: 16, bottom: 10),
                          width: double.infinity,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Center(
                            child: DropdownButton(
                                value: _chosenValue,
                                items: <String>[
                                  'In Station',
                                  'Out Station',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                hint: const Text(
                                  "Select Option",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onChanged: (String? value) {
                                  provider.addData(value);
                                }
                            ),
                          ),
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
                        FieldWidget(
                            name: 'Customer Name',
                            controller: name,
                            isObscure: false,
                            validator: (value) {
                              provider.ValidationCheck(value);
                            }),
                        FieldWidget(
                            name: 'Address',
                            controller: address,
                            isObscure: false,
                            validator: (value) {
                              provider.ValidationCheck(value);
                            }),
                        FieldWidget(
                            name: 'Previous Balance',
                            controller: previousBalance,
                            isObscure: false,
                            validator: (value) {
                              provider.ValidationCheck(value);
                            }),
                        ButtonWidget(
                          name: 'Save',
                          isonpressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>  CustomerList()));
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

// class AddCustomer extends StatefulWidget {
//   const AddCustomer({Key? key}) : super(key: key);
//
//   @override
//   State<AddCustomer> createState() => _AddCustomerState();
// }
//
// class _AddCustomerState extends State<AddCustomer> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController id = TextEditingController();
//   TextEditingController shopName = TextEditingController();
//   TextEditingController mobileNumber = TextEditingController();
//   TextEditingController city = TextEditingController();
//   TextEditingController name = TextEditingController();
//   TextEditingController address = TextEditingController();
//   TextEditingController previousBalance = TextEditingController();
//   String? _chosenValue;
//   DateTime today = DateTime.now();
//   @override
//   Widget build(BuildContext context) {
//     String dateStr = "${today.day}-${today.month}-${today.year}";
//     return Form(
//       key: _formKey,
//       child: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Add Customer'),
//           ),
//           body: SingleChildScrollView(
//             padding:
//             const EdgeInsets.only(top: 30, bottom: 10, left: 15, right: 15),
//             child: ChangeNotifierProvider<AddDataPageProvider>(
//               create: (context)=>AddDataPageProvider(),
//               child: Consumer<AddDataPageProvider>(
//                 builder: (context,provider,child){
//                   return Column(
//                     children: [
//                       FieldWidget(
//                           name: 'Customer ID ',
//                           controller: id,
//                           isObscure: false,
//                           validator: (value) {
//                            provider.ValidationCheck(value);
//                           }
//                           ),
//                       FieldWidget(
//                           name: 'Shop Name',
//                           controller: shopName,
//                           isObscure: false,
//                           validator: (value) {
//                             provider.ValidationCheck(value);
//                           }
//                           ),
//                       FieldWidget(
//                           name: 'Mobile No ',
//                           controller: mobileNumber,
//                           isObscure: false,
//                           validator: (value) {
//                             provider.ValidationCheck(value);
//                           }),
//                       FieldWidget(
//                           name: 'City',
//                           controller: city,
//                           isObscure: false,
//                           validator: (value) {
//                             provider.ValidationCheck(value);
//                           }),
//                       Container(
//                         margin: const EdgeInsets.only(
//                             top: 10, left: 16, right: 16, bottom: 10),
//                         width: double.infinity,
//                         height: 60,
//                         decoration: const BoxDecoration(
//                             color: Colors.grey,
//                             borderRadius: BorderRadius.all(Radius.circular(8))),
//                         child: Center(
//                           child: DropdownButton(
//                               value: _chosenValue,
//                               items: <String>[
//                                 'In Station',
//                                 'Out Station',
//                               ].map<DropdownMenuItem<String>>((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               hint: const Text(
//                                 "Select Option",
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               onChanged: (String? value) {
//                                 provider.addData(value);
//                               }
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(
//                             top: 10, left: 16, right: 16, bottom: 10),
//                         width: double.infinity,
//                         height: 60,
//                         decoration: const BoxDecoration(
//                             color: Colors.grey,
//                             borderRadius: BorderRadius.all(Radius.circular(8))),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               'Created Date: ',
//                               style: TextStyle(fontSize: 15),
//                             ),
//                             Text(
//                               dateStr,
//                               style: const TextStyle(fontSize: 15),
//                             ),
//                           ],
//                         ),
//                       ),
//                       FieldWidget(
//                           name: 'Customer Name',
//                           controller: name,
//                           isObscure: false,
//                           validator: (value) {
//                             provider.ValidationCheck(value);
//                           }),
//                       FieldWidget(
//                           name: 'Address',
//                           controller: address,
//                           isObscure: false,
//                           validator: (value) {
//                             provider.ValidationCheck(value);
//                           }),
//                       FieldWidget(
//                           name: 'Previous Balance',
//                           controller: previousBalance,
//                           isObscure: false,
//                           validator: (value) {
//                             provider.ValidationCheck(value);
//                           }),
//                       ButtonWidget(
//                         name: 'Save',
//                         isonpressed: () {
//                           setState(() {
//                             if (_formKey.currentState!.validate()) {
//                               // Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //         builder: (context) =>  CustomerList()));
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                       content: Text('Data Saved Successfully')));
//                             }
//                           });
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               )
//
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


