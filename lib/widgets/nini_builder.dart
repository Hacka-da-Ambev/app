import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class NiniBuilder extends StatelessWidget {
  const NiniBuilder({
    Key key,
  }) : super(key: key);
  
  static Widget buildHeader({@required String text, double fontSize = 20, @required String niniName}) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: Text(
              text,
              style: GoogleFonts.comfortaa(fontSize: fontSize)),
        ),
        Expanded(
          flex: 7,
          child: SvgPicture.asset('assets/img/nini/$niniName.svg', height: 100),
        ),
      ],
    );
  }
}