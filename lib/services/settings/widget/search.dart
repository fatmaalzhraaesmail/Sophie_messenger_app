
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';

Widget Search() {
  final TextEditingController searchController = TextEditingController();

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        // padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        decoration: BoxDecoration(
            color: HexColor('#e8e4e3').withAlpha(100),
            borderRadius: BorderRadius.circular(10.0)),
        width:MediaHelper.width,
        height: 45,
        child: TextField(
          cursorColor: Colors.white,
          controller: searchController,
          decoration: InputDecoration(
            // border: Border(bottom: BorderSide(color: Colors.w)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            hintText: 'Search',
            contentPadding: EdgeInsets.symmetric(vertical: 10),

            fillColor: Colors.white,
            focusColor: Colors.white,
            hoverColor: Colors.white,
            hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 19,
                height: 2.7,
                fontWeight: FontWeight.w600),
            // Add a clear button to the search bar
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.white,
                size: 27,
              ),
              onPressed: () => searchController.clear(),
            ),
            // Add a search icon or button to the search bar
            prefixIcon: IconButton(
              icon: Icon(
                Icons.search_sharp,
                color: Colors.white,
                size: 27,
              ),
              onPressed: () {
                // Perform the search here
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
     
     
    ],
  );
}
