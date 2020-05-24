
import 'package:flutter/material.dart';

InputDecoration textInputDecoration(String label, Icon icon, Color color){

  return InputDecoration(
    hintText: label,
    fillColor: Colors.white70,
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey, width: 1)
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: color,
        width: 3,
      ),
    ),
    prefixIcon: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: IconTheme(data: IconThemeData(color: color), child: icon,),
    ),
  );

}