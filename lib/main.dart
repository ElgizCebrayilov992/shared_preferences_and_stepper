import 'package:flutter/material.dart';

import 'core/preferences/shared_manager.dart';
import 'core/theme.dart';
import 'customer_stepper/customer_stepper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedManager.inistance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: CustomerStepper(),
    );
  }
}
