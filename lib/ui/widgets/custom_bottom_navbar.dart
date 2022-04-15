part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavbar({this.selectedIndex = 0, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: 64,
              height: 55,
              decoration: (selectedIndex == 0)
                  ? BoxDecoration(
                      color: Color(0xFFDFDFDF),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                  : BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color(0xFFFFFFFF),
                          offset: Offset(0.0, -1.0),
                          blurRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Color(0xFFCACACA),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(51, 51, 51, 0.16),
                          offset: Offset(0, 0.0),
                          blurRadius: 0.0,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.0),
                        end: Alignment(0.0, 0.0),
                        colors: [
                          "F7F7F7".toColor(),
                          "EFEFEF".toColor(),
                          "F8F8F8".toColor(),
                        ],
                      ),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10.0)),
                    ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/maps.png',
                      width: 22,
                      height: 22,
                    ),
                    Expanded(
                        child: Text(
                      "Creative\nBelt",
                      textAlign: TextAlign.center,
                      style: normalFontStyle.copyWith(
                          color: '777777'.toColor(),
                          fontSize: ResponsiveFlutter.of(context).fontSize(1)),
                    ))
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: 64,
              height: 55,
              decoration: (selectedIndex == 1)
                  ? BoxDecoration(
                      color: Color(0xFFDFDFDF),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                  : BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color(0xFFFFFFFF),
                          offset: Offset(0.0, -1.0),
                          blurRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Color(0xFFCACACA),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(51, 51, 51, 0.16),
                          offset: Offset(0, 0.0),
                          blurRadius: 0.0,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.0),
                        end: Alignment(0.0, 0.0),
                        colors: [
                          "F7F7F7".toColor(),
                          "EFEFEF".toColor(),
                          "F8F8F8".toColor(),
                        ],
                      ),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10.0)),
                    ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/news.png',
                      width: 22,
                      height: 22,
                    ),
                    Expanded(
                        child: Text(
                      "Creative\nNews",
                      textAlign: TextAlign.center,
                      style: normalFontStyle.copyWith(
                          color: '777777'.toColor(),
                          fontSize: ResponsiveFlutter.of(context).fontSize(1)),
                    ))
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: 64,
              height: 55,
              decoration: (selectedIndex == 2)
                  ? BoxDecoration(
                      color: Color(0xFFDFDFDF),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                  : BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color(0xFFFFFFFF),
                          offset: Offset(0.0, -1.0),
                          blurRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Color(0xFFCACACA),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(51, 51, 51, 0.16),
                          offset: Offset(0, 0.0),
                          blurRadius: 0.0,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.0),
                        end: Alignment(0.0, 0.0),
                        colors: [
                          "F7F7F7".toColor(),
                          "EFEFEF".toColor(),
                          "F8F8F8".toColor(),
                        ],
                      ),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10.0)),
                    ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/product.png',
                      width: 22,
                      height: 22,
                    ),
                    Expanded(
                        child: Text(
                      "Creative\nProduct",
                      textAlign: TextAlign.center,
                      style: normalFontStyle.copyWith(
                          color: '777777'.toColor(),
                          fontSize: ResponsiveFlutter.of(context).fontSize(1)),
                    ))
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(3);
              }
            },
            child: Container(
              width: 64,
              height: 55,
              decoration: (selectedIndex == 3)
                  ? BoxDecoration(
                      color: Color(0xFFDFDFDF),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                  : BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color(0xFFFFFFFF),
                          offset: Offset(0.0, -1.0),
                          blurRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Color(0xFFCACACA),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(51, 51, 51, 0.16),
                          offset: Offset(0, 0.0),
                          blurRadius: 0.0,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.0),
                        end: Alignment(0.0, 0.0),
                        colors: [
                          "F7F7F7".toColor(),
                          "EFEFEF".toColor(),
                          "F8F8F8".toColor(),
                        ],
                      ),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10.0)),
                    ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/calendar.png',
                      width: 22,
                      height: 22,
                    ),
                    Expanded(
                        child: Text(
                      "Creative\nEvent",
                      textAlign: TextAlign.center,
                      style: normalFontStyle.copyWith(
                          color: '777777'.toColor(),
                          fontSize: ResponsiveFlutter.of(context).fontSize(1)),
                    ))
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(4);
              }
            },
            child: Container(
              width: 64,
              height: 55,
              decoration: (selectedIndex == 4)
                  ? BoxDecoration(
                      color: Color(0xFFDFDFDF),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                  : BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color(0xFFFFFFFF),
                          offset: Offset(0.0, -1.0),
                          blurRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Color(0xFFCACACA),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(51, 51, 51, 0.16),
                          offset: Offset(0, 0.0),
                          blurRadius: 0.0,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.0),
                        end: Alignment(0.0, 0.0),
                        colors: [
                          "F7F7F7".toColor(),
                          "EFEFEF".toColor(),
                          "F8F8F8".toColor(),
                        ],
                      ),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10.0)),
                    ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/pcc.png',
                      width: 22,
                      height: 22,
                    ),
                    Expanded(
                        child: Text(
                      "PCC\nCorner",
                      textAlign: TextAlign.center,
                      style: normalFontStyle.copyWith(
                          color: '777777'.toColor(),
                          fontSize: ResponsiveFlutter.of(context).fontSize(1)),
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
