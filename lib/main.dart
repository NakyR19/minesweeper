import 'package:flutter/material.dart';
import '../src/app_module.dart';
import 'package:provider/provider.dart';
import '../src/models/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeChanger(),
      child: const MineSweeperApp(),
    ),
  );
}
