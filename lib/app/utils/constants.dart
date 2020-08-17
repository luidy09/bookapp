import 'package:flutter/material.dart';

const Color intenseGray = Color(0xFFc2c2c2);

const mainColorDarkBlue = Color(0xff19002D);
const mainColorGreen = Color(0xff00BC96);

const Color simpleGray = Color(0xfff5f5f5);
const progressColor = Color(0xff8ce0d7);
const containerBorderColor = Color(0xffCECECE);
const timeagoColor = Color(0xff9C9C9C);
const authorNameColor = Color(0xffA9A9A9);
const genreTextColor = Color(0xffEA5840);

const addressInfoColor = Color(0xff979797);

const userNameColor = Color(0xff000000);

const buttonBorderColor = Color(0xff707070);
const buttonTextColor = Color(0xff0A0808);

const bookTitleStyle = TextStyle(
    color: mainColorDarkBlue, fontSize: 17, fontWeight: FontWeight.bold);

const timeagoStyle =
    TextStyle(color: timeagoColor, fontSize: 14, fontWeight: FontWeight.normal);

const authorNameStyle = TextStyle(
    color: authorNameColor, fontSize: 16, fontWeight: FontWeight.normal);

const genreStyle = TextStyle(
    color: genreTextColor, fontSize: 16, fontWeight: FontWeight.normal);

const userNameStyle =
    TextStyle(color: userNameColor, fontSize: 14, fontWeight: FontWeight.bold);

const addressInfoStyle = TextStyle(color: addressInfoColor, fontSize: 10);

const buttonTextStyle = TextStyle(color: buttonTextColor, fontSize: 16);

getProgressColor(percent) {
  return (percent < 30)
      ? Colors.redAccent.withOpacity(0.7)
      : (percent >= 30 && percent < 60)
          ? Colors.orange.withOpacity(0.5)
          : Color(0xff8ce0d7);
}
