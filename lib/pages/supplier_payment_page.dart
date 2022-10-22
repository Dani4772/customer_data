import 'package:customer_data/pages/supplier_page.dart';
import 'package:customer_data/providers/all_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets_ui/button_widgetss.dart';
import '../widgets_ui/dropdown_widget.dart';
import '../widgets_ui/field_widget.dart';

class SupplierPaymentPage extends StatelessWidget {
   SupplierPaymentPage({Key? key}) : super(key: key);
  DateTime today = DateTime.now();
  final remark = TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String dateStr = "${today.day}-${today.month}-${today.year}";

    return ChangeNotifierProvider<SupplierPaymentPageProvider>(
      create: (context) => SupplierPaymentPageProvider(),
      child: Consumer<SupplierPaymentPageProvider>(
        builder: (context, builder, child) {
          return Form(
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Supplier Payment Page'),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                      const EdgeInsets.only(right: 16, left: 16, bottom: 15),
                      width: MediaQuery.of(context).size.width / 1,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Center(
                        child: Text(
                          'Date: $dateStr',
                          style: const TextStyle(fontSize: 15,color: Colors.white),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 100,width: 200,
                          child: DropDownWidget(optionName: 'Customer Name', clr: false),),
                        SizedBox(
                          height: 100,
                          width: 200,
                          child: DropDownWidget(
                            optionName: 'Voucher Number',
                            clr: false,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 16),
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: const Center(
                            child: Text(
                              'Due Amount: 5000',
                              style: TextStyle(fontSize: 15,color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: const Center(
                            child: Text(
                              'Amount: 50000',
                              style: TextStyle(fontSize: 15,color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 16, top: 20, right: 16, bottom: 20),
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const Center(
                        child: Text(
                          'Total: 55000',
                          style: TextStyle(fontSize: 15,color: Colors.white),
                        ),
                      ),
                    ),
                    FieldWidget(
                        name: 'Remark: Optional',
                        controller: remark,
                        isObscure: false,
                        validator: (value) {

                        }),
                    Center(
                      child: ButtonWidget(
                          name: 'Done',
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
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyOrderListPage()));
                          }),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
