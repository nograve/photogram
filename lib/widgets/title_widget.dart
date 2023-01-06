import 'package:flutter/cupertino.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Photogram',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
