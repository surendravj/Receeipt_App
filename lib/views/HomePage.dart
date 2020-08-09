import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_world/services/receipe.dart';
import 'package:food_world/widgets/receipeCard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<ReceipeProvider>(context, listen: false).fetchItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    var appBarSection = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Todays best recipes',
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      leading: Icon(Icons.subject, color: Colors.black),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: null,
        ),
      ],
    );
    return SafeArea(
      child: Scaffold(
        appBar: appBarSection,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Consumer<ReceipeProvider>(
            builder: (ctx, data, child) {
              return data.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (ctx, i) {
                        return ReceipeCard(data.filterItems[i]);
                      },
                      itemCount: data.filterItems.length,
                    );
            },
          ),
        ),
      ),
    );
  }
}
