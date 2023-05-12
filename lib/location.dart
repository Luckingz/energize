import 'package:flutter/material.dart';

class LocationRoute extends StatelessWidget {
  const LocationRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'What is your location?'
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Location(),
        ),
      ),
    );
  }
}

// Drop Down Button Class (Continent)
class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  //Initial Selected Value
  String dropdownvalue = 'Abuja';

  // List of items in our dropdown menu
  var items = [
    'Abuja',
    'Kano',
    'Lagos',
    'Abia',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              // Initial Value
              value: dropdownvalue,
              icon: Icon(Icons.keyboard_arrow_down),
              hint: Text('Select Your Location'),
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option, it will
              // change button to the value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}



/* <String>['Abia', 'Adamawa', 'Bauchi', 'Benue', 'Bornu', 'Cross River', 'Delta', 'Edo', 'Gombe', 'Imo', 'Jigawa', 'Kaduna', 'Kano', 'Katsina', 'Kebbi', 'Kogi']
          .map<DropdownMenuItem<String>>((String value) {
 */
