import 'package:flutter/material.dart';

class WidgetConstructor extends StatefulWidget {
  const WidgetConstructor({super.key});

  @override
  State<WidgetConstructor> createState() => _WidgetConstructorState();

  static Widget textFormField({
    String? key,
    required String labelText,
    required String hintText,
    required TextEditingController controller,
    bool enabled = true,
  }) {
    return TextFormField(
      key: key == null ? null : GlobalKey<FormFieldState<String>>(),
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }

  static Widget dropdown({
    required String labelText,
    required List<dynamic> items,
    Future<List<DropdownMenuEntry>>? getItems,
  }) {
    if (getItems == null) {
      return DropdownMenu(
        expandedInsets: const EdgeInsets.all(0),
        initialSelection: items.first,
        label: Text(labelText),
        dropdownMenuEntries:
            items
                .map((item) => DropdownMenuEntry(value: item, label: item))
                .toList(),
      );
    } else {
      return FutureBuilder(
        future: getItems,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Error loading items');
          } else if (snapshot.hasData) {
            return DropdownMenu(
              expandedInsets: const EdgeInsets.all(0),
              initialSelection: snapshot.data!.first,
              label: Text(labelText),
              dropdownMenuEntries: snapshot.data!,
            );
          } else {
            return const Text('No items found');
          }
        },
      );
    }
  }

  static Future<List<DropdownMenuEntry>> getItems() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      DropdownMenuEntry(value: 'Item 1', label: 'Item 1'),
      DropdownMenuEntry(value: 'Item 2', label: 'Item 2'),
      DropdownMenuEntry(value: 'Item 3', label: 'Item 3'),
    ];
  }
}

class _WidgetConstructorState extends State<WidgetConstructor> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
