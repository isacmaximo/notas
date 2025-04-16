import 'package:flutter/material.dart';
import 'package:notas/app.dart';
import 'package:notas/core/dependencies/dependencies.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: providers, child: App()));
}
