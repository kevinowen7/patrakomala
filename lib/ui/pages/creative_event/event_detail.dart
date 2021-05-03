part of '../pages.dart';

class EventDetail extends StatefulWidget {
  final Acara acara;
  EventDetail(this.acara);
  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(height: 60),
                CarouselSlider(
                  items: widget.acara.imgEvent.map((fileImage) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: fileImage,
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
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    widget.acara.title,
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
                                .format(widget.acara.startDate),
                          ),
                          IconWithText(
                            isRow: 'yes',
                            icon: Icons.more_time,
                            text:
                                "${(widget.acara.startTime == null) ? ' ' : widget.acara.startTime.substring(0, 5)} - ${(widget.acara.endTime == null) ? ' Selesai ' : widget.acara.endTime.substring(0, 5)}",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      IconWithText(
                        icon: Icons.location_pin,
                        text: widget.acara.takePlace,
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
                      (widget.acara.description == null)
                          ? '-'
                          : parse(widget.acara.description)
                              .documentElement
                              .text,
                      style:
                          normalFontStyle.copyWith(color: "333333".toColor()),
                      textAlign: TextAlign.left,
                    )),
                SizedBox(height: 100),
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
                          Add2Calendar.addEvent2Cal(Event(
                            title: widget.acara.title,
                            description: widget.acara.description,
                            location: (widget.acara.takePlace == null)
                                ? '-'
                                : widget.acara.takePlace,
                            startDate: widget.acara.startDate,
                            endDate: widget.acara.endDate,
                          )).then((success) {
                            print('event added!');
                          });
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
                            "Reminder Me",
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
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: CustomHeader(
                backButton: () {
                  Get.back();
                },
                title: "Events",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
