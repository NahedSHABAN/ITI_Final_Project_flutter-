import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String initialValue; 
  final Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _controller;
  late bool isEmail;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    isEmail = widget.labelText == "Email";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 50.h,
        child: TextFormField(
          controller: _controller,
          onChanged: widget.onChanged,
          enabled: !isEmail, // Disable if labelText is "Email"
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
