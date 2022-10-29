// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class CustomTextField extends StatefulWidget {
  final TextEditingController? theController;
  final List<TextInputFormatter>? theFormater;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final String hint;
  bool visbleText;
  CustomTextField(
      {super.key,
      this.validator,
      required this.hint,
      required this.visbleText,
      required this.inputType,
      this.theController,
      this.theFormater});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  IconData usedIcon = Icons.remove_red_eye;
  late bool securetext = widget.visbleText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      inputFormatters: widget.theFormater,
      controller: widget.theController,
      textInputAction: TextInputAction.next,
      keyboardType: widget.inputType,
      obscureText: securetext,
      decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.red),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 113, 143, 224), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 113, 143, 224), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: widget.visbleText
              ? IconButton(
                  color: const Color.fromARGB(255, 113, 143, 224),
                  onPressed: () {
                    setState(() {
                      securetext = !securetext;
                    });
                    securetext
                        ? usedIcon = Icons.visibility
                        : usedIcon = Icons.visibility_off;
                  },
                  icon: Icon(usedIcon))
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 113, 143, 224), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 113, 143, 224), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: widget.hint),
    );
  }
}
