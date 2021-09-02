import 'package:flutter/material.dart';

const Color kAccentColor = Color(0xFFA33A23);
const Color kPrimaryColor = Color(0xFF212121);
const Color kSecondaryColor = Color(0xFF323232);
const Color kTextColor = Colors.white;

const TextStyle kAppBarText = TextStyle(color: kTextColor, fontSize: 20);
const TextStyle kAppText =
    TextStyle(color: kTextColor, fontSize: 16, fontWeight: FontWeight.bold);

const TextStyle kTimerText =
    TextStyle(color: kPrimaryColor, fontSize: 32, fontWeight: FontWeight.bold);

const kInputTextFieldDecoration = InputDecoration(
  filled: true,
  labelText: 'Task',
  labelStyle: kAppBarText,
  fillColor: kSecondaryColor,
  suffixIcon: Icon(
    Icons.edit,
    color: kAccentColor,
  ),
  hintText: 'Task',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);
