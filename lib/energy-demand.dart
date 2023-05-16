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
      body: Center(
        child: MyForm(),
      ),
    );
  }
}

class LoadEntry {
  String loadName;
  double powerNeed;
  int quantity;
  double dailyUsage;
  double totalPower = 0;
  double dailyEnergy = 0;

  LoadEntry({
    required this.loadName,
    required this.powerNeed,
    required this.quantity,
    required this.dailyUsage,
  }) {
    totalPower = powerNeed * quantity;
    dailyEnergy = totalPower * dailyUsage;
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  List<LoadEntry> loadEntries = [];
  String currentLoadName = '';
  double currentPowerNeed = 0;
  int currentQuantity = 0;
  double currentDailyUsage = 0;

  void addEntry() {
    setState(() {
      final newEntry = LoadEntry(
        loadName: currentLoadName,
        powerNeed: currentPowerNeed,
        quantity: currentQuantity,
        dailyUsage: currentDailyUsage,
      );
      loadEntries.add(newEntry);
      clearEntry();
    });
  }

  void deleteEntry(int index) {
    setState(() {
      loadEntries.removeAt(index);
    });
  }

  void clearEntry() {
    setState(() {
      currentLoadName = ' ';
      currentPowerNeed = 0;
      currentQuantity = 0;
      currentDailyUsage = 0;
    });
    print("cleared");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Load Name'),
                onChanged: (value) {
                  setState(() {
                    currentLoadName = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Power Need (Watts)'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    currentPowerNeed = double.tryParse(value) ?? 0;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    currentQuantity = int.tryParse(value) ?? 0;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Daily Usage (Hours)'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    currentDailyUsage = double.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (currentDailyUsage != 0) {
                    addEntry();
                    clearEntry();
                  }
                },
                child: Text('Add Entry'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: clearEntry,
                child: Text('Clear Entry'),
              ),
              if (loadEntries.isNotEmpty)
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Previous Entries:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: loadEntries.length,
                        itemBuilder: (context, index) {
                          final entry = loadEntries[index];
                          return ListTile(
                            title: Text(entry.loadName),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Power Need (Watts): ${entry.powerNeed.toStringAsFixed(2)}'),
                                Text('Quantity: ${entry.quantity.toString()}'),
                                Text('Daily Usage (Hours): ${entry.dailyUsage.toStringAsFixed(2)}'),
                                Text('Total Power (Watts): ${entry.totalPower.toStringAsFixed(2)}'),
                                Text('Daily Energy (Watts): ${entry.dailyEnergy.toStringAsFixed(2)}'),
                              ],
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => deleteEntry(index),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Calculate total energy consumed
                          double totalEnergyConsumed = loadEntries.fold(0, (sum, entry) => sum + entry.dailyEnergy);
                          print('Total Energy Consumed: $totalEnergyConsumed');
                        },
                        child: Text('Continue'),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}