import 'package:flutter/material.dart';

import 'package:photogram/widgets/name_text_field.dart';
import 'package:photogram/widgets/profile_image_form_field.dart';

class RegistrationForm extends StatelessWidget {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Form(
        key: registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ProfileImageFormField(),
            NameTextField(),
          ],
        ),
      ),
    );
  }
}
