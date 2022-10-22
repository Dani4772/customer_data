import 'package:customer_data/providers/all_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewSupplierPage extends StatelessWidget {
  const ViewSupplierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewSupplierPageProvider>(create: (context)=>ViewSupplierPageProvider(),
      child: Consumer<ViewSupplierPageProvider>(builder: (context,provider,child){
        return  Scaffold(
          appBar: AppBar(title: const Text('Supplier List'), actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 25,
            )
          ]),
          body: ListView.builder(
            padding: const EdgeInsets.all(15),
            // itemCount: task.length!,
            itemBuilder: (BuildContext context, i) {
              return Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Supplier Data',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 15,
                    ),
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('Supplier ID: 1234'),
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
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          child: Text('Address: Taj Colony Shujabad '),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Date: 22-05-2022'),
                            Text('Brand: Adidas'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Supplier Name: Adnan'),
                            Text('NTN: 1234'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('STRN: 100'),
                            Text('City: Multan'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Mobile No: 03057316536'),
                            Text('Credit days: 10'),
                          ],
                        ),
                        const Text('Opening Balance: 1000'),


                      ],
                    ),
                  )
                ],
              );
            },
          ),
        );
      },),
    );
  }
}
