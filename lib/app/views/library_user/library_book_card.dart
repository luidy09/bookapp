import 'package:bookapp/app/components/library_info_widget.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/library/library_profile.dart';
import 'package:bookapp/app/views/library_user/library_book_info_widget.dart';
import 'package:flutter/material.dart';

class LibraryBookCard extends StatelessWidget {
  final idBook, title, author, genre, publishing, bookImage;

  LibraryBookCard({
    this.idBook,
    this.title,
    this.author,
    this.genre,
    this.bookImage,
    this.publishing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(" Go to book info");
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 130,
        decoration: BoxDecoration(
            color: librayContainerColor,
            borderRadius: BorderRadius.circular(9)),
        child: LibraryBookInfoWidget(
          title: title,
          author: author,
          genre: genre,
          publishing: publishing,
          bookImage: bookImage,
        ),
      ),
    );
  }
}
