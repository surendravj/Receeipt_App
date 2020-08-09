import 'package:flutter/material.dart';
import 'package:food_world/models/receipe.dart';
import 'package:food_world/widgets/ingrediantCard.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Receipe receipe;
  const RecipeDetailsPage(this.receipe);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            receipe.title,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              imageArea(receipe.image),
              tagHolder(receipe.dishTypes),
              Padding(
                padding: EdgeInsets.all(10),
                child: stepsHolder(
                  receipe.analyzedInstructions[0]['steps'],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor:Colors.green[700],
          onPressed: () {},
          label: Text('Nutro'),
          icon: Icon(Icons.food_bank),
        ),
      ),
    );
  }
}

Widget imageArea(String url) {
  return Container(
    margin: EdgeInsets.all(0),
    padding: EdgeInsets.all(0),
    width: double.infinity,
    height: 250,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        child: Image.network(
            url == null
                ? 'https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg'
                : url,
            fit: BoxFit.cover),
      ),
    ),
  );
}

Widget tagHolder(List<dynamic> dishtypes) {
  return Wrap(
    spacing: 5,
    direction: Axis.horizontal,
    alignment: WrapAlignment.center,
    children: dishtypes
        .map<Widget>(
          (e) => FilterChip(
              label: Text(
                '#$e',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.purple[800],
                  ),
                ),
              ),
              onSelected: null),
        )
        .toList(),
  );
}

Widget stepsHolder(List<dynamic> steps) {
  return Column(
    children: steps
        .map<Widget>(
          (step) => IngredientCard(step),
        )
        .toList(),
  );
}
