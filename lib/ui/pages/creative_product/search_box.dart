part of '../pages.dart';

class SearchBoxProduct extends StatefulWidget {
  @override
  _SearchBoxProductState createState() => _SearchBoxProductState();
}

class _SearchBoxProductState extends State<SearchBoxProduct> {
  List<String> itemsSubsektor = [];
  List<int> selectedSubsektor = [];
  List<String> selectedSlug = [];

  bool isLoading = false;

  TextEditingController produk = TextEditingController();

  void getSubsector() async {
    var result = await SubsectorServices.getSubsectors();
    (result).asMap().forEach((index, value) {
      setState(() {
        itemsSubsektor.add(value.subSectorName);
      });
    });
  }

  void getSlug() async {
    for (var i in selectedSubsektor) {
      var slugy = Slugify(itemsSubsektor[i],delimiter: '_');
      setState(() {
        selectedSlug.add(slugy);
      });
    }
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
                    controller: produk,
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
                  selectedValue: selectedSubsektor,
                  hintText: "Subsektor",
                  items: itemsSubsektor,
                  onChanged: (value) {
                    setState(() {
                      selectedSubsektor = value;
                    });
                  },
                  closeButton: (newValue) {
                    return (newValue.isNotEmpty
                        ? "Simpan ${newValue.length == 1 ? '"' + itemsSubsektor[newValue.first].toString() + '"' : '(' + newValue.length.toString() + ')'}"
                        : "Close");
                  },
                ),
              ),
              SizedBox(height: 16),
              (!isLoading)
                  ? GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if (produk.text.trim() == "" &&
                            selectedSubsektor.length == 0) {
                          Flushbar(
                            icon: Icon(
                              Icons.info_outline,
                              size: 28.0,
                              color: Colors.yellow[300],
                            ),
                            duration: Duration(milliseconds: 2000),
                            flushbarPosition: FlushbarPosition.TOP,
                            flushbarStyle: FlushbarStyle.FLOATING,
                            // backgroundColor: Color(0xFFFF5C83),
                            borderRadius: 8,
                            margin: EdgeInsets.all(defaultMargin),
                            message: "Mohon isi salah satu kolom",
                          )..show(context);
                        } else {
                          getSlug();
                          print(selectedSlug);
                          context.bloc<ProductBloc>().add(FilterProduct(
                              produkName: produk.text,
                              subsector: selectedSlug));
                         
                          Get.back();
                          print(selectedSlug);
                        }
                         setState(() {
                            isLoading = false;
                          });
                      },
                      child: Container(
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
                          borderRadius:
                              BorderRadius.all(const Radius.circular(5.0)),
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
                    )
                  : SpinKitFadingCircle(
                      size: 50,
                      color: mainColorRed,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
