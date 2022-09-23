import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Container(
        constraints: const BoxConstraints(minWidth: 60),
        alignment: Alignment.center,
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xFF233954),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Text(
          ' $buttonText ',
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}