import 'package:flutter/material.dart';

class EnergyDemand extends StatefulWidget {
  const EnergyDemand({Key? key}) : super(key: key);

  @override
  State<EnergyDemand> createState() => _EnergyDemandState();
}

class _EnergyDemandState extends State<EnergyDemand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caculate your Energy Usage'),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(),
      ),
    );
  }
}
