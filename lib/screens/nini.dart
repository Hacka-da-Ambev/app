import 'package:app/widgets/app_page.dart';
import 'package:app/widgets/nini_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Nini extends StatelessWidget {
  List<dynamic> _emojis = [
    {'id': '92add8a9-a579-4f6e-ac37-261009a0331f', 'name': 'happy'},
    {'id': 'e8c92240-b6d9-49e1-8748-44ed64d0cedd', 'name': 'love'},
    {'id': '4eec26d9-01c5-4024-886e-079b3f1053fd', 'name': 'angry'},
    {'id': '267d76ed-3923-4bf7-bb39-4a04b70fdbe5', 'name': 'sad'},
    {'id': '1d6ce6bf-6977-4a9b-9073-767bdcfb70b5', 'name': 'tired'},
    {'id': '469da347-0876-4e4d-833a-788693ea86e4', 'name': 'excited'},
  ];

  @override
  Widget build(BuildContext context) {
    return AppPage(
      pageContent: _buildContent(context),
    );
  }

  Widget _buildContent(context) {
    var pageWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NiniBuilder.buildHeader(
          text: 'Olá,\nSou a Nini\na assistente virtual para consumidores Ambev',
          fontSize: 20,
          niniName: 'peace'
        ),
        Container(
          width: pageWidth,
          child: Text("Como você está se sentindo hoje?",
              style: GoogleFonts.comfortaa(
                  fontSize: 30, fontWeight: FontWeight.w700)),
        ),
        Container(
            child: Column(
          children: [
            Wrap(
                spacing: pageWidth * 0.18,
                runSpacing: pageWidth * 0.18,
                children: _emojis.map((dynamic e) {
                  print(e);
                  return FlatButton(
                    padding: EdgeInsets.zero,
                    minWidth: pageWidth * 0.15,
                    onPressed: () => Navigator.pushNamed(context, '/suggestions'),
                    child: SvgPicture.asset(
                      "assets/img/${e['name']}.svg",
                      width: pageWidth * 0.15,
                    ),
                  );
                }).toList()),
          ],
        )),
      ],
    );
  }
}
