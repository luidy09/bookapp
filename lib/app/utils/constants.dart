import 'package:flutter/material.dart';

const Color intenseGray = Color(0xFFc2c2c2);

const mainColorDarkBlue = Color(0xff19002D);
const mainColorGreen = Color(0xff00BC96);
const mainColorRed = Color(0xffEA5840);

const reducedColorGreen = Color(0xffE0F7F2);

const Color simpleGray = Color(0xfff5f5f5);
const progressColor = Color(0xff8ce0d7);
const containerBorderColor = Color(0xffCECECE);

var librayContainerColor = Color(0xffA2A2A2).withAlpha(10);

const timeagoColor = Color(0xff9C9C9C);
const authorNameColor = Color(0xffA9A9A9);
const genreTextColor = Color(0xffEA5840);

const addressInfoColor = Color(0xff979797);

const userNameColor = Color(0xff000000);

const buttonBorderColor = Color(0xff707070);
const buttonTextColor = Color(0xff0A0808);

const proposalBookAuthorColor = Color(0xff8D8D8D);

//HOME

var bottomNaviagtionColor = Color(0xffA2A2A2);

//Library Colors

const librayUserNameColor = Color(0xff1A022E);
const librayaContactColor = Color(0xff9D9D9D);
const libraryProfileContactColor = Color(0xff050505);
const libraryFollowButtonTextColor = Color(0xffEBEBEB);

//PUBLICATION

const libraryPublicationColor = Color(0xff0D0F0E);

//REGISTRATION

const passwordContainerColor = Color(0xffF6F6F6);

//STYLES

const bookTitleStyle = TextStyle(
    color: mainColorDarkBlue, fontSize: 17, fontWeight: FontWeight.bold);

const passwordDescriptionTitleStyle = TextStyle(
    color: mainColorDarkBlue, fontSize: 13, fontWeight: FontWeight.bold);

const userTypeTextStyle = TextStyle(
    color: mainColorDarkBlue, fontSize: 13, fontWeight: FontWeight.bold);
const nifTextStyle = TextStyle(
    color: mainColorDarkBlue, fontSize: 13, fontWeight: FontWeight.normal);

const timeagoStyle =
    TextStyle(color: timeagoColor, fontSize: 14, fontWeight: FontWeight.normal);
const timeagoMdStyle =
    TextStyle(color: timeagoColor, fontSize: 13, fontWeight: FontWeight.normal);

const timeagoSmallStyle =
    TextStyle(color: timeagoColor, fontSize: 10, fontWeight: FontWeight.normal);

const authorNameStyle = TextStyle(
    color: authorNameColor, fontSize: 16, fontWeight: FontWeight.normal);
const authorNameSmallStyle = TextStyle(
    color: authorNameColor, fontSize: 11, fontWeight: FontWeight.normal);

const bookPriceStyle = TextStyle(
    color: authorNameColor, fontSize: 11, fontWeight: FontWeight.normal);

const genreStyle = TextStyle(
    color: genreTextColor, fontSize: 16, fontWeight: FontWeight.normal);

const priceStyle = TextStyle(
    color: mainColorDarkBlue, fontSize: 16, fontWeight: FontWeight.normal);

const deliveryPriceStyle =
    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal);

const genreSmallRedStyle =
    TextStyle(color: mainColorRed, fontSize: 11, fontWeight: FontWeight.normal);

const userNameStyle =
    TextStyle(color: userNameColor, fontSize: 14, fontWeight: FontWeight.bold);

const addressInfoStyle = TextStyle(color: addressInfoColor, fontSize: 10);

const buttonTextStyle = TextStyle(color: buttonTextColor, fontSize: 16);

const proposerNameStyle =
    TextStyle(color: userNameColor, fontSize: 14, fontWeight: FontWeight.bold);

const proposalBookNameStyle = TextStyle(
    color: mainColorDarkBlue, fontSize: 15, fontWeight: FontWeight.bold);

const proposalBookGenreStyle = TextStyle(
    color: genreTextColor, fontSize: 12, fontWeight: FontWeight.normal);

const proposalBookAuthorStyle = TextStyle(
    color: proposalBookAuthorColor,
    fontSize: 12,
    fontWeight: FontWeight.normal);

const proposalActionButtonStyle =
    TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.normal);

//Library Styles

const librayUserNameStyle = TextStyle(
    color: librayUserNameColor, fontSize: 17, fontWeight: FontWeight.bold);

const librayaContactStyle = TextStyle(color: librayaContactColor, fontSize: 10);

const librayaFollowersStyle = TextStyle(color: mainColorGreen, fontSize: 8);

const libraryProfileContactStyle =
    TextStyle(color: libraryProfileContactColor, fontSize: 13);

const libraryFollowButtonTextStyle =
    TextStyle(color: libraryFollowButtonTextColor, fontSize: 16);

const buttonBuyBookLibraryStyle =
    TextStyle(color: libraryFollowButtonTextColor, fontSize: 12);

const sellingDescriptionText = TextStyle(
    color: librayUserNameColor, fontSize: 15, fontWeight: FontWeight.bold);

const bookToSellStyle = TextStyle(
    color: mainColorDarkBlue, fontSize: 12, fontWeight: FontWeight.bold);

//PUBLICATION
const libraryPublicationStyle = TextStyle(
    color: libraryPublicationColor, fontSize: 14, fontWeight: FontWeight.bold);

const libraryPublicationTextStyle =
    TextStyle(color: libraryPublicationColor, fontSize: 14);
const buttonPubLibraryStyle =
    TextStyle(color: libraryFollowButtonTextColor, fontSize: 16);

const userNamePubLibraryStyle = TextStyle(
    color: mainColorDarkBlue, fontSize: 15, fontWeight: FontWeight.bold);

//FORM LABEL STYLES

const formLabelStyle =
    TextStyle(color: libraryProfileContactColor, fontSize: 13);

const formButtonGreenlStyle = TextStyle(color: mainColorGreen, fontSize: 13);

//PASSWORD

const customKeyBoardNumberStyle =
    TextStyle(color: libraryProfileContactColor, fontSize: 23);

const passwordMatchErrorStyle = TextStyle(color: mainColorRed, fontSize: 12);

getProgressColor(percent) {
  return (percent < 30)
      ? Colors.redAccent.withOpacity(0.7)
      : (percent >= 30 && percent < 60)
          ? Colors.orange.withOpacity(0.5)
          : Color(0xff8ce0d7);
}
