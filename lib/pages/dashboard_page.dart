import 'package:customer_data/pages/customer_list.dart';
import 'package:customer_data/pages/order_page.dart';
import 'package:customer_data/pages/reports_page.dart';
import 'package:customer_data/pages/sales_page.dart';
import 'package:customer_data/pages/stock_page.dart';
import 'package:customer_data/pages/supplier_page.dart';
import 'package:customer_data/providers/all_screen.dart';
import 'package:customer_data/widgets_ui/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'customer_page.dart';
import 'login_page.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashBoardPageProvider>(
      create: (context) => DashBoardPageProvider(),
      child: Consumer<DashBoardPageProvider>(
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LogInPage()));
                                  },
                                  child: const Text(
                                    'LogOut ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'B2B Digitize',
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
                                    txt: 'Customer',
                                    imageGet: Image.asset(
                                      'assets/images/1.png',
                                      height: 100,
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CustomerPage()));
                                },
                              ),
                              Contain(
                                  txt: 'Customer Ledger',
                                  imageGet: Image.asset(
                                    'assets/images/2.png',
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SupplierPage()));
                                  },
                                  child: Contain(
                                      txt: 'Supplier',
                                      imageGet: Image.asset(
                                        'assets/images/3.png',
                                        height: 100,
                                      )),
                                ),
                                Contain(
                                    txt: 'Supplier Ledger',
                                    imageGet: Image.asset(
                                      'assets/images/6.png',
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
                                    txt: 'Order',
                                    imageGet: Image.asset(
                                      'assets/images/4.png',
                                      height: 100,
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OrderPage()));
                                },
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const SalesPage()));
                                },
                                child: Contain(
                                    txt: 'Sales',
                                    imageGet: Image.asset(
                                      'assets/images/5.png',
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const StockPage()));
                          },
                                  child: Contain(
                                      txt: 'Stock',
                                      imageGet: Image.asset(
                                        'assets/images/4.png',
                                        height: 100,
                                      )),
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const ReportsPage()));
                                  },
                                  child: Contain(
                                      txt: 'Reports',
                                      imageGet: Image.asset(
                                        'assets/images/5.png',
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
