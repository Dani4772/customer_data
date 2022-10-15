import 'package:customer_data/providers/homepage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets_ui/button_widgetss.dart';
import 'add_data_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ButtonWidget(name: 'Add Customer',isonpressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> AddCustomer()));
                       provider.notifyListeners();

                  }),
                  ButtonWidget(name: 'Customer List',isonpressed: (){
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CustomerList()));
                  },),
                  ButtonWidget(name: 'Credit Customer',isonpressed: (){},),
                  ButtonWidget(name: 'Customer Ledger',isonpressed: (){},),
                ],
              );
            },
          )

        ),
      ),
    );
  }
}
