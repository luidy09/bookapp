import 'package:bookapp/app/components/library_info_widget.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/library/library_profile.dart';
import 'package:flutter/material.dart';

class LibraryCard extends StatelessWidget {
  final idLibrary, username, userImage, address, email, phone1, phone2;

  LibraryCard(
      {this.idLibrary,
      this.userImage,
      this.username,
      this.address,
      this.email,
      this.phone1,
      this.phone2});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => LibraryProfile(
                idLibrary: idLibrary,
                userImage: userImage,
                username: username,
                address: address,
                email: email,
                phone1: phone1,
                phone2: phone2)));
        print(idLibrary);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 130,
        decoration: BoxDecoration(
            color: librayContainerColor,
            borderRadius: BorderRadius.circular(9)),
        child: LibraryInfoWidget(
          username: username,
          userImage: userImage,
          address: address,
          email: email,
          phone1: phone1,
          phone2: phone1,
        ),
      ),
    );
  }
}
