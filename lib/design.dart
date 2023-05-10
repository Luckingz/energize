import 'package:energize/main.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:collection';
import 'dart:ui';

class EnergizeApp extends StatefulWidget {
  const EnergizeApp({Key? key}) : super(key: key);

  @override
  State<EnergizeApp> createState() => _EnergizeAppState();
}

class _EnergizeAppState extends State<EnergizeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Solar Energy System Designer'),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Choose your design type:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          color: Colors.blueAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ListTile(
                                  title: Text("On grid Solar System",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: Text(
                                      "- Design a Solar PV system that can be "
                                          "connected to the grid",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                    ),
                                  ),
                                ),
                                Image.asset('assets/grid.png',
                                  fit: BoxFit.cover,
                                ),
                                 ElevatedButton(
                                    onPressed: null,
                                      child: Text("Get Started",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )
                      ]
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
              ),
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
