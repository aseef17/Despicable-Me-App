import 'package:despicable_me_app/models/character.dart';
import 'package:despicable_me_app/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:despicable_me_app/widgets/character_widget.dart';

class CharacterListingScreen extends StatefulWidget {
  CharacterListingScreen({Key key}) : super(key: key);

  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  PageController _pageController;
  int current_page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: current_page, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 8.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Despicable Me", style: AppTheme.display1),
                  TextSpan(text: "\n"),
                  TextSpan(text: "Characters", style: AppTheme.display2)
                ]),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  for(var i=0; i < characters.length; i++) 
                    CharacterWidget(character: characters[i], pageController: _pageController, current_page: i)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
