part of '../pages.dart';

class PublicDetail extends StatefulWidget {
  final Publikasi publikasi;
  PublicDetail(this.publikasi);
  @override
  _PublicDetailState createState() => _PublicDetailState();
}

class _PublicDetailState extends State<PublicDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: 80,
                ),
                Center(
                    child: Text(widget.publikasi.title,
                        style: titleStyle.copyWith(fontSize: 18))),
                SizedBox(
                  height: 10,
                ),
                LineBorder(),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    "Deskripsi",
                    style: blackfontStyle1.copyWith(
                        color: "333333".toColor(),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    print(
                        'https://patrakomala.disbudpar.bandung.go.id/uploads/event_news/documents/' +
                            widget.publikasi.documents);
                    Get.to(PdfView(
                        'https://patrakomala.disbudpar.bandung.go.id/uploads/event_news/documents/' +
                            widget.publikasi.documents));
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
                      "Lihat Dokumen",
                      style: normalFontStyle.copyWith(
                          color: mainColorRed,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(defaultMargin),
                    child: Text(
                      parse(widget.publikasi.description).documentElement.text,
                      style:
                          normalFontStyle.copyWith(color: "333333".toColor()),
                      textAlign: TextAlign.left,
                    )),
              ],
            ),
            Positioned(
              child: CustomHeader(
                backButton: () {
                  Get.back();
                },
                title: "Publikasi",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
