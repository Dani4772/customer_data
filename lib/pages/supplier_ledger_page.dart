import 'package:customer_data/providers/all_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SupplierLedgerPage extends StatelessWidget {
   SupplierLedgerPage({Key? key}) : super(key: key);
  String _toSelectedDate = 'October 12,2019';
  String _fromSelectedDate = 'October 12,2019';
  String? choosenValue;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SupplierLedgerPageProvider>(create: (context)=>SupplierLedgerPageProvider(),
      child: Consumer<SupplierLedgerPageProvider>(
        builder: (context,provider,child){
          return Scaffold(
              appBar: AppBar(title: const Text('Supplier Ledger'),),
              body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Supplier Name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 16, right: 16, bottom: 10),
                              width: 200,
                              height: 60,
                              decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                              child: Center(
                                child: DropdownButton<String>(
                                    value: choosenValue,
                                    underline: const SizedBox(),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white, // <-- SEE HERE
                                    ),
                                    dropdownColor: Colors.blue,
                                    style: const TextStyle(color: Colors.white),
                                    items: <String>[
                                      'Adnan',
                                      'Farhan',
                                      'Hamza',
                                      'Ali',
                                    ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                    hint: const Text(
                                      'Select Name',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onChanged: (String? value) {
                                      choosenValue = value;
                                      provider.notifyListeners();
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        margin: EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('To:   ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            Text(_toSelectedDate,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            IconButton(
                              icon: const Icon(Icons.calendar_today,
                                  color: Colors.white),
                              tooltip: 'Tap to open date picker',
                              onPressed: () async {
                                DateTime? d = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2015, 8),
                                  lastDate: DateTime(2101),
                                );
                                if (d != null) {
                                  _toSelectedDate =
                                      DateFormat.yMMMMd("en_US").format(d);
                                }

                                provider.notifyListeners();
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        margin: EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('From:   ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            Text(_fromSelectedDate,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            IconButton(
                              icon: const Icon(Icons.calendar_today,
                                  color: Colors.white),
                              tooltip: 'Tap to open date picker',
                              onPressed: () async {
                                DateTime? d = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2015, 8),
                                  lastDate: DateTime(2101),
                                );
                                if (d != null) {
                                  _fromSelectedDate =
                                      DateFormat.yMMMMd("en_US").format(d);
                                }

                                provider.notifyListeners();
                              },
                            ),
                          ],
                        ),
                      ),
                      if(choosenValue!=null)
                        Center(
                          child: Text(
                            'Name: $choosenValue',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      const Center(
                        child: Text(
                          'Address: Gulgusht Multan',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 20,bottom: 20),
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.all(Colors.pink),
                          dataRowHeight: 80,
                          columnSpacing: 10,
                          border: TableBorder.all(
                            width: 1.0,
                          ),
                          columns: const [
                            DataColumn(label: Text('Date',style: TextStyle(color: Colors.white),)),
                            DataColumn(label: Text('Description',style: TextStyle(color: Colors.white),)),
                            DataColumn(label: Text('Voucher No',style: TextStyle(color: Colors.white),)),
                            DataColumn(label: Text('Debit',style: TextStyle(color: Colors.white),)),
                            DataColumn(label: Text('Credit',style: TextStyle(color: Colors.white),)),
                            DataColumn(label: Text('Balance',style: TextStyle(color: Colors.white),)),
                          ], rows:  const [
                          DataRow(cells: [
                            DataCell(SizedBox(
                                height: 50,
                                width: 50,
                                child: Text('8 Nov 2022'))),
                            DataCell(SizedBox(
                                height: 100,
                                width: 120,
                                child: Text('Customer Debit For Invoice No 1019 customer-Adnan Ameen',maxLines: 10,textAlign: TextAlign.center,))),
                            DataCell(Text('91588888')),
                            DataCell(Text('RS: 26000')),
                            DataCell(Text('RS: 0.000')),
                            DataCell(Text('RS: 26000')),
                          ]),
                          DataRow(cells: [
                            DataCell(SizedBox(
                                height: 50,
                                width: 50,
                                child: Text('9 Nov 2022'))),
                            DataCell(SizedBox(
                                height: 100,
                                width: 120,
                                child: Text('Customer Debit For Invoice No 1019 customer-Adnan Ameen',maxLines: 10,textAlign: TextAlign.center,))),
                            DataCell(Text('91588888')),
                            DataCell(Text('RS: 26000')),
                            DataCell(Text('RS: 0.000')),
                            DataCell(Text('RS: 26000')),
                          ]),
                          DataRow(cells: [
                            DataCell(SizedBox(
                                height: 50,
                                width: 50,
                                child: Text('12 Nov 2022'))),
                            DataCell(SizedBox(
                                height: 100,
                                width: 120,
                                child: Text('Customer Debit For Invoice No 1019 customer-Adnan Ameen',maxLines: 10,textAlign: TextAlign.center,))),
                            DataCell(Text('91588888')),
                            DataCell(Text('RS: 0.00')),
                            DataCell(Text('RS: 26000')),
                            DataCell(Text('RS: 26000')),
                          ]),

                          DataRow(cells: [
                            DataCell(SizedBox(
                                height: 50,
                                width: 50,
                                child: Text('8 Nov 2022'))),
                            DataCell(SizedBox(
                                height: 100,
                                width: 120,
                                child: Text('Customer Debit For Invoice No 1019 customer-Adnan Ameen',maxLines: 10,textAlign: TextAlign.center,))),
                            DataCell(Text('91588888')),
                            DataCell(Text('RS: 26000')),
                            DataCell(Text('RS: 0.000')),
                            DataCell(Text('RS: 26000')),
                          ]),
                          DataRow(cells: [
                            DataCell(SizedBox(
                                height: 50,
                                width: 50,
                                child: Text('8 Nov 2022'))),
                            DataCell(SizedBox(
                                height: 100,
                                width: 120,
                                child: Text('Customer Debit For Invoice No 1019 customer-Adnan Ameen',maxLines: 10,textAlign: TextAlign.center,))),
                            DataCell(Text('91588888')),
                            DataCell(Text('RS: 26000')),
                            DataCell(Text('RS: 0.000')),
                            DataCell(Text('RS: 26000')),
                          ]),
                          DataRow(cells: [
                            DataCell(SizedBox(
                                height: 50,
                                width: 50,
                                child: Text('8 Nov 2022'))),
                            DataCell(SizedBox(
                                height: 100,
                                width: 120,
                                child: Text('Customer Debit For Invoice No 1019 customer-Adnan Ameen',maxLines: 10,textAlign: TextAlign.center,))),
                            DataCell(Text('91588888')),
                            DataCell(Text('RS: 26000')),
                            DataCell(Text('RS: 0.000')),
                            DataCell(Text('RS: 26000')),
                          ]),
                          DataRow(cells: [
                            DataCell(SizedBox(
                                height: 50,
                                width: 50,
                                child: Text('8 Nov 2022'))),
                            DataCell(SizedBox(
                                height: 100,
                                width: 120,
                                child: Text('Customer Debit For Invoice No 1019 customer-Adnan Ameen',maxLines: 10,textAlign: TextAlign.center,))),
                            DataCell(Text('91588888')),
                            DataCell(Text('RS: 26000')),
                            DataCell(Text('RS: 0.000')),
                            DataCell(Text('RS: 26000')),
                          ]),
                          DataRow(cells: [
                            DataCell(SizedBox(
                                height: 50,
                                width: 50,
                                child: Text('8 Nov 2022'))),
                            DataCell(SizedBox(
                                height: 100,
                                width: 120,
                                child: Text('Customer Debit For Invoice No 1019 customer-Adnan Ameen',maxLines: 10,textAlign: TextAlign.center,))),
                            DataCell(Text('91588888')),
                            DataCell(Text('RS: 26000')),
                            DataCell(Text('RS: 0.000')),
                            DataCell(Text('RS: 26000')),
                          ]),



                        ],
                        ),
                      ),
                    ]
                ),
              )
          );
        },
      ),
    );
  }
}
