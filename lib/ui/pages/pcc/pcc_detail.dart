part of '../pages.dart';

class PccDetail extends StatefulWidget {
  @override
  _PccDetailState createState() => _PccDetailState();
}

class _PccDetailState extends State<PccDetail> {
  @override
  Widget imageCarousel = new Container(
    height: 200,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          NetworkImage(
              'https://www.seva.id/wp-content/uploads/2019/07/ARS09649.jpg'),
          NetworkImage('https://pbs.twimg.com/media/DgThe9gXUAIeAkk.jpg'),
        ],
        autoplay: true,
        dotSize: 4.0,
        borderRadius: true,
        indicatorBgPadding: 2.0,
      ),
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
                  title: "Pcc Corner",
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      defaultMargin, 8, defaultMargin, defaultMargin),
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/03/29/1571813690.png'),
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    "Ngabuburinding 2019",
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
                            text: "7 Mei 2019",
                          ),
                          IconWithText(
                            isRow: 'yes',
                            icon: Icons.more_time,
                            text: "03.00 - 10.00",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      IconWithText(
                        icon: Icons.location_pin,
                        text: "JL Siliwangi 8 Simpang Dago",
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
                    "Contoh Artikel",
                    style: blackfontStyle1.copyWith(
                        color: "333333".toColor(),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(defaultMargin),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker \n\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\n\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\n\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker ",
                      style:
                          normalFontStyle.copyWith(color: "333333".toColor()),
                      textAlign: TextAlign.left,
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    "Arsip Kegiatan",
                    style: blackfontStyle1.copyWith(
                        color: "333333".toColor(),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                LineBorder(),
                SizedBox(
                  height: 15,
                ),
                imageCarousel,
                SizedBox(height: 120),
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
