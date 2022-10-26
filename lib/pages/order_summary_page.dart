import 'package:customer_data/widgets_ui/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/all_screen.dart';

// ignore: must_be_immutable
class OrderSummaryPage extends StatelessWidget {
   OrderSummaryPage({Key? key}) : super(key: key);

  String _selectedDate = 'October 12,2019';

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<OrderSummaryProvider>(create: (context)=>OrderSummaryProvider(),
      child: Consumer<OrderSummaryProvider>(
        builder: (context,provider,child){
          return Scaffold(
            appBar: AppBar(title: const Text('Order Summary'),),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(top: 30, bottom: 30,left: 15,right: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                              _selectedDate,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white,fontSize: 18)
                          ),
                          IconButton(
                            icon: const Icon(Icons.calendar_today),
                            tooltip: 'Tap to open date picker',
                            onPressed: () async {
                            DateTime? d= await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2101),
                              );
                            if(d !=null){
                              _selectedDate= DateFormat.yMMMMd("en_US").format(d);
                            }

                              provider.notifyListeners();

                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Employee Name',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                        Container(
                          height: 90,
                          margin: const EdgeInsets.only(left: 5),
                          width: MediaQuery.of(context).size.width/2,

                           child: DropDownWidget(optionName: 'Select Name',clr: true,)
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(Colors.pink),
                      dataRowHeight: 80,
                      columnSpacing: 40,

                      columns: const [
                      DataColumn(label: Text('Kpi Name',style: TextStyle(color: Colors.white),)),
                      DataColumn(label: Text('Target',style: TextStyle(color: Colors.white),)),
                      DataColumn(label: Text('Actual',style: TextStyle(color: Colors.white),)),
                      DataColumn(label: Text('Percentage',style: TextStyle(color: Colors.white),)),
                    ], rows: const [
                      DataRow(cells: [
                        DataCell(Text('Total Visits')),
                        DataCell(Text('_')),
                        DataCell(Text('_')),
                        DataCell(Text('_')),
                    ]),
                      DataRow(cells: [
                        DataCell(Text('Productive')),
                        DataCell(Text('_')),
                        DataCell(Text('_')),
                        DataCell(Text('_')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Follow_Up')),
                        DataCell(Text('_')),
                        DataCell(Text('_')),
                        DataCell(Text('_')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Lines Per Bill')),
                        DataCell(Text('_')),
                        DataCell(Text('_')),
                        DataCell(Text('_')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Total Value')),
                        DataCell(Text('_')),
                        DataCell(Text('_')),
                        DataCell(Text('_')),
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
