import 'dart:convert';

import 'package:customer_data/models/login_page_model.dart';
import 'package:customer_data/pages/dashboard_page.dart';
import 'package:customer_data/providers/all_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../local_service/local_service.dart';
import '../services/api_service.dart';
import '../widgets_ui/field_widget.dart';
import 'customer_page.dart';

class LogInPage extends StatelessWidget {
   LogInPage({Key? key}) : super(key: key);
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int index=1;
   static const baseUrl = 'http://raheemagency.b2bdigitize.com';

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

                  FieldWidget(controller: password,isObscure: false,name:
                  'Enter Password',
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length <6) {
                        return 'Enter minimum 6 digits Password';
                      }
                      return null;
                    },
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        print('hhhh');


                      final response=
                      await Dio().get('$baseUrl/api?email=${email.text}&password=${password.text}');
                        print('response: ${response.data}');
                        final jsonData = jsonDecode(response.data);
                        print("message:${jsonData['response']['message']}");
                        if(jsonData['response']['message'] == 'Successfully login') {
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashBoard()),
                                (Route<dynamic> route) => false,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Log In Successfully'),
                            ),
                          );
                        }
                        else{
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Wrong email or Password'),
                            ),
                          );
                        }
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


