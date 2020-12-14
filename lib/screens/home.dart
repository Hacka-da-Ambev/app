import 'package:app/widgets/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      headerContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/img/ambev.svg', width: 110),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text("Olá, Daniel", style: GoogleFonts.comfortaa(fontSize: 26, color: Colors.grey[400])),
          )
        ],
      ),
      pageContent: _buildContent(context),
    );
  }

  Widget _buildContent(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "O que está procurando hoje?",
          style: GoogleFonts.comfortaa(fontSize: 36,)
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height:220,
          // color: Colors.amber,
          child: GridView.count(
            crossAxisCount: 2,

            padding: EdgeInsets.symmetric(horizontal: 20),
            childAspectRatio: 3/2,
            crossAxisSpacing: 40,
            mainAxisSpacing: 20,
            children: [
              Card(
                child: Container(
                  height: 25,
                  child: Center(
                    child: Text("Bora dar match", style: GoogleFonts.comfortaa(fontSize: 16, fontWeight:FontWeight.w700), textAlign: TextAlign.center,)
                  )
                ),
                color: Colors.grey[200],
              ),
              Card(
                child: Container(
                  height: 25,
                  child: Center(
                    child: Text("Só as TOP", style: GoogleFonts.comfortaa(fontSize: 16, fontWeight:FontWeight.w700), textAlign: TextAlign.center,)
                  )
                ),
                color: Colors.grey[200],
              ),
              Card(
                child: Container(
                  height: 25,
                  child: Center(
                    child: Text("Onde comprar", style: GoogleFonts.comfortaa(fontSize: 16, fontWeight:FontWeight.w700), textAlign: TextAlign.center,)
                  )
                ),
                color: Colors.grey[200],
              ),
              Card(
                child: Container(
                  height: 25,
                  child: Center(
                    child: Text("Os produtin da Ambev", style: GoogleFonts.comfortaa(fontSize: 16, fontWeight:FontWeight.w700), textAlign: TextAlign.center,)
                  )
                ),
                color: Colors.grey[200],
              ),
            ]
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: FlatButton(
            height: 60,
            minWidth: 40,
            onPressed: () => Navigator.pushNamed(context, '/nini'),
            child: SvgPicture.asset('assets/img/nini/peace.svg', height: 100),
          )
        ),
      ],
    );
    
  }
}
