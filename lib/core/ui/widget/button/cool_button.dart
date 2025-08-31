import 'package:flutter/material.dart';

class CoolButton extends StatelessWidget {
  const CoolButton({super.key, this.label = "Cool Button"});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text(label));
  }
}
