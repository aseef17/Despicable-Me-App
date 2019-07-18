import 'package:after_layout/after_layout.dart';
import 'package:despicable_me_app/models/character.dart';
import 'package:despicable_me_app/styleguide.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CharacterDetailScreen extends StatefulWidget {
  final Character character;
  final double _expandedBottomSheet = 0;
  final double _collapsedBottomSheet = -250;
  final double _completeCollapsedBottomSheet = -330;

  const CharacterDetailScreen({Key key, this.character}) : super(key: key);

  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen>
    with AfterLayoutMixin<CharacterDetailScreen> {
  double bottomSheetPosition = -330;
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      child: Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: "background-${widget.character.name}",
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: widget.character.colors,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.0001, left: screenWidth * 0.005),
                  child: IconButton(
                      icon: Icon(Icons.close),
                      iconSize: screenHeight * 0.06,
                      color: Colors.white.withOpacity(0.9),
                      onPressed: () {
                        _willPop();
                      }),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image-${widget.character.name}",
                    child: Image.asset(widget.character.imagePath,
                        height: screenHeight * 0.45),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.01),
                  child: Hero(
                    tag: "name-${widget.character.name}",
                    child: Material(
                        color: Colors.transparent,
                        child: Text(widget.character.name,
                            style: AppTheme.heading)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.05, 0,
                      screenWidth * 0.025, screenHeight * 0.10),
                  child: Text(widget.character.description,
                      style: AppTheme.subHeading),
                )
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            bottom: bottomSheetPosition,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth * 0.1),
                  topRight: Radius.circular(screenWidth * 0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: _onTap,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.075),
                      height: Platform.isAndroid ? screenHeight * 0.12 : 80,
                      child: Text(
                        "Clips",
                        style:
                            AppTheme.subHeading.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _clipsWidget(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
      onWillPop: () {
        return new Future(() => _willPop());
      }
    );
  }

  _onTap() {
    setState(() {
      bottomSheetPosition = isCollapsed
          ? widget._expandedBottomSheet
          : widget._collapsedBottomSheet;

      isCollapsed = !isCollapsed;
    });
  }

  _willPop() {
    setState(() {
      bottomSheetPosition = widget._completeCollapsedBottomSheet;
    });
    Future.delayed(const Duration(milliseconds: 250), () {
      Navigator.pop(context);
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isCollapsed = true;
        bottomSheetPosition = widget._collapsedBottomSheet;
      });
    });
  }
}

Widget _clipsWidget(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return Container(
    height: Platform.isAndroid ? screenHeight * 0.37 : 250,
    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
    child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            roundedContainer(Colors.redAccent),
            SizedBox(height: Platform.isAndroid ? screenWidth * 0.035 : 20),
            roundedContainer(Colors.greenAccent),
          ],
        ),
        SizedBox(width: Platform.isAndroid ? screenWidth * 0.035 : 16),
        Column(
          children: <Widget>[
            roundedContainer(Colors.orangeAccent),
            SizedBox(height: Platform.isAndroid ? screenWidth * 0.035 : 20),
            roundedContainer(Colors.purple),
          ],
        ),
        SizedBox(width: Platform.isAndroid ? screenWidth * 0.035 : 16),
        Column(
          children: <Widget>[
            roundedContainer(Colors.grey),
            SizedBox(height: Platform.isAndroid ? screenWidth * 0.035 : 20),
            roundedContainer(Colors.blueGrey),
          ],
        ),
        SizedBox(width: Platform.isAndroid ? screenWidth * 0.035 : 16),
        Column(
          children: <Widget>[
            roundedContainer(Colors.lightGreenAccent),
            SizedBox(height: Platform.isAndroid ? screenWidth * 0.035 : 20),
            roundedContainer(Colors.pinkAccent),
          ],
        ),
      ],
    ),
  );
}

Widget roundedContainer(Color color) {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );
}
