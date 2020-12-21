import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Controlers/SignIn.dart';
import 'package:food_app/screen/BottomNavBar.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
//  final _formBuilder = GlobalKey<FormBuilderState>();
  final SignInControler c = Get.put(SignInControler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Sign In',
                style:
                    GoogleFonts.exo(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgotten Password ?',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 200,
                  width: 400,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Email'),
                            onChanged: (value) {
                              c.email.value = value;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                            onChanged: (value) {
                              c.password.value = value;
                            },
                          ),
                        ),
                        // FormBuilder(
                        //   child: Column(
                        //children: [

                        // Container(
                        //   padding: EdgeInsets.all(4),
                        //   margin: EdgeInsets.only(left: 20, right: 20),
                        //   child: FormBuilderTextField(
                        //     name: 'Email',
                        //     decoration: InputDecoration(
                        //       hintText: 'Email',
                        //     ),
                        //     validator: FormBuilderValidators.compose([
                        //       FormBuilderValidators.required(context),
                        //       FormBuilderValidators.email(context),
                        //     ]),
                        //     onChanged: (value) {
                        //       c.email.value = value;
                        //     },
                        //   ),
                        // ),
                        // Container(
                        //   padding: EdgeInsets.all(4),
                        //   margin: EdgeInsets.only(left: 20, right: 20),
                        //   child: FormBuilderTextField(
                        //     name: 'Password',
                        //     decoration: InputDecoration(
                        //       hintText: 'Password',
                        //     ),
                        //     validator: FormBuilderValidators.compose([
                        //       FormBuilderValidators.required(context),
                        //     ]),
                        //     onChanged: (value) {
                        //       c.password.value = value;
                        //     },
                        //   ),
                        // )
                        // ],
                        //))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => RaisedButton(
                  color: Colors.blue,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: 250,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: c.isLoading == false
                        ? Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        : Container(
                            child: Center(
                            child: CircularProgressIndicator(
                              //strokeWidth: 4,
                              backgroundColor: Colors.orange,
                            ),
                          )),
                  ),
                  onPressed: () {
                    c.isPresent();
                  }),
            ),
            Container(
                margin: EdgeInsets.all(25),
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an Account? '),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Sign Up ',
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
