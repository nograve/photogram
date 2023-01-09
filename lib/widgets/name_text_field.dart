import 'package:flutter/material.dart';

class NameTextField extends StatefulWidget {
  const NameTextField({super.key});

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  String? name;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(hintText: 'Name'),
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          return null;
        }
        return 'Please enter your name';
      },
      onSaved: (newValue) {
        setState(() {
          name = newValue;
        });
      },
    );
  }
}
