import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeDashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return state();
  }

}


class state extends State<EmployeeDashboard> {
  TextEditingController ctrlCar = TextEditingController();
  TextEditingController ctrlDate = TextEditingController();
  TextEditingController ctrlTime = TextEditingController();
  TextEditingController ctrlEndDate = TextEditingController();
  TextEditingController ctrlEndTime = TextEditingController();
  TextEditingController ctrlTripStart = TextEditingController();
  TextEditingController ctrlTripEnd = TextEditingController();
  String selectedOption = "One Way";
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(elevation: 0, backgroundColor: Colors.white,),
        body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Book\nYour Ride', style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                        )
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Choose Car',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        child: TextField(
                          autofocus: false,
                          enabled: false,
                          controller: ctrlCar,
                        ),
                        onTap: () {
                          _showCarListDialog(context, ctrlCar);
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Number of Travellers',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Mode Of Travel',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                    RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('One way'),
                      value: 'One way',
                      groupValue: selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Round Trip'),
                      value: 'Round Trip',
                      groupValue: selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Commencement of the journey',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        child: TextField(
                          autofocus: false,
                          enabled: false,
                          controller: ctrlTripStart,
                        ),
                        onTap: () {
                          _showPlaceListDialog(context, ctrlTripStart);
                        },
                      ),
                    ),
                    Visibility(
                      visible: selectedOption == "Round Trip",
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 35),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Conclusion of the journey',
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: InkWell(
                              child: TextField(
                                autofocus: false,
                                enabled: false,
                                controller: ctrlTripEnd,
                              ),
                              onTap: () {
                                _showPlaceListDialog(context, ctrlTripEnd);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex :1,
                          child: Container(
                            width : double.infinity,
                            child: Column(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 35),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Choose Start Date',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15),
                                        ))),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: InkWell(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder( // Set border appearance
                                          borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                                        )
                                      ),
                                      enabled: false,
                                      autofocus: false,
                                      controller: ctrlDate,
                                    ),
                                    onTap: () {
                                      _selectDate(context, ctrlDate);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                       Expanded(
                         flex: 1,
                         child: Padding(
                           padding: const EdgeInsets.only(left: 8.0),
                           child: Container(
                             width : double.infinity,
                             child:  Column(
                               children: [
                                 const Padding(
                                     padding: EdgeInsets.only(top: 35),
                                     child: Align(
                                         alignment: Alignment.topLeft,
                                         child: Text(
                                           'Choose Start Time',
                                           style: TextStyle(
                                               color: Colors.black, fontSize: 15),
                                         ))),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 10),
                                   child: InkWell(
                                     child: TextField(
                                       enabled: false,
                                       autofocus: false,
                                       decoration: InputDecoration(
                                           border: OutlineInputBorder( // Set border appearance
                                             borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                                           )
                                       ),
                                       controller: ctrlTime,
                                     ),
                                     onTap: () {
                                       _selectTime(context, ctrlTime);
                                     },
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                       )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Visibility(
                         visible: selectedOption == "Round Trip" ,
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Expanded(
                               flex :1,
                               child: Container(
                                 width : double.infinity,
                                 child: Column(
                                   children: [
                                     const Padding(
                                         padding: EdgeInsets.only(top: 35),
                                         child: Align(
                                             alignment: Alignment.topLeft,
                                             child: Text(
                                               'Choose End Date',
                                               style: TextStyle(
                                                   color: Colors.black, fontSize: 15),
                                             ))),
                                     Padding(
                                       padding: const EdgeInsets.only(top: 10),
                                       child: InkWell(
                                         child: TextField(
                                           decoration: InputDecoration(
                                               border: OutlineInputBorder( // Set border appearance
                                                 borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                                               )
                                           ),
                                           enabled: false,
                                           autofocus: false,
                                           controller: ctrlEndDate,
                                         ),
                                         onTap: () {
                                           _selectDate(context, ctrlEndDate);
                                         },
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                             Expanded(
                               flex: 1,
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 8.0),
                                 child: Container(
                                   width : double.infinity,
                                   child:  Column(
                                     children: [
                                       const Padding(
                                           padding: EdgeInsets.only(top: 35),
                                           child: Align(
                                               alignment: Alignment.topLeft,
                                               child: Text(
                                                 'Choose End Time',
                                                 style: TextStyle(
                                                     color: Colors.black, fontSize: 15),
                                               ))),
                                       Padding(
                                         padding: const EdgeInsets.only(top: 10),
                                         child: InkWell(
                                           child: TextField(
                                             decoration: InputDecoration(
                                                 border: OutlineInputBorder( // Set border appearance
                                                   borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                                                 )
                                             ),
                                             enabled: false,
                                             autofocus: false,
                                             controller: ctrlEndTime,
                                           ),
                                           onTap: () {
                                             _selectTime(context, ctrlEndTime);
                                           },
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             )
                           ],
                         ),
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
            )));
  }


  void _showCarListDialog(BuildContext context,
      TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a Car'),
          content: Container(
            width: double.minPositive,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text('Toyota'),
                  onTap: () {
                    controller.text = "Toyota";
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Honda'),
                  onTap: () {
                    controller.text = "Honda";
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Innova'),
                  onTap: () {
                    controller.text = "Innova";
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Brezza'),
                  onTap: () {
                    controller.text = "Brezza";
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

  Future<void> _selectDate(BuildContext context,TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        controller.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }
  Future<void> _selectTime(BuildContext context,TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null ) {
      setState(() {
        selectedTime = pickedTime;
        controller.text = selectedTime.format(context);
      });
    }
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

  void _showPlaceListDialog(BuildContext context,
      TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a Place'),
          content: Container(
            width: double.minPositive,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text('Abu Dhabi'),
                  onTap: () {
                    controller.text = "Abu Dhabi";
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Sharjah'),
                  onTap: () {
                    controller.text = "Sharjah";
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Ras Al Khaimah'),
                  onTap: () {
                    controller.text = "Ras Al Khaimah";
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Fujairah'),
                  onTap: () {
                    controller.text = "Fujairah";
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
}

