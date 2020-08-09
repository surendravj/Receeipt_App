import 'package:flutter/material.dart';
import 'package:food_world/models/receipe.dart';
import 'package:food_world/views/recipeDetailsPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';

class ReceipeCard extends StatelessWidget {
  final Receipe item;
  ReceipeCard(this.item);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black12,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailsPage(item),
          ),
        );
      },
      child: Container(
        height: 300,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300 * 0.6,
              child: Image.network(
                item.image == null
                    ? 'https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg'
                    : item.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  item.title,
                  style: GoogleFonts.ptSans(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildRows(Icons.access_time, '${item.readyInMinutes} min'),
                  buildRows(
                      Icons.adjust,
                      item.dishTypes.length == 0
                          ? 'Unknown'
                          : item.dishTypes[0]),
                  buildRows(Icons.favorite, item.aggregateLikes),
                  buildRows(Icons.monetization_on,
                      '${double.parse(item.pricePerServing).toInt()} / serve')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Row buildRows(IconData icon, String text) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.black45,
      ),
      SizedBox(width: 5),
      Text(
        text,
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
        )),
      ),
    ],
  );
}
