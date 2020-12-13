import 'package:app/utils/constants.dart';
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
          SvgPicture.asset('assets/img/ambev.svg',
              color: Colors.red[900], width: 88, height: 22),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text("Olá, Daniel", style: GoogleFonts.comfortaa(fontSize: 36)),
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
          style: GoogleFonts.comfortaa(fontSize: 36)
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
                    child: Text("Harmonização", style: GoogleFonts.comfortaa(fontSize: 16))
                  )
                ),
                color: Colors.grey[200],
              ),
              Card(
                child: Container(
                  height: 25,
                  child: Center(
                    child: Text("Soberano", style: GoogleFonts.comfortaa(fontSize: 16))
                  )
                ),
                color: Colors.grey[200],
              ),
              Card(
                child: Container(
                  height: 25,
                  child: Center(
                    child: Text("Locais de Venda", style: GoogleFonts.comfortaa(fontSize: 16))
                  )
                ),
                color: Colors.grey[200],
              ),
              Card(
                child: Container(
                  height: 25,
                  child: Center(
                    child: Text("Catálogo", style: GoogleFonts.comfortaa(fontSize: 16))
                  )
                ),
                color: Colors.grey[200],
              ),
            ]
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, '/nini'),
            child: Icon(Icons.chat, color: primaryColor),
            backgroundColor: Colors.white,
          )
        ),
      ],
    );
    
  }
}
