import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final TextInputType type;
  final TextEditingController controller;
  final dynamic func;
  final dynamic validator;

  const CustomTextField({Key? key, required this.hintText, required this.type, required this.controller, required this.obsecureText, this.func, required this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: TextFormField(
          obscureText: obsecureText,
          decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Color.fromARGB(255, 127, 130, 133)),
                borderRadius: BorderRadius.circular(15),
              )),
          keyboardType: type,
          controller: controller,
          validator: validator,
          onChanged: (controller) {
            func;
          },
        ),
      ),
    );
  }
}
