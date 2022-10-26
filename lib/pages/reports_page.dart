import 'package:customer_data/pages/sales_page.dart';
import 'package:customer_data/pages/supplier_page.dart';
import 'package:customer_data/providers/all_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets_ui/container_widget.dart';
import 'customer_page.dart';
import 'order_page.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReportsPageProvider>(
      create: (context) => ReportsPageProvider(),
      child: Consumer<ReportsPageProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1.35,
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
                              'Reports Page',
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
                                    txt: 'Daily Sale Report',
                                    imageGet: Image.asset(
                                      'assets/images/dailysale.png',
                                      height: 100,
                                    )),
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //         const CustomerPage()));
                                },
                              ),
                              Contain(
                                  txt: 'Purchase Report',
                                  imageGet: Image.asset(
                                    'assets/images/purchasereport.png',
                                    height: 100,
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //         const SupplierPage()));
                                  },
                                  child: Contain(
                                      txt: 'Profit Report',
                                      imageGet: Image.asset(
                                        'assets/images/profitreport.png',
                                        height: 100,
                                      )),
                                ),
                                Contain(
                                    txt: 'Sale Bilty',
                                    imageGet: Image.asset(
                                      'assets/images/salebilty.png',
                                      height: 100,
                                    )),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Contain(
                                    txt: 'Purchase Bilty',
                                    imageGet: Image.asset(
                                      'assets/images/purchasebilty.png',
                                      height: 100,
                                    )),
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //         const OrderPage()));
                                },
                              ),
                              InkWell(
                                onTap: (){
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //         const SalesPage()));
                                },
                                child: Contain(
                                    txt: 'Today Customer  Reciepts',
                                    imageGet: Image.asset(
                                      'assets/images/todaycustomer.png',
                                      height: 100,
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap:(){
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //         const StockPage()));
                                  },
                                  child: Contain(
                                      txt: 'Due Report',
                                      imageGet: Image.asset(
                                        'assets/images/duereport.png',
                                        height: 100,
                                      )),
                                ),
                                Contain(
                                    txt: 'Sale Report By Brands',
                                    imageGet: Image.asset(
                                      'assets/images/salebrandreport.png',
                                      height: 100,
                                    )),
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
