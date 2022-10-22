import 'package:customer_data/pages/supplier_page.dart';
import 'package:customer_data/providers/all_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets_ui/button_widgetss.dart';
import '../widgets_ui/dropdown_widget.dart';
import '../widgets_ui/field_widget.dart';

// ignore: must_be_immutable
class AddSupplierPage extends StatelessWidget {
   AddSupplierPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController creditDays = TextEditingController();
  TextEditingController strn = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController creditLimit = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController dueDays = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController openingBalance = TextEditingController();
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
            title: const Text('Add Supplier'),
          ),
          body: SingleChildScrollView(
            padding:
            const EdgeInsets.only(top: 30, bottom: 10, left: 15, right: 15),
            child: ChangeNotifierProvider<AddSupplierPageProvider>(
                create: (context)=>AddSupplierPageProvider(),
                child: Consumer<AddSupplierPageProvider>(
                  builder: (context,provider,child){
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 16, right: 16, bottom: 10),
                          width: double.infinity,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: const Center(
                            child: Text(
                              'Supplier ID:111',
                              style: TextStyle(fontSize: 15,color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 16, right: 16, bottom: 10),
                          width: double.infinity,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Center(
                            child: Text(
                             'Created Date: $dateStr',
                             style: const TextStyle(fontSize: 15,color: Colors.white),
                                ),
                          ),
                        ),

                        DropDownWidget(optionName: 'Supplier Brand',clr: false,),


                        FieldWidget(
                            name: 'Supplier Name',
                            controller: name,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Supplier Name';
                              }
                              return null;
                            }),
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
                            name: 'City Name',
                            controller: city,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter City Name';
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
                            name: 'Credit Days',
                            controller: creditDays,
                            isObscure: false,
                            validator: (value) {
                              if (value == null || value.isEmpty ) {
                                return 'Enter Credit Days ';
                              }
                              return null;
                            }),





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
                                      builder: (context) =>  const SupplierPage()));
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
