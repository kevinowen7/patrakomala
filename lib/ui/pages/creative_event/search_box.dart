part of '../pages.dart';

class SearchBoxCreativeEvent extends StatefulWidget {
  @override
  _SearchBoxCreativeEventState createState() => _SearchBoxCreativeEventState();
}

class _SearchBoxCreativeEventState extends State<SearchBoxCreativeEvent> {
  List<String> itemsSubsektor = ['Subsektor 1', 'Subsektor 2', 'Subsektor 3'];
  List<String> itemsBelt = ['Belt 1', 'Belt 2', 'Belt 3'];
  TextEditingController subsektorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, 0.0),
              end: Alignment(0.996, 0.092),
              colors: [
                Color(0xFFF5F5F5),
                Color(0xFFFEFEFE),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NeuBorder(
                mTop: 20,
                mBot: 20,
                child: Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: TextField(
                    style: normalFontStyle.copyWith(
                        color: Colors.grey, fontSize: 18),
                    decoration: InputDecoration(
                      prefixIcon: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back, color: Colors.grey)),
                      border: InputBorder.none,
                      hintText: "Cari Event ...",
                      hintStyle: normalFontStyle.copyWith(
                          color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text("Atau cari berdasarkan kategori",
                    style: normalFontStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color.fromRGBO(119, 119, 119, 0.5),
                    )),
              ),
              NeuBorder2(
                mTop: 20,
                mBot: 0,
                child: SearchMultipleCustom(
                  hintText: "Tanggal",
                  items: itemsSubsektor,
                  selectEditingController: subsektorController,
                ),
              ),
              NeuBorder2(
                mTop: 16,
                mBot: 0,
                child: SearchMultipleCustom(
                  hintText: "Subsektor",
                  items: itemsSubsektor,
                  selectEditingController: subsektorController,
                ),
              ),
              NeuBorder2(
                mTop: 16,
                mBot: 16,
                child: SearchMultipleCustom(
                  hintText: "Pentahelix",
                  items: itemsSubsektor,
                  selectEditingController: subsektorController,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(17, 18, 19, 0.3),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 2.0,
                    ),
                  ],
                  gradient: RadialGradient(colors: [
                    "FEFEFE".toColor(),
                    "F8F8F8".toColor(),
                  ]),
                  borderRadius: BorderRadius.all(const Radius.circular(5.0)),
                ),
                child: Center(
                    child: Text(
                  "Cari",
                  style: normalFontStyle.copyWith(
                      color: mainColorRed,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
