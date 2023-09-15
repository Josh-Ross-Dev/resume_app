import 'package:flutter/material.dart';
import 'package:flutter_projects/util/input_box_decoration.dart';

class InputBox extends StatefulWidget {
  const InputBox({
    super.key,
    this.isLast = false,
    this.isFirst = false,
    this.isOnly = false,
    required this.controller,
    this.labelText,
    this.suffixIcon,
  });

  final bool isLast;
  final bool isFirst;
  final bool isOnly;
  final TextEditingController controller;
  final String? labelText;
  final Widget? suffixIcon;

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
      decoration: InputBoxDecoration(
          isFirst: widget.isFirst,
          isLast: widget.isLast,
          isOnly: widget.isOnly),
      child: Padding(
          padding: const EdgeInsets.only(
              left: 12, right: 12, bottom: 7.0, top: 10.0),
           child: TextFormField(
           controller: widget.controller,
           onChanged: (newValue){},
           cursorColor: Colors.black,
           decoration: InputDecoration(
             labelText: widget.labelText,
             suffixIcon: widget.suffixIcon,
             border: InputBorder.none,
             errorStyle: const TextStyle(height: 0),
             floatingLabelStyle: const TextStyle(
               fontSize: 12.0,
               color: Colors.black
             ),
             contentPadding: const EdgeInsets.fromLTRB(0, 4.0, 0, 0),
           ),
             validator: (value){
                if(value != null || value!.isNotEmpty){
                  return '';
                }else{
                  return '';
                }
             },
      ),
      ),
    );
  }
}
