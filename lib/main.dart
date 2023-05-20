import 'package:energize/entries.dart';
import 'package:flutter/material.dart';
import 'design.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'boxes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(EntriesAdapter());
  boxEntries = await Hive.openBox<Entries>('entriesBox');
  runApp(MaterialApp(
      home: EnergizeApp()
  )
  );
}



