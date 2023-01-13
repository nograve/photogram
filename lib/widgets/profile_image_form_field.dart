import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProfileImageFormField extends StatefulWidget {
  const ProfileImageFormField({super.key});

  @override
  State<ProfileImageFormField> createState() => _ProfileImageFormFieldState();
}

class _ProfileImageFormFieldState extends State<ProfileImageFormField> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return FormField<File>(
      validator: (value) {
        if (value != null) {
          return null;
        }
        return 'Please select an image';
      },
      builder: (field) {
        return GestureDetector(
          onTap: () {
            FilePicker.platform.pickFiles(type: FileType.image).then((value) {
              if (value != null) {
                setState(() {
                  _image = File(value.files.first.path!);
                });
                field.didChange(_image);
              }
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: (_image != null
                        ? FileImage(_image!)
                        : const NetworkImage('https://i.pravatar.cc/300'))
                    as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
