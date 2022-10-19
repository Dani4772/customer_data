import 'package:flutter/material.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer'), actions: const [
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
                    'Customer Data',
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
                        const Text('Shop Name'),
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
                        Text('Credit Limit: 50,000'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Name: Adnan'),
                        Text('Mobile Number: 03057316536'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('City: Multan'),
                        Text('Remaining Balance: 15000'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('STRN: 100'),
                        Text('NTN: 1000'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('CNIC: 3999999392323'),
                        Text('Due days: 10'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Opening Balance: 1000'),
                        Text('Customer Group: addd'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Customer Category: hilal'),
                        Text('Customer Brand: Hilal'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
