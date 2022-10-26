import 'package:customer_data/pages/add_supplier_page.dart';
import 'package:customer_data/pages/supplier_payment_page.dart';
import 'package:customer_data/pages/view_supplier_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_screen.dart';
import '../widgets_ui/container_widget.dart';
import 'add_data_page.dart';
import 'customer_list.dart';

class SupplierPage extends StatelessWidget {
  const SupplierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SupplierPageProvider>(
      create: (context) => SupplierPageProvider(),
      child: Consumer<SupplierPageProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.loose,
                  children: [
                    Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(180.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                IconButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },

                                  color: Colors.white,
                                  icon: const Icon(Icons.arrow_back),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'Supplier',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 25,
                      right: 25,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Contain(
                                    txt: 'Add Supplier',
                                    imageGet: Image.asset(
                                      'assets/images/addsupplier.png',
                                      height: 100,
                                    )),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddSupplierPage()));

                                },
                              ),
                              InkWell(
                                child: Contain(
                                    txt: 'View Supplier',
                                    imageGet: Image.asset(
                                      'assets/images/viewsupplier.png',
                                      height: 100,
                                    )),
                                onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const ViewSupplierPage()));

                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SupplierPaymentPage()));
                                  },
                                  child: Contain(
                                      txt: 'Supplier Payment',
                                      imageGet: Image.asset(
                                        'assets/images/supplierpayment.png',
                                        height: 100,
                                      )),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
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
