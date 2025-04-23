import 'package:flutter/material.dart';
import 'package:my_flutter_guide/widget_constructor.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List dataCRUD = [
    WidgetConstructor.textFormField(
      // key: GlobalKey<FormFieldState<String>>(),
      labelText: 'Name',
      hintText: 'Enter your name',
      controller: TextEditingController(),
    ),
    WidgetConstructor.textFormField(
      labelText: 'Email',
      hintText: 'Enter your email',
      // enabled: Key('textFormField1').controller.text.isNotEmpty,
      controller: TextEditingController(),
    ),
    WidgetConstructor.dropdown(
      labelText: 'Password',
      items: [],
      getItems: WidgetConstructor.getItems(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            const Text(
              'CRUD',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            ...dataCRUD,
          ],
        ),
      ),
    );
  }
}
