import 'package:flutter/material.dart';

class CityInput extends StatelessWidget {
  const CityInput({
    Key? key,
    required this.onSubmitted,
  }) : super(key: key);

  final Function(String inputValue) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: TextField(
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          hintText: 'Enter City Name',
        ),
        
        
      ),
    );
  }
}