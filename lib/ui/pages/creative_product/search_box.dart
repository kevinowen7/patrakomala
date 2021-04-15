part of '../pages.dart';

class SearchBoxProduct extends StatefulWidget {
  @override
  _SearchBoxProductState createState() => _SearchBoxProductState();
}

class _SearchBoxProductState extends State<SearchBoxProduct> {
  List<String> itemsSubsektor = [];

  void getSubsector() async {
    var result = await SubsectorServices.getSubsectors();

    (result).asMap().forEach((index, value) {
      print(value.subSectorName);
      setState(() {
        itemsSubsektor.add(value.subSectorName);
      });
    });
  }

  @override
  void initState() {
    this.getSubsector();
    super.initState();
  }

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    height: 20,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 20, defaultMargin, 20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      image: AssetImage('assets/images/back.png'),
                      // fit : BoxFit.cover,
                    ))),
              ),
              NeuBorder(
                mTop: 20,
                mBot: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: defaultMargin),
                  child: TextField(
                    style: normalFontStyle.copyWith(
                        color: Colors.grey, fontSize: 18),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Cari Produk ...",
                      hintStyle: normalFontStyle.copyWith(
                          color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
              ),
              NeuBorder2(
                mTop: 16,
                mBot: 0,
                child: SearchMultipleCustom(
                  hintText: "Subsektor",
                  items: itemsSubsektor,
                ),
              ),
              SizedBox(height: 16),
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
