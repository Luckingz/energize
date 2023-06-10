import 'package:flutter/material.dart';
import 'energy_demand.dart';

int? systemVoltage;
bool recommendedVoltageSelected = false;
bool radioButtonsEnabled = true;

const double inverterEfficiency = 0.9;  // Inverter Efficiency
const double depthOfDischarge = 0.3;    // Depth of Discharge of the Battery @ 30%
final double energyDemand = totalEnergyConsumed / inverterEfficiency; //Energy demand
final double batteryEnergyCapacity = energyDemand / depthOfDischarge;  // Battery Energy Capacity


class BatterySize extends StatefulWidget {
  const BatterySize({Key? key}) : super(key: key);

  @override
  State<BatterySize> createState() => _BatterySizeState();
}

class _BatterySizeState extends State<BatterySize> {

  void selectRecommendedVoltage() {
    setState(() {
      recommendedVoltageSelected = true;
      radioButtonsEnabled = false;

      if (totalEnergyConsumed <= 4000) {
        systemVoltage = 12;
      } else if (totalEnergyConsumed < 6000) {
        systemVoltage = 24;
      } else if (totalEnergyConsumed < 8000) {
        systemVoltage = 48;
      } else {
        systemVoltage = 60;
      }
    });
  }

  void selectRadioButton(int? value) {
    setState(() {
      recommendedVoltageSelected = false;
      radioButtonsEnabled = true;
      systemVoltage = value;
    });
  }

  void resetSelection() {
    setState(() {
      recommendedVoltageSelected = false;
      radioButtonsEnabled = true;
      systemVoltage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select your System Voltage"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                Text("Total Energy Consumed: $totalEnergyConsumed, "
                    "Energy Demand: $energyDemand, "
                    "Battery Energy Capacity: $batteryEnergyCapacity, "
                    "Depth of Discharge: $depthOfDischarge"),
                Text('Don\'t know what the System Voltage is?'),
                ElevatedButton(
                  onPressed: selectRecommendedVoltage,
                  child: Text('Choose a Recommended Voltage'),
                ),
                SizedBox(height: 16.0),
                Text("OR"),
                SizedBox(height: 16.0),
                Text("Choose from the options below:"),
                SizedBox(height: 8.0),
                RadioListTile(
                  title: Text('12V'),
                  subtitle: Text('Suitable for small-scale systems and portable setups.'),
                  value: 12,
                  groupValue: systemVoltage,
                  onChanged: radioButtonsEnabled ? selectRadioButton : null,
                ),
                RadioListTile(
                  title: Text('24V'),
                  subtitle: Text('Commonly used in medium-sized off-grid systems.'),
                  value: 24,
                  groupValue: systemVoltage,
                  onChanged: radioButtonsEnabled ? selectRadioButton : null,
                ),
                RadioListTile(
                  title: Text('48V'),
                  subtitle: Text('Ideal for larger off-grid installations with longer cable runs.'),
                  value: 48,
                  groupValue: systemVoltage,
                  onChanged: radioButtonsEnabled ? selectRadioButton : null,
                ),
                RadioListTile(
                  title: Text('60V'),
                  subtitle: Text('Used in commercial or industrial off-grid systems with high power requirements.'),
                  value: 60,
                  groupValue: systemVoltage,
                  onChanged: radioButtonsEnabled ? selectRadioButton : null,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: resetSelection,
                  child: Text('Reset'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (systemVoltage != null) {
                      // Save the selected systemVoltage to be used in other parts of your application
                      print('Selected voltage: $systemVoltage');
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Battery Rating
final double batteryCapacity = batteryEnergyCapacity / (systemVoltage?.toDouble() ?? 0.0);
//final double batteryCapacity = batteryEnergyCapacity / systemVoltage;
