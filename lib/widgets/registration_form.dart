import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../services/firebase_service.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final FirebaseService _firebaseService =
      GetIt.instance.get<FirebaseService>();
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  File? _image;
  String? _name;
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormField<File>(
              validator: (value) {
                if (value != null) {
                  return null;
                }
                return 'Please select an image';
              },
              builder: (field) {
                return GestureDetector(
                  onTap: () {
                    FilePicker.platform
                        .pickFiles(type: FileType.image)
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          _image = File(value.files.first.path!);
                        });
                        field.didChange(_image);
                      }
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: (_image != null
                                    ? FileImage(_image!)
                                    : const NetworkImage(
                                        'https://i.pravatar.cc/300'))
                                as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        field.errorText ?? '',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name'),
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                }
                return 'Please enter your name';
              },
              onSaved: (newValue) {
                setState(() {
                  _name = newValue;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
              onSaved: (newValue) {
                setState(() {
                  _email = newValue;
                });
              },
              validator: (value) {
                if (value != null &&
                    value.contains(RegExp(
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"))) {
                  return null;
                }
                return 'Please enter a valid email';
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
              onSaved: (newValue) {
                setState(() {
                  _password = newValue;
                });
              },
              validator: (value) {
                if (value != null && value.length > 6) {
                  return null;
                }
                return 'Please enter a password greater than 6 characters';
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(
                    MediaQuery.of(context).size.width * 0.5,
                    MediaQuery.of(context).size.height * 0.06,
                  ),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () async {
                if (_registerFormKey.currentState!.validate()) {
                  _registerFormKey.currentState!.save();
                  final bool result = await _firebaseService.registerUser(
                    name: _name!,
                    email: _email!,
                    password: _password!,
                    image: _image!,
                  );
                  if (result) Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
