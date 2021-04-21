part of '../pages.dart';

class SearchBoxCreativeNews extends StatefulWidget {
  @override
  _SearchBoxCreativeNewsState createState() => _SearchBoxCreativeNewsState();
}

class _SearchBoxCreativeNewsState extends State<SearchBoxCreativeNews> {
  bool isLoading = false;
  TextEditingController judul = TextEditingController();

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
                    controller: judul,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Cari Berita ...",
                      hintStyle: normalFontStyle.copyWith(
                          color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              (!isLoading)
                  ? GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if (judul.text.trim() == "") {
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
                          context.bloc<NewsBloc>().add(FilterNews(judul.text));
                          Get.back();
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
