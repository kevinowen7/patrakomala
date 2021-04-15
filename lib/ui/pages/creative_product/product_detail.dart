part of '../pages.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail(this.product);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  String ytUrl;

  @override
  void initState(){
    setState(() {
      ytUrl = widget.product.produkUrl;
    });
    super.initState();
  }

  Widget myPopMenu() {
    return PopupMenuButton(
        child: Icon(Icons.share),
        onSelected: (value) {
          Fluttertoast.showToast(
              msg: "You have selected " + value.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(
                          FontAwesome.facebook,
                          color: Colors.blue,
                        ),
                      ),
                      Text('Facebook')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                          child: Icon(FontAwesome.twitter,
                              color: Colors.lightBlue)),
                      Text('Twitter')
                    ],
                  )),
              PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(FontAwesome.whatsapp, color: Colors.green),
                      ),
                      Text('WhatsApp')
                    ],
                  )),
            ]);
  }

  Widget marketPlaceButton() {
    return PopupMenuButton(
        // color: Colors.transparent,
        child: Text("Beli Produk",
            style: normalFontStyle.copyWith(
                color: mainColorRed, fontSize: 14, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center),
        onSelected: (value) {
          Fluttertoast.showToast(
              msg: "You have selected " + value.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Image.asset('assets/images/lazada.jpg',
                            width: 20, height: 20),
                      ),
                      Text('Lazada')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Image.asset('assets/images/tokped.png',
                            width: 20, height: 20),
                      ),
                      Text('Tokopedia')
                    ],
                  )),
              PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Image.asset('assets/images/shopee.png',
                            width: 20, height: 20),
                      ),
                      Text('Shopee')
                    ],
                  )),
            ]);
  }
  
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: ytUrl,
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                CustomHeader(
                  backButton: () {
                    Get.back();
                  },
                  title: "Produk",
                ),
                (widget.product.produkImg == null) ? 
                Container(
                  margin: EdgeInsets.fromLTRB(
                      defaultMargin, 8, defaultMargin, defaultMargin),
                  width: double.infinity,
                  height: 200,
                  child: YoutubePlayer(
                    controller: _controller,
                    liveUIColor: Colors.amber,
                  ),
                ) :
                Container(
                  margin: EdgeInsets.fromLTRB(
                      defaultMargin, 8, defaultMargin, defaultMargin),
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.bisnis-cdn.com/posts/2021/02/11/1355396/antarafoto-penerapan-psbb-di-bandung-raya-170420-agr-2a.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              100,
                          child: Text(
                            widget.product.produkNm,
                            style: blackfontStyle1.copyWith(
                                color: "333333".toColor(),
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Color(0xFFFFFFFF),
                                  offset: Offset(0.0, -1.0),
                                  blurRadius: 4.0,
                                ),
                                BoxShadow(
                                  color: Color(0xFFDFDFDF),
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 4.0,
                                ),
                              ],
                              color: Color(0xFFFEFEFE),
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(6.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: 80,
                                child: Center(
                                  child: Text(
                                    widget.product.subsector,
                                    style: normalFontStyle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: "D51E5A".toColor()),
                                  ),
                                ),
                              ),
                            )),
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                LineBorder(),
                SizedBox(height: 20),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: defaultMargin),
                //   child: Text(
                //     "Contoh Artikel",
                //     style: blackfontStyle1.copyWith(
                //         color: "333333".toColor(),
                //         fontWeight: FontWeight.w500,
                //         fontSize: 17),
                //   ),
                // ),
                Container(
                    margin: EdgeInsets.all(defaultMargin),
                    child: Text(
                      widget.product.produkDesc,
                      style:
                          normalFontStyle.copyWith(color: "333333".toColor()),
                      textAlign: TextAlign.left,
                    )),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(254, 254, 254, 0.4),
                      offset: Offset(0, -4),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(WorkshopDetail());
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          height: 40,
                          width: (MediaQuery.of(context).size.width) - 70,
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
                            "Lihat Profil Usaha",
                            style: normalFontStyle.copyWith(
                                color: mainColorRed,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        height: 40,
                        width: (MediaQuery.of(context).size.width) - 70,
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
                          child: FlatButton(
                            color: Colors.transparent,
                            onPressed: null,
                            child: Container(
                              width: double.infinity,
                              child: marketPlaceButton(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}

