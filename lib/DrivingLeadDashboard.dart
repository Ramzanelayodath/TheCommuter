import 'dart:ui';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:flutter/material.dart';

import 'TripDetails.dart';

class DirivingLeadDashBoard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Pending Ride', style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                    )
                ),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ( _) =>
                            TripDetails()));
              },
              child: Card(
                elevation: 4, // Controls the shadow depth
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                       Row(
                         children: [
                           Text('Sharjah',style: TextStyle(fontSize: 18),),
                           Padding(
                             padding: EdgeInsets.only(left: 5,right: 5),
                             child: Icon(MaterialIcons.arrow_forward,color: Colors.black,),
                           ),
                           Text('Abu Dhabi',style: TextStyle(fontSize: 18)),
                         ],
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 5.0),
                         child: Row(
                           children: [
                            Row(
                              children: [
                                Icon(MaterialIcons.calendar_today,color: Colors.black,size: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text('11/10/23'),
                                )
                              ],
                            ),
                             Padding(
                               padding: const EdgeInsets.only(left: 5.0),
                               child: Row(
                                 children: [
                                   Icon(MaterialIcons.alarm,color: Colors.black,size: 15,),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 5.0),
                                     child: Text('10:00 PM'),
                                   )
                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top: 5),
                         child: Row(
                           children: [
                             Icon(MaterialIcons.people,color: Colors.black,size: 15,),
                             Padding(
                               padding: const EdgeInsets.only(left: 5.0),
                               child: Text('3'),
                             )
                           ],
                         ),
                       )
                    ],
                  ),
                ),
              ),
            )
        ]
            ),
          ),
        ),
      );
  }
}