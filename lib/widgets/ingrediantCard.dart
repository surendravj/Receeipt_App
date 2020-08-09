import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientCard extends StatelessWidget {
  IngredientCard(this.steps);
  final Map<String, dynamic> steps;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        steps['step'],
        style: GoogleFonts.nunito(
          textStyle: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      children: steps['ingredients']
          .map<Widget>(
            (e) => ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://spoonacular.com/cdn/ingredients_100x100/${e['image']}',
                ),
              ),
              title: Text(
                "${e['localizedName']}",
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
