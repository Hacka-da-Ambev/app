import 'package:app/utils/constants.dart';
import 'package:app/widgets/app_page.dart';
import 'package:app/widgets/nini_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class Suggestions extends StatefulWidget {
  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  int _index = 0;
  List<dynamic> _beers = [
    {
      'id': '92add8a9-a579-4f6e-ac37-261009a0331f',
      'name': 'Skol Pilsen',
      'description':
          'É uma típica cerveja clara, com aroma refinado e sabor leve e suave.',
      'harmonization':
          'Por ser uma cerveja leve, não deve ser harmonizada com pratos de sabor muito forte. Combina saladas, camarão e mariscos.',
      'abv': '4,6',
      'ibu': '8',
      'image': 'https://www.ambev.com.br/conteudo/uploads/2019/03/skol_1l.png'
    },
    {
      'id': 'e8c92240-b6d9-49e1-8748-44ed64d0cedd',
      'name': 'Brahma Chopp Pilsen',
      'description':
          'Perfeito para levar o sabor autêntico de cerveja brasileira, com espuma cremosa e persistente, amargor presente e ligeiramente encorpada.',
      'harmonization':
          'Combina com queijos pouco condimentados, saladas, frutos do mar e petiscos fritos.',
      'abv': '4,8',
      'ibu': '10',
      'image': 'https://www.ambev.com.br/conteudo/uploads/2019/03/brahma_1l.png'
    },
    {
      'id': '4eec26d9-01c5-4024-886e-079b3f1053fd',
      'name': 'Colorado Appia',
      'description':
          'Doce, encorpada e refrescante, é perfeita para quem busca novos e diferentes sabores.',
      'harmonization':
          'Por ser uma cerveja leve, a Colorado Appia vai combinar muito bem comidas mais leves como pernil, saladas, frango, massas e queijo brie.',
      'abv': '5,5',
      'ibu': '10',
      'image':
          'https://www.ambev.com.br/conteudo/uploads/2019/03/appia_600ml.png'
    },
    {
      'id': '267d76ed-3923-4bf7-bb39-4a04b70fdbe5',
      'name': 'Beck´s',
      'description':
          'Uma cerveja de amargor intenso, sabor marcante e excepcional pureza.',
      'harmonization':
          'Para quem busca alimentos mais leves ela também harmoniza com peixes grelhados, frutos do mar e saladas por conta da sua alta refrescância.',
      'abv': '5',
      'ibu': '20',
      'image':
          'https://www.ambev.com.br/conteudo/uploads/2019/03/becks_330ml.png'
    },
    {
      'id': '1d6ce6bf-6977-4a9b-9073-767bdcfb70b5',
      'name': 'Quilmes',
      'description':
          'Com aroma suave de cereais, com lúpulo e malte bem equilibrados, que fazem dela uma cerveja fácil de beber.',
      'harmonization':
          'Ela é leve e refrescante, por isso harmoniza muito bem com pratos leves. Assim, um sabor não vai sobrepor o outro.',
      'abv': '5',
      'ibu': '14.3',
      'image':
          'https://www.ambev.com.br/conteudo/uploads/2019/03/quilmes_970ml.png'
    },
    {
      'id': '469da347-0876-4e4d-833a-788693ea86e4',
      'name': 'Stella Artois',
      'description':
          'Uma cerveja de sabor intenso e com final suave, foi criada para ser saboreada.',
      'harmonization':
          'O amargor e a alta refrescância vão cortar a gordura de carnes vermelhas, já os aromas florais vão complementar a harmonização com frutos do mar.',
      'abv': '5',
      'ibu': '16',
      'image':
          'https://www.ambev.com.br/conteudo/uploads/2019/03/stella-artois_550ml.png'
    },
    {
      'id': '469da347-0876-4e4d-833a-788693ea86e4',
      'name': 'Budweiser',
      'description':
          'Só uma cerveja como a Budweiser consegue manter os 143 anos de história e ter a autenticidade para ser o que quiser.',
      'harmonization':
          'O sabor marcante no começo e suave no final de Budweiser pede que ela harmonize com hambúrguer clássico.',
      'abv': '5',
      'ibu': '10',
      'image':
          'https://www.ambev.com.br/conteudo/uploads/2019/03/budweiser_600ml.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppPage(
      pageContent: _buildContent(context),
    );
  }

  Widget _buildContent(context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;

    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: NiniBuilder.buildHeader(
            text: "Aqui estão algumas indicações para você",
            niniName: 'punch',
            fontSize: 20),
      ),
      OverflowBox(
        maxWidth: MediaQuery.of(context).size.width,
        child: Container(
            height: pageHeight * 0.6,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Stack(children: [
                  Center(
                    child: Container(
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: SvgPicture.asset(
                            'assets/img/curves.svg',
                          )),
                    ),
                  ),
                  Center(
                    child: Image.network(
                      _beers[index]['image'],
                      fit: BoxFit.fill,
                    ),
                  )
                ]);
              },
              onIndexChanged: (i) => setState(() {
                _index = i;
              }),
              viewportFraction: 0.5,
              scale: 0.2,
              itemCount: _beers.length,
              scrollDirection: Axis.horizontal,
            )),
      ),
      Container(
        transform: Matrix4.translationValues(0.0, 20.0, 0.0),
        child: OverflowBox(
          alignment: Alignment.bottomCenter,
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: pageHeight * 0.35,
          child: ClipPath(
            clipper: FooterClippingClass(),
            child: Container(
              color: primaryColor,
              width: pageWidth,
              height: pageHeight,
              child: Padding(
                padding: const EdgeInsets.only(top: 48.0, left: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          Text(_beers[_index]['name'],
                              style: GoogleFonts.comfortaa(
                                  fontSize: 14, fontWeight: FontWeight.w800)),
                          Text(_beers[_index]['description'],
                              style: GoogleFonts.comfortaa(
                                fontSize: 14,
                              )),
                          Text("Harmonização",
                              style: GoogleFonts.comfortaa(
                                  fontSize: 14, fontWeight: FontWeight.w800)),
                          Text(_beers[_index]['harmonization'],
                              style: GoogleFonts.comfortaa(
                                fontSize: 14,
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: Container(
                                height: 36,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: Colors.black,
                                ),
                                child: Stack(children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 26.0),
                                        child: Text("TEOR ALCOÓLICO",
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 8,
                                                color: Colors.white)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 26.0),
                                        child: Text(
                                            "${_beers[_index]['abv']} %",
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 8,
                                                color: Colors.white)),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 88.0),
                                    child: Container(
                                      width: 140,
                                      height: 140,
                                      decoration: new BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/img/discount.svg',
                                        color: Colors.white,
                                        height: 200,
                                      )
                                    ),
                                  )
                                ]),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

class FooterClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 100);

    var firstEndPoint = Offset(0, 40);
    var firstControlPoint = Offset(100, -20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CardCurvesClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 100);

    var firstEndPoint = Offset(0, 40);
    var firstControlPoint = Offset(100, -20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
