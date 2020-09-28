import 'package:bookapp/app/viewsmodels/store/userState.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final userState = UserState();

const Color intenseGray = Color(0xFFc2c2c2);

const mainColorDarkBlue = Color(0xff19002D);
const mainColorGreen = Color(0xff00BC96);
const mainColorRed = Color(0xffEA5840);

const reducedColorGreen = Color(0xffE0F7F2);

const Color simpleGray = Color(0xfff5f5f5);
const progressColor = Color(0xff8ce0d7);
const containerBorderColor = Color(0xffCECECE);

var librayContainerColor = Color(0xffA2A2A2).withAlpha(10);

var simpleBackgroundContainerColor = Color(0xffA2A2A2).withAlpha(10);

const timeagoColor = Color(0xff9C9C9C);
const authorNameColor = Color(0xffA9A9A9);
const genreTextColor = Color(0xffEA5840);

const addressInfoColor = Color(0xff979797);

const userNameColor = Color(0xff000000);

const buttonBorderColor = Color(0xff707070);
const buttonTextColor = Color(0xff0A0808);

const proposalBookAuthorColor = Color(0xff8D8D8D);

const pubBorderColor = Color(0xff979797);

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

var bookTitleStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: mainColorDarkBlue, fontSize: 17, fontWeight: FontWeight.bold),
);

var publicationTitleStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: mainColorDarkBlue, fontSize: 16, fontWeight: FontWeight.bold),
);

var passwordDescriptionTitleStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: mainColorDarkBlue, fontSize: 13, fontWeight: FontWeight.bold),
);

var userTypeTextStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: mainColorDarkBlue, fontSize: 13, fontWeight: FontWeight.bold),
);

var nifTextStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: mainColorDarkBlue, fontSize: 13, fontWeight: FontWeight.normal),
);

var timeagoStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: timeagoColor, fontSize: 14, fontWeight: FontWeight.normal),
);

var timeagoMdStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: timeagoColor, fontSize: 13, fontWeight: FontWeight.normal),
);

var timeagoSmallStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: timeagoColor, fontSize: 10, fontWeight: FontWeight.normal),
);

var authorNameStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: authorNameColor, fontSize: 16, fontWeight: FontWeight.normal),
);

var authorNameSmallStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: authorNameColor, fontSize: 11, fontWeight: FontWeight.normal),
);

var bookPriceStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: authorNameColor, fontSize: 11, fontWeight: FontWeight.normal),
);

var genreStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: genreTextColor, fontSize: 16, fontWeight: FontWeight.normal),
);

var priceStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: mainColorDarkBlue, fontSize: 16, fontWeight: FontWeight.normal),
);

var deliveryPriceStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
);

var genreSmallRedStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: mainColorRed, fontSize: 11, fontWeight: FontWeight.normal),
);

var userNameStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: userNameColor, fontSize: 14, fontWeight: FontWeight.bold),
);

var addressInfoStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: addressInfoColor, fontSize: 10),
);

var buttonTextStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: buttonTextColor, fontSize: 16),
);

var proposerNameStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: userNameColor, fontSize: 14, fontWeight: FontWeight.bold),
);

var proposalBookNameStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: mainColorDarkBlue, fontSize: 15, fontWeight: FontWeight.bold),
);

var proposalBookGenreStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: genreTextColor, fontSize: 12, fontWeight: FontWeight.normal),
);

var proposalBookAuthorStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: proposalBookAuthorColor,
      fontSize: 12,
      fontWeight: FontWeight.normal),
);

var proposalActionButtonStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      fontSize: 13, color: Colors.white, fontWeight: FontWeight.normal),
);

//Library Styles

var librayUserNameStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: librayUserNameColor, fontSize: 17, fontWeight: FontWeight.bold),
);

var librayaContactStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: librayaContactColor, fontSize: 10),
);

var librayaFollowersStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: mainColorGreen, fontSize: 8),
);

var libraryProfileContactStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: libraryProfileContactColor, fontSize: 13),
);

var libraryFollowButtonTextStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: libraryFollowButtonTextColor, fontSize: 16),
);

var buttonBuyBookLibraryStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: libraryFollowButtonTextColor, fontSize: 12),
);

var sellingDescriptionText = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: librayUserNameColor, fontSize: 15, fontWeight: FontWeight.bold),
);

var bookToSellStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: mainColorDarkBlue, fontSize: 12, fontWeight: FontWeight.bold),
);

//PUBLICATION
var libraryPublicationStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: libraryPublicationColor,
      fontSize: 14,
      fontWeight: FontWeight.bold),
);

var libraryPublicationTextStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: libraryPublicationColor, fontSize: 14),
);

var buttonPubLibraryStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: libraryFollowButtonTextColor, fontSize: 16),
);

var userNamePubLibraryStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(
      color: mainColorDarkBlue, fontSize: 15, fontWeight: FontWeight.bold),
);

//FORM LABEL STYLES

var formLabelStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: libraryProfileContactColor, fontSize: 13),
);

var formButtonGreenlStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: mainColorGreen, fontSize: 13),
);

//PASSWORD

var customKeyBoardNumberStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: libraryProfileContactColor, fontSize: 23),
);

var passwordMatchErrorStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(color: mainColorRed, fontSize: 12),
);

//ERROR DIALOG

var dialogErrorStyle = GoogleFonts.montserrat(
  textStyle: TextStyle(fontSize: 15, color: timeagoColor),
);

getProgressColor(percent) {
  return (percent < 30)
      ? Colors.redAccent.withOpacity(0.7)
      : (percent >= 30 && percent < 60)
          ? Colors.orange.withOpacity(0.5)
          : Color(0xff8ce0d7);
}
