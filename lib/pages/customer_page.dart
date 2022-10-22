import 'package:customer_data/pages/add_order_page.dart';
import 'package:customer_data/pages/credit_customer_list_page.dart';
import 'package:customer_data/pages/customer_receive_page.dart';
import 'package:customer_data/pages/daily_order_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_screen.dart';
import '../widgets_ui/button_widgetss.dart';
import '../widgets_ui/container_widget.dart';
import 'add_data_page.dart';
import 'customer_list.dart';
import 'login_page.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomerPageProvider>(
      create: (context) => CustomerPageProvider(),
      child: Consumer<CustomerPageProvider>(
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
                              'Customer',
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
                                    txt: 'Add Customer',
                                    imageGet: Image.asset(
                                      'assets/images/1.png',
                                      height: 100,
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddCustomer()));
                                },
                              ),
                              InkWell(
                                child: Contain(
                                    txt: 'View Customer',
                                    imageGet: Image.asset(
                                      'assets/images/2.png',
                                      height: 100,
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CustomerList()));
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
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomerReceivePage()));
                                  },
                                  child: Contain(
                                      txt: 'Customer Receive',
                                      imageGet: Image.asset(
                                        'assets/images/3.png',
                                        height: 100,
                                      )),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CreditCustomerListPage()));
                                  },
                                  child: Contain(
                                      txt: 'Credit Customers',
                                      imageGet: Image.asset(
                                        'assets/images/6.png',
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
