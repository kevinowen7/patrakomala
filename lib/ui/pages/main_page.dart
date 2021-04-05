part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;
  MainPage({this.initialPage = 0});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage;
  PageController pageController;
  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: mainColorRed,
          ),
          SafeArea(
            child: Container(
              color: mainColorRed,
            ),
          ),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            children: [
              Center(
                child: LoginEmail(),
              ),
              Center(
                child: LoginEmail(),
              ),
              Center(
                child: Text("2"),
              ),
              Center(
                child: Text("3"),
              ),
              Center(
                child: Text("4"),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: "F8F8F8".toColor(),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color.fromRGBO(17, 18, 19, 0.05),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(17, 18, 19, 0.05),
                    spreadRadius: -12.0,
                    blurRadius: 12.0,
                  ),
                ],
              ),
              height: 80,
              child: CustomBottomNavbar(
                selectedIndex: selectedPage,
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                  pageController.jumpToPage(selectedPage);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
