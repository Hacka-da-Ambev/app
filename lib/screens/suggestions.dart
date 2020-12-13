import 'package:app/widgets/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Suggestions extends StatelessWidget {
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
        Row(
          children: [
            Expanded(
              flex: 9,
              child: Text(
                "Olá, \nSou a Nini \na assistente virtual para consumidores Ambev",
                style: GoogleFonts.comfortaa(fontSize: 20)
              ),
            ),
            Expanded(
              flex: 7,
              child: Icon(Icons.person, size: 70),
            ),
          ],
        ),
        Container(
          width: pageWidth,
          child: Text(
            "Como você está se sentindo hoje?",
            style: GoogleFonts.comfortaa(fontSize: 36)
          ),
        ),
        Container(
          // height: 200,
          // color: Colors.amber,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.amber,
                    width: 200,
                    height: 200,
                    child: SvgPicture.asset(
                      'assets/img/happy.svg',
                      // color: Colors.black, 
                      fit: BoxFit.cover,
                    )
                  ),
                  // SvgPicture.asset('assets/img/happy.svg', width: 100, ),
                  // SvgPicture.asset('assets/img/happy.svg', width: 100, ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/img/happy.svg', height: 100),
                  SvgPicture.asset('assets/img/happy.svg', height: 100),
                  SvgPicture.asset('assets/img/happy.svg', height: 100),
                ],
              ),
            ],
          )
        ),
      ],
    );
    
  }
}
