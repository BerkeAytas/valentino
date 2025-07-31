import 'package:flutter/material.dart';
import 'package:valentino/src/custimaze_tooltip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custimaze Tooltip Example',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const TooltipDemoPage(),
    );
  }
}

class TooltipDemoPage extends StatelessWidget {
  const TooltipDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tooltip Demo')),
      body: Center(
        child: CustimazeTooltip(
          context: context,
          title: 'This is a customizable tooltip.',
          widgetBool: false,
        ),
      ),
    );
  }
}
