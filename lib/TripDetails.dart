import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TripDetails extends StatelessWidget{
  TextEditingController ctrlDriver = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         elevation: 0,
         backgroundColor: Colors.white,
       ),
       backgroundColor: Colors.white,
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             Row(
               children: const [
                 Text('Sharjah',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                 Padding(
                   padding: EdgeInsets.only(left: 5,right: 5),
                   child: Icon(MaterialIcons.arrow_forward,color: Colors.black,),
                 ),
                 Text('Abu Dhabi',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
               ],
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8.0),
               child: Row(
                 children: [
                   Row(
                     children: const [
                       Icon(MaterialIcons.calendar_today,color: Colors.black,size: 15,),
                       Padding(
                         padding: EdgeInsets.only(left: 5.0),
                         child: Text('11/10/23'),
                       )
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 5.0),
                     child: Row(
                       children: const [
                         Icon(MaterialIcons.alarm,color: Colors.black,size: 15,),
                         Padding(
                           padding: EdgeInsets.only(left: 5.0),
                           child: Text('10:00 PM'),
                         )
                       ],
                     ),
                   )
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8),
               child: Row(
                 children: const [
                   Icon(MaterialIcons.people,color: Colors.black,size: 15,),
                   Padding(
                     padding: EdgeInsets.only(left: 5.0),
                     child: Text('3'),
                   )
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8),
               child: Row(
                 children: const [
                   Icon(FontAwesome5Solid.car,color: Colors.black,size: 15,),
                   Padding(
                     padding: EdgeInsets.only(left: 5.0),
                     child: Text('Toyota'),
                   )
                 ],
               ),
             ),
             const Padding(
               padding: EdgeInsets.only(top: 15),
               child: Align(
                 alignment:Alignment.topLeft,
                 child: Text('Assign to driver:',style: TextStyle(fontWeight: FontWeight.bold),),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 8),
               child: InkWell(
                 child: TextField(
                   decoration: InputDecoration(
                       border: OutlineInputBorder( // Set border appearance
                         borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                       )
                   ),
                   enabled: false,
                   autofocus: false,
                   controller: ctrlDriver,
                 ),
                 onTap: () {
                   _showDriverListDialog(context, ctrlDriver);
                 },
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 15,bottom: 15),
               child:InkWell(
                 onTap: (){
                   _showAlertDialog(context);
                 },
                 child: Container(
                   width: 275,
                   height: 75,
                   decoration: BoxDecoration(
                     color: Colors.black,
                     borderRadius: BorderRadius.circular(15.0),
                   ),
                   child: const Center(
                     child: Text(
                       'Submit',
                       style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.normal,
                         fontSize: 18,
                       ),
                     ),
                   ),
                 ),
               ) ,
             )
           ],
         ),
       ),
     );
  }

  void _showDriverListDialog(BuildContext context,
      TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a Driver'),
          content: SizedBox(
            width: double.minPositive,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text('Driver 1'),
                  onTap: () {
                    controller.text = "Driver 1";
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Driver 2'),
                  onTap: () {
                    controller.text = "Driver 2";
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Driver 3'),
                  onTap: () {
                    controller.text = "Driver 3";
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Driver 4'),
                  onTap: () {
                    controller.text = "Driver 4";
                    Navigator.pop(context);
                  },
                ),
                // Add more ListTiles for additional items as needed
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('SUCCESS'),
          content: const Text('Your request has been submitted'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}