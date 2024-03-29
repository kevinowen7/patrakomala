part of '../pages.dart';

class CreativeEvent extends StatefulWidget {
  @override
  _CreativeEventState createState() => _CreativeEventState();
}

class _CreativeEventState extends State<CreativeEvent> {
  List<int> beritaItems = [1, 2, 3];
  int _current = 0;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          ListView(children: [
            SizedBox(height: 60),
            InkWell(
              onTap: () {
                Get.to(SearchBoxAcara());
              },
              child: NeuBorder(
                mTop: 0,
                mBot: 28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Text(
                        "Cari Event ...",
                        style: normalFontStyle.copyWith(
                            color: Colors.grey, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: defaultMargin),
                      child: Icon(Icons.search, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            BlocBuilder<AcaraBloc, AcaraState>(builder: (_, aState) {
              if (aState is AcaraFilterLoaded) {
                return Container(
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
                  height: 30,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        context.bloc<AcaraBloc>().add(FetchAcara());
                      },
                      child: Container(
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
                                  'Reset Filter',
                                  style: normalFontStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: mainColorRed),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            }),
            BlocBuilder<AcaraBloc, AcaraState>(builder: (_, aState) {
              if (aState is AcaraLoaded) {
                initializeDateFormatting();
                ApiReturnValue<List<Acara>> acara = aState.acara;
                int maxItem = acara.value.length - 1;
                int start = 0;
                int end = 10;
                List<Acara> valAcara = (maxItem > 10)
                    ? acara.value.sublist(start, end)
                    : acara.value;

                return CarouselSlider(
                  options: CarouselOptions(
                    height: (MediaQuery.of(context).size.height) - 350,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.9,
                    initialPage: 0,
                  ),
                  items: valAcara
                      .map((item) => InkWell(
                            onTap: () {
                              Get.to(EventDetail(item));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  Container(
                                    // margin:
                                    // EdgeInsets.only(right: defaultMargin),
                                    height:
                                        (MediaQuery.of(context).size.height) -
                                            350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: item.imgEvent[0],
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                SpinKitFadingCircle(
                                                    color: backgroundColorGrey,
                                                    size: 50),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // margin:
                                    //     EdgeInsets.only(right: defaultMargin),
                                    height:
                                        (MediaQuery.of(context).size.height) -
                                            350,
                                    width: (MediaQuery.of(context).size.width) -
                                        40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
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
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: defaultMargin,
                                          ),
                                          child: Text(
                                            item.title,
                                            style: titleStyle.copyWith(
                                              color: "FEFEFE".toColor(),
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: defaultMargin,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Event -",
                                                  style: titleStyle.copyWith(
                                                    color: "F9F370".toColor(),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat(" d MMMM yyyy",
                                                          "id_ID")
                                                      .format(item.startDate),
                                                  style: titleStyle.copyWith(
                                                    color: "FEFEFE".toColor(),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: defaultMargin,
                                          ),
                                          child: Text(
                                            (item.description.length < 100)
                                                ? parse(item.description)
                                                    .documentElement
                                                    .text
                                                : parse(item.description)
                                                        .documentElement
                                                        .text
                                                        .substring(0, 100) +
                                                    '...',
                                            style: normalFontStyle.copyWith(
                                              color: "FEFEFE".toColor(),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                );
              } else if (aState is AcaraFilterLoaded) {
                initializeDateFormatting();
                ApiReturnValue<List<Acara>> acara = aState.acara;
                List<Acara> valAcara = acara.value;
                return CarouselSlider(
                  options: CarouselOptions(
                    height: (MediaQuery.of(context).size.height) - 350,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: 0,
                  ),
                  items: valAcara
                      .map((item) => InkWell(
                            onTap: () {
                              Get.to(EventDetail(item));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  Container(
                                    // margin:
                                    // EdgeInsets.only(right: defaultMargin),
                                    height:
                                        (MediaQuery.of(context).size.height) -
                                            350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: item.imgEvent[0],
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                SpinKitFadingCircle(
                                                    color: backgroundColorGrey,
                                                    size: 50),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // margin:
                                    //     EdgeInsets.only(right: defaultMargin),
                                    height:
                                        (MediaQuery.of(context).size.height) -
                                            350,
                                    width: (MediaQuery.of(context).size.width) -
                                        40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
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
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: defaultMargin,
                                          ),
                                          child: Text(
                                            item.title,
                                            style: titleStyle.copyWith(
                                              color: "FEFEFE".toColor(),
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: defaultMargin,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Event -",
                                                  style: titleStyle.copyWith(
                                                    color: "F9F370".toColor(),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat(" d MMMM yyyy",
                                                          "id_ID")
                                                      .format(item.startDate),
                                                  style: titleStyle.copyWith(
                                                    color: "FEFEFE".toColor(),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: defaultMargin,
                                          ),
                                          child: Text(
                                            (item.description.length < 100)
                                                ? parse(item.description)
                                                    .documentElement
                                                    .text
                                                : parse(item.description)
                                                        .documentElement
                                                        .text
                                                        .substring(0, 100) +
                                                    '...',
                                            style: normalFontStyle.copyWith(
                                              color: "FEFEFE".toColor(),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                );
              } else {
                return Center(
                  child: SpinKitFadingCircle(
                    color: backgroundColorGrey,
                    size: 50,
                  ),
                );
              }
            }),
            SizedBox(
              height: 15,
            ),
            BlocBuilder<AcaraBloc, AcaraState>(
              builder: (_, aState) {
                if (aState is AcaraLoaded) {
                  ApiReturnValue<List<Acara>> acara = aState.acara;
                  int maxItem = acara.value.length - 1;
                  List<Acara> valAcara =
                      (maxItem > 10) ? acara.value.sublist(0, 3) : acara.value;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: valAcara
                        .map(
                          (val) => Container(
                            height: 10,
                            width: 10,
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Color(0xFFFFFFFF),
                                  offset: Offset(0.0, -1.0),
                                  blurRadius: 2.0,
                                ),
                                BoxShadow(
                                  color: Color(0xFFCACACA),
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 2.0,
                                ),
                                BoxShadow(
                                  color: Color.fromRGBO(51, 51, 51, 0.16),
                                  offset: Offset(0, 0.0),
                                  blurRadius: 0.0,
                                ),
                              ],
                              gradient: LinearGradient(
                                begin: Alignment(0.0, 0.0),
                                end: Alignment(0.996, 0.092),
                                colors: [
                                  (valAcara.indexOf(val) == _current)
                                      ? mainColorRed
                                      : "DFDFDF".toColor(),
                                  (valAcara.indexOf(val) == _current)
                                      ? mainColorRed
                                      : "FEFEFE".toColor(),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                } else if (aState is AcaraFilterLoaded) {
                  ApiReturnValue<List<Acara>> acara = aState.acara;
                  List<Acara> valAcara = acara.value;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: valAcara
                        .map(
                          (val) => Container(
                            height: 10,
                            width: 10,
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Color(0xFFFFFFFF),
                                  offset: Offset(0.0, -1.0),
                                  blurRadius: 2.0,
                                ),
                                BoxShadow(
                                  color: Color(0xFFCACACA),
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 2.0,
                                ),
                                BoxShadow(
                                  color: Color.fromRGBO(51, 51, 51, 0.16),
                                  offset: Offset(0, 0.0),
                                  blurRadius: 0.0,
                                ),
                              ],
                              gradient: LinearGradient(
                                begin: Alignment(0.0, 0.0),
                                end: Alignment(0.996, 0.092),
                                colors: [
                                  (valAcara.indexOf(val) == _current)
                                      ? mainColorRed
                                      : "DFDFDF".toColor(),
                                  (valAcara.indexOf(val) == _current)
                                      ? mainColorRed
                                      : "FEFEFE".toColor(),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ]),
          Positioned(
            child: CustomHeader(
              title: "Events",
            ),
          )
        ],
      )),
    );
  }
}
