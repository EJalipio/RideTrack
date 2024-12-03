import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final double width;
  final String? label;

  const CustomField({
    Key? key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.width = double.infinity,
    this.label,
  }) : super(key: key);

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.label!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        SizedBox(height: widget.label != null ? 8 : 0),
        SizedBox(
          width: widget.width,
          child: TextField(
            controller: widget.controller,
            obscureText: widget.isPassword && !_showPassword,
            decoration: InputDecoration(
              hintText: widget.hint,
              filled: true,
              fillColor: const Color.fromRGBO(255, 255, 255, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.orange, width: 1.5),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black45,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    )
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
          ),
        ),
      ],
    );
  }
}