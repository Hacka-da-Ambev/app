import 'package:app/utils/constants.dart';
import 'package:app/widgets/menu_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPage extends StatefulWidget {
  final Widget headerContent;
  final Widget pageContent;
  AppPage({
    Key key,
    this.headerContent,
    this.pageContent,
  }) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  bool _isShowingMenu = false;

  bool _hasHeader = false;
  double _headerHeight = 0;
  Widget _headerContent;
  // Percentual of the screen used by header
  double _headerHeightClosedPercentual = 0.3;
  double _headerHeightOpenedPercentual = 0.95;

  double _contentTopPosition = 0;

  @override
  Widget build(BuildContext context) {
    _prepareLayout();
    return Scaffold(
      body: Stack(children: [
        _buildContent(context),
        _buildHeader(context),
        _buildMenuIcon(context),
      ]),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, _contentTopPosition, 20, 20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: widget.pageContent,
      color: Colors.white,
    );
  }

  @override
  void initState() {
    _headerContent = widget.headerContent;
  }

  Widget _buildHeader(BuildContext context) {
    return Positioned(
        child: Container(
      child: ClipPath(
          clipper: HeaderClippingClass(),
          child: AnimatedContainer(
            duration: Duration(milliseconds: transitionsDuration),
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: transitionsDuration),
                  child: _headerContent,
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  }),
            ),
            color: primaryColor,
            width: MediaQuery.of(context).size.width,
            height: _getHeaderSize(),
          )),
    ));
  }

  Widget _buildMenuIcon(BuildContext context) {
    return AnimatedPositioned(
        duration: Duration(milliseconds: 500),
        top: _getMenuIconTopPosition(context),
        right: 25,
        child: GestureDetector(
          onTap: () => setState(() => _toogleMenu()),
          child: MenuIcon(
            isShowingMenu: _isShowingMenu,
          ),
        ));
  }

  void _toogleMenu() {
    _isShowingMenu = !_isShowingMenu;
    if (_isShowingMenu) {
      _headerContent = Expanded(
        child: Container(
          alignment: Alignment.topLeft,
          child: _buildMenu(),
        ),
      );
    } else {
      _headerContent = widget.headerContent;
    }
  }

  Widget _buildMenu() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Daniel Rossini",
                    style: GoogleFonts.comfortaa(
                        fontSize: 22, fontWeight: FontWeight.w900)),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.36,
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.black, width: 1.5))),
              child: ListView.separated(
                  padding: EdgeInsets.all(0),
                  separatorBuilder: (context, index) => Divider(
                        height: 0,
                        thickness: 1.5,
                        color: Colors.black,
                      ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      dense: true,
                      leading: Icon(Icons.ac_unit),
                      title: Text("Teste",
                          style: GoogleFonts.comfortaa(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                    );
                  }),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: OutlineButton(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  onPressed: () {},
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "SAIR DO APP",
                        style: GoogleFonts.comfortaa(fontSize: 16),
                        textAlign: TextAlign.center,
                      ))))
        ],
      ),
    );
  }

  double _getMenuIconTopPosition(BuildContext context) {
    if (_hasHeader && !_isShowingMenu) {
      return (MediaQuery.of(context).size.height * 0.22);
    }
    return 40;
  }

  void _prepareLayout() {
    setState(() {
      _hasHeader = widget.headerContent != null;
      if (_hasHeader) {
        _contentTopPosition =
            MediaQuery.of(context).size.height * _headerHeightClosedPercentual;
      }
    });
  }

  double _getHeaderSize() {
    if (!_hasHeader && !_isShowingMenu) {
      return 0;
    }
    double heightPercentual = _isShowingMenu
        ? _headerHeightOpenedPercentual
        : _headerHeightClosedPercentual;
    return MediaQuery.of(context).size.height * heightPercentual;
  }
}

class HeaderClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 40);

    var firstEndPoint = Offset(size.width / 1.85, size.height - 25);
    var firstControlPoint = Offset(size.width / 2.85, size.height - 80);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 10);
    var secondControlPoint = Offset(size.width / 1.45, size.height + 20);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

enum PageFormat { header_and_content, content }
