import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({super.key});

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FilePicker.platform.pickFiles(type: FileType.image).then((value) {
          if (value != null) {
            setState(() {
              _image = File(value.files.first.path!);
            });
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
  }
}
