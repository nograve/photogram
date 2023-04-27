import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:photogram/services/firebase_service.dart';
import 'package:photogram/widgets/email_form_field.dart';
import 'package:photogram/widgets/password_form_field.dart';

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
                                    'https://i.pravatar.cc/300',
                                  )) as ImageProvider,
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
            EmailFormField(
              onEmailSaved: (newEmail) {
                setState(() {
                  _email = newEmail;
                });
              },
            ),
            PasswordFormField(
              onPasswordSaved: (newPassword) {
                setState(() {
                  _password = newPassword;
                });
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
              onPressed: () async {
                if (_registerFormKey.currentState!.validate()) {
                  _registerFormKey.currentState!.save();
                  final result = await _firebaseService.registerUser(
                    name: _name!,
                    email: _email!,
                    password: _password!,
                    image: _image!,
                  );
                  if (context.mounted && result == null) {
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
