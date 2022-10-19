import 'package:customer_data/providers/all_screen.dart';
import 'package:customer_data/widgets_ui/button_widgetss.dart';
import 'package:customer_data/widgets_ui/dropdown_widget.dart';
import 'package:customer_data/widgets_ui/field_widget.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:provider/provider.dart';

import 'daily_order_list_page.dart';

class AddOrder extends StatelessWidget {
   AddOrder({Key? key}) : super(key: key);

  TextEditingController quantity = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
   DateTime today = DateTime.now();
   String? paymentMethod;
   bool isChecked = false;
   List product = [
     "Tea",
     "Bags",
     "Coke",
     "Switch",
   ];
  @override
  Widget build(BuildContext context) {
    String dateStr = "${today.day}-${today.month}-${today.year}";

    return ChangeNotifierProvider<AddOrderProvider>(create: (context)=>AddOrderProvider(),
    child: Consumer<AddOrderProvider>(
      builder: (context,builder,child){
        return Scaffold(
          appBar: AppBar(title: const Text('Add Order'),),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 30, bottom: 30,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: MediaQuery.of(context).size.width/2.5,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Order ID: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          '14',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: MediaQuery.of(context).size.width/2.5,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Date: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          dateStr,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
             const SizedBox(
                height: 15,
              ),
              DropDownWidget(optionName: 'Select the City or Area',clr: false),

              DropDownWidget(optionName: 'Customer Shops',clr: false,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: MediaQuery.of(context).size.width/2.5,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Name: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'Adnan',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16,top: 10),
                    width: MediaQuery.of(context).size.width/2.1,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Phone: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          '03057316536',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 16,top: 20,right: 16),
                height: 60,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Previous: ',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      '5000',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),

            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  const  Text("Select Payment Method", style: TextStyle(
                      fontSize: 18
                  ),),
                  RadioListTile(
                    title: const Text("Cash"),
                    value: "cash",
                    groupValue: paymentMethod,
                    onChanged: (value){
                      paymentMethod = value.toString();
                      builder.notifyListeners();
                    },
                  ),
                  RadioListTile(
                    title: Text("Card"),
                    value: "card",
                    groupValue: paymentMethod,
                    onChanged: (value){
                      paymentMethod = value.toString();
                      builder.notifyListeners();
                    },
                  ),
                ],
              ),
            ),
              const Padding(
              padding:  EdgeInsets.only(left: 16),
              child:  Text('Search Product'),
            ),
              GFSearchBar(
                searchList: product,
                searchQueryBuilder: (query, product) {
                  return product
                      .where((item) =>
                      item.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                },
                overlaySearchListItemBuilder: (item) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                },
                onItemSelected: (item) {

                    print('$item');
                  //  product=item;
                     builder.notifyListeners();
                },
              ),

              const Padding(
                padding:  EdgeInsets.only(left: 16),
                child:  Text('Selected item PCS'),
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                ),
                margin: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemBuilder: (BuildContext context,i){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Fair & Lovely cream 350ml'),
                         Spacer(),
                         SizedBox(
                           width: 70,
                           height:60,
                           child: FieldWidget(name: '', controller: quantity,
                               isObscure: false, validator: (value){
                                 if (value == null || value.isEmpty) {
                                   return 'Enter Quantity';
                                 }
                                 return null;
                               }),
                         ),
                          Checkbox(value: isChecked, onChanged: (bool? value){
                            isChecked=value!;
                            builder.notifyListeners();
                          })
                        ],
                      ),
                    ),
                  );

                },
                itemCount: 10,
                ),
              ),
             Center(
               child: ButtonWidget(name: 'Submit', isOnPressed: (){

                   Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyOrderListPage()));
               }),
             )
            ],
              
            ),
          ),
        );
      },
    ),
    );
  }
}
