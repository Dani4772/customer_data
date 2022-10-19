import 'package:flutter/material.dart';

class DailyOrderListPage extends StatelessWidget {
  const DailyOrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Order List'),
    ),
     body: ListView.builder(itemBuilder: (BuildContext context ,i){
       return Card(
         child: Container(

           padding: const EdgeInsets.all(16),
           width: double.infinity,
           decoration:  BoxDecoration(
             borderRadius: const BorderRadius.all(Radius.circular(8)),
             border: Border.all(color: Colors.blue),
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 children: [
                   Text('Order ID: 123456'),
                   const Spacer(),
                   TextButton(
                     onPressed: () {},
                     child: const Text('Edit'),
                   ),
                   const SizedBox(
                     width: 20,
                   ),
                   TextButton(
                     onPressed: () {},
                     child: const Text('Delete'),
                   ),
                 ],
               ),

               const Text('Name: Muhammad Adnan Ameen'),

                      Padding(
                       padding: const EdgeInsets.only(top: 10,bottom: 10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: const [
                           Text('Date: 22-10-2022'),
                           Text('Shop Name: Musa Electric Store'),
                         ],
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: const [
                         Text('Product: Switch'),
                         Text('Quantity: 12'),
                       ],
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 10,bottom: 10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: const [
                           Text('City/Area: Multan'),
                           Text('Payment Method: Card'),
                         ],
                       ),
                     ),


             ],
           ),
         ),
       );
     }),
    );

  }
}
