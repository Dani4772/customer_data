import 'package:customer_data/pages/add_order_page.dart';
import 'package:customer_data/pages/daily_order_list_page.dart';
import 'package:customer_data/pages/order_summary_page.dart';
import 'package:customer_data/providers/all_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets_ui/container_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderPageProvider>(
      create: (context) => OrderPageProvider(),
      child: Consumer<OrderPageProvider>(
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
                              'Order',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Contain(
                                    txt: 'Add Order',
                                    imageGet: Image.asset(
                                      'assets/images/addorder.png',
                                      height: 100,
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddOrder()));
                                },
                              ),
                              InkWell(
                                child: Contain(
                                    txt: 'View Order',
                                    imageGet: Image.asset(
                                      'assets/images/vieworder.png',
                                      height: 100,
                                    )),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DailyOrderListPage()));
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: InkWell(
                              child: Contain(
                                  txt: 'Order Summary',
                                  imageGet: Image.asset(
                                    'assets/images/ordersummary.png',
                                    height: 100,
                                  )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                         OrderSummaryPage()));
                              },
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
