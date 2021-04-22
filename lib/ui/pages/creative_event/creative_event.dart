part of '../pages.dart';

class CreativeEvent extends StatefulWidget {
  @override
  _CreativeEventState createState() => _CreativeEventState();
}

class _CreativeEventState extends State<CreativeEvent> {
  List<int> beritaItems = [1, 2, 3];
  int _current;
  List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

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
            CustomHeader(
              title: "Events",
            ),
            InkWell(
              onTap: () {
                Get.to(SearchBoxCreativeEvent());
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
              if (aState is AcaraLoaded) {
                initializeDateFormatting();
                ApiReturnValue<List<Acara>> acara = aState.acara;
                List<Acara> valAcara = acara.value;
                return CarouselSlider(
                  height: (MediaQuery.of(context).size.height) - 350,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                      print("${_current}");
                    });
                  },
                  items: valAcara
                      .map((item) => InkWell(
                            onTap: () {
                              Get.to(EventDetail(item));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: defaultMargin),
                                    height:
                                        (MediaQuery.of(context).size.height) -
                                            350,
                                    width: (MediaQuery.of(context).size.width) -
                                        40,
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
                                                SpinKitRipple(
                                                    color: mainColorRed,
                                                    size: 50),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: defaultMargin),
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
                                                  DateFormat(
                                                          " d MMMM yyyy",
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
                                            parse(item.description)
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
          ])
        ],
      )),
    );
  }
}
