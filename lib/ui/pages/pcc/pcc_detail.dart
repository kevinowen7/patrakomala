part of '../pages.dart';

class PccDetail extends StatefulWidget {
  final PccModel pcc;
  PccDetail(this.pcc);
  @override
  _PccDetailState createState() => _PccDetailState();
}

class _PccDetailState extends State<PccDetail> {
  @override
  // Widget imageCarousel = new Container(
  //   height: 200,
  //   child: Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     margin: EdgeInsets.symmetric(horizontal: defaultMargin),
  //     child: Carousel(
  //       boxFit: BoxFit.cover,
  //       images: [
  //         NetworkImage(
  //             'https://www.seva.id/wp-content/uploads/2019/07/ARS09649.jpg'),
  //         NetworkImage('https://pbs.twimg.com/media/DgThe9gXUAIeAkk.jpg'),
  //       ],
  //       autoplay: true,
  //       dotSize: 4.0,
  //       borderRadius: true,
  //       indicatorBgPadding: 2.0,
  //     ),
  //   ),
  // );
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
                  title: "Pcc Corner",
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      defaultMargin, 8, defaultMargin, defaultMargin),
                  width: double.infinity,
                  height: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.pcc.gambar,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.61),
                                      Colors.blueAccent.withOpacity(0),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                child: SpinKitFadingCircle(
                                    color: backgroundColorGrey, size: 50)),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    widget.pcc.namaEvent,
                    style: blackfontStyle1.copyWith(
                        color: "333333".toColor(),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                LineBorder(),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconWithText(
                            isRow: 'yes',
                            icon: Icons.calendar_today_rounded,
                            text: DateFormat(" d MMMM yyyy", "id_ID")
                                .format(widget.pcc.tanggal),
                          ),
                          // IconWithText(
                          //   isRow: 'yes',
                          //   icon: Icons.more_time,
                          //   text: "03.00 - 10.00",
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      IconWithText(
                        icon: Icons.location_pin,
                        text: widget.pcc.tempat,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                LineBorder(),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    "Keterangan",
                    style: blackfontStyle1.copyWith(
                        color: "333333".toColor(),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(defaultMargin),
                    child: Text(
                      parse(widget.pcc.eventDesc).documentElement.text,
                      style:
                          normalFontStyle.copyWith(color: "333333".toColor()),
                      textAlign: TextAlign.left,
                    )),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: defaultMargin),
                //   child: Text(
                //     "Arsip Kegiatan",
                //     style: blackfontStyle1.copyWith(
                //         color: "333333".toColor(),
                //         fontWeight: FontWeight.w600,
                //         fontSize: 20),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // LineBorder(),
                // SizedBox(
                //   height: 15,
                // ),
                // // imageCarousel,
                // SizedBox(height: 120),
              ],
            ),

            // BUTTON BOTTOM
            Positioned(
              bottom: 0,
              child: InkWell(
                onTap: () async {
                  await launch(
                      'https://patrakomala.disbudpar.bandung.go.id/id');
                },
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
                        Container(
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
                            "Reservasi",
                            style: normalFontStyle.copyWith(
                                color: mainColorRed,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
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
