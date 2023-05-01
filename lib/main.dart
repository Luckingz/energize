import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:collection';

void main() => runApp(MaterialApp(
  home: EnergizeApp(),
));

class EnergizeApp extends StatefulWidget {
  const EnergizeApp({Key? key}) : super(key: key);

  @override
  State<EnergizeApp> createState() => _EnergizeAppState();
}

class _EnergizeAppState extends State<EnergizeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Solar Energy Designer'),
        centerTitle: true,
        elevation: 0.0,

      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select your Solar Installation design',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                GFCard(
                  boxFit: BoxFit.scaleDown,
                  imageOverlay: AssetImage('assets/grid.png'),
                  //image: Image.asset('assets/grid.png'),
                  //showImage: true,
                  titlePosition: GFPosition.start,
                  showOverlayImage: true,
                  color: Colors.blueAccent,
                  title: GFListTile(
                    avatar: GFAvatar(
                      //backgroundImage: AssetImage('assets/grid.png'),
                      //radius: 60.0,
                      size: 8.0,
                    ),
                    title: Text(
                        'On Grid Solar Design',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white
                      ),
                    ),
                    //subTitle: Text('Design a Solar PV system that can be connected to the grid'),
                  ),
                  //content: Text('GF Cards has three types of cards bla bla blah'),
                  buttonBar: GFButtonBar(
                    alignment: WrapAlignment.center,
                    children: [
                      GFButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SecondRoute())
                          );
                        },
                        text: 'Get Started',
                        textStyle: TextStyle(
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
        Column(
          children: [
            GFCard(
            boxFit: BoxFit.scaleDown,
            imageOverlay: AssetImage('assets/off-grid.png'),
            //image: Image.asset('assets/grid.png'),
            //showImage: true,
            titlePosition: GFPosition.start,
            showOverlayImage: true,
            color: Colors.blueAccent,
            title: GFListTile(
              avatar: GFAvatar(
                //backgroundImage: AssetImage('assets/grid.png'),
                //radius: 60.0,
                size: 8.0,
              ),
              title: Text(
                'Off Grid Solar Design',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.white
                ),
              ),
              //subTitle: Text('Design a Solar PV system that can be connected to the grid'),
            ),
            //content: Text('GF Cards has three types of cards bla bla blah'),
            buttonBar: GFButtonBar(
                alignment: WrapAlignment.center,
                children: [
                GFButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SecondRoute())
                  );
                },
            text: 'Get Started',
            textStyle: TextStyle(
            )
      ),
                ]
            ),
            ),
          ],
        ),
            GFCard(
                boxFit: BoxFit.scaleDown,
                imageOverlay: AssetImage('assets/hybrid.png'),
                //image: Image.asset('assets/grid.png'),
                //showImage: true,
                titlePosition: GFPosition.start,
                showOverlayImage: true,
                color: Colors.blueAccent,
                title: GFListTile(
                  avatar: GFAvatar(
                    //backgroundImage: AssetImage('assets/grid.png'),
                    //radius: 60.0,
                    size: 8.0,
                  ),
                  title: Text(
                    'Hybrid Solar Design',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white
                    ),
                  ),
                  //subTitle: Text('Design a Solar PV system that can be connected to the grid'),
                ),
                //content: Text('GF Cards has three types of cards bla bla blah'),
                buttonBar: GFButtonBar(
                    alignment: WrapAlignment.center,
                    children: [
                      GFButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SecondRoute())
                            );
                          },
                          text: 'Get Started',
                          textStyle: TextStyle(
                          )
                      ),
                    ]
                ),
              ),
          ]
        )
      )
    );
  }
}

// 2nd Route

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'What is your location?',
                style: TextStyle(),
        ),
        //shape: ,
      ),
      body: Center(
        child:
          Location(
        /*ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back'),*/
        ),
      ),
    );
  }
}


// 2nd Route: Location

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: _title,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: const Center(
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



