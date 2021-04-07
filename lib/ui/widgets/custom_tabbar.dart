part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  CustomTabBar({@required this.titles, this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      decoration: BoxDecoration(
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
        borderRadius: BorderRadius.circular(20),
        color: backgroundColorGrey,
      ),
      child: Stack(
        children: [
          // Container(
          //   margin: EdgeInsets.only(top: 48),
          //   height: 2,
          //   color: mainColor,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: titles
                .map((e) => Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                if (onTap != null) {
                                  onTap(titles.indexOf(e));
                                }
                              },
                              child: Container(
                                height: 32,
                                width: ((MediaQuery.of(context).size.width) *
                                        0.5) -
                                    30,
                                margin: EdgeInsets.all(4),
                                decoration: (titles.indexOf(e) == selectedIndex)
                                    ? BoxDecoration(
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(17, 18, 19, 0.3),
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 2.0,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                        color: backgroundColor,
                                      )
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: backgroundColorGrey,
                                      ),
                                child: Center(
                                  child: (titles.indexOf(e) == selectedIndex)
                                      ? Text(e,
                                          style: normalFontStyle.copyWith(
                                              color: mainColorRed,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600))
                                      : Text(e,
                                          style: blackfontStyle2.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),
                                ),
                              ))
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
