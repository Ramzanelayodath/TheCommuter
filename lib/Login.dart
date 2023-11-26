import 'dart:ui';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/material.dart';

import 'DrivingLeadDashboard.dart';
import 'EmployeeDashboard.dart';

class Login extends StatelessWidget {
  TextEditingController ctrlUsername = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 75.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                      child: Text('Let\'s\nCommute',style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold),)),
                ),
                const Align(
                  alignment :Alignment.topLeft,
                  child: Text(
                    'Username',
                    style: TextStyle(color: Colors.black,fontSize: 15),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextField(
                    controller: ctrlUsername,
                     ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child:  Align(
                    alignment :Alignment.topLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: TextField(
                    obscureText: true, // Set keyboard type to number
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Align(
                    alignment: Alignment.topRight,
                      child: InkWell(
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Icon(MaterialIcons.arrow_forward,color: Colors.white,),
                        ),
                        onTap: (){
                          if(ctrlUsername.text.toString() == "Employee") {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EmployeeDashboard()),
                          );
                          }else if(ctrlUsername.text.toString() == "Driver Lead"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DirivingLeadDashBoard()),
                            );
                          }
                        },
                      )
                    ),
                  ),
                // Other widgets can be added here within the Column
              ],
            ),
          ),
        ),
      ),
    );

  }
}