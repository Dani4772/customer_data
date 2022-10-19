import 'package:customer_data/pages/add_order_page.dart';
import 'package:customer_data/pages/daily_order_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_screen.dart';
import '../widgets_ui/button_widgetss.dart';
import 'add_data_page.dart';
import 'customer_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //HomePageProvider homePageProvider= Provider.of<HomePageProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Customer')),
      body: Center(
        child: ChangeNotifierProvider<HomePageProvider>(
          create: (context)=> HomePageProvider(),
          child: Consumer<HomePageProvider>(
            builder: (context,provider,child){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(name: 'Add Customer',isOnPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> AddCustomer()));
                       //provider.notifyListeners();
                  }),
                  ButtonWidget(name: 'Customer List',isOnPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const CustomerList()));
                  },),
                  ButtonWidget(name: 'Add Order',isOnPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddOrder()));

                  },),
                  ButtonWidget(name: 'Daily Order',isOnPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        const DailyOrderListPage()));

                  },),
                ],
              );
            },
          )

        ),
      ),
    );
  }
}
