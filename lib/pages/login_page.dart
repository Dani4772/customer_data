import 'package:customer_data/pages/dashboard_page.dart';
import 'package:customer_data/providers/all_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets_ui/field_widget.dart';
import 'customer_page.dart';

class LogInPage extends StatelessWidget {
   LogInPage({Key? key}) : super(key: key);
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LogInPageProvider>(create: (context)=>LogInPageProvider(),
    child: Consumer<LogInPageProvider>(
      builder: (context,provider,child){
        return Scaffold(
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 100,top: 100,),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  const Text('B2B Digitize',
                    style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),

                  const SizedBox(
                    height: 200,
                  ),

                  FieldWidget(controller: email,isObscure: false,name: 'Enter Email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),

                  FieldWidget(controller: password,isObscure: true,name:
                  'Enter Password',
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length <6) {
                        return 'Enter minimum 6 digits Password';
                      }
                      return null;
                    },
                  ),



                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) =>  DashBoard()),
                                (Route<dynamic> route) => false,
                          );
                          provider.notifyListeners();
                        }

                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 80),
                      width: 220,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                      child: const Center(child: Text('Log In ',style: TextStyle(color: Colors.white,fontSize: 20),)),
                    ),
                  )

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
