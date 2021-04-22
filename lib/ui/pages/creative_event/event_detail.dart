part of '../pages.dart';

class EventDetail extends StatelessWidget {
  final Acara acara;
  EventDetail(this.acara);
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
                  title: "Events",
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      defaultMargin, 8, defaultMargin, defaultMargin),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            acara.imgEvent[0]),
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    acara.title,
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
                                .format(acara.startDate),
                          ),
                          IconWithText(
                            isRow: 'yes',
                            icon: Icons.more_time,
                            text:
                                "${acara.startTime.substring(0, 5)} - ${acara.endTime.substring(0, 5)}",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      IconWithText(
                        icon: Icons.location_pin,
                        text: acara.takePlace,
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
                      parse(acara.description).documentElement.text,
                      style:
                          normalFontStyle.copyWith(color: "333333".toColor()),
                      textAlign: TextAlign.left,
                    )),
                    SizedBox(height:100),
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
                            child: Text(
                          "Join",
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
            )
          ],
        ),
      ),
    );
  }
}
