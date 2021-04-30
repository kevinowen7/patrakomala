part of '../pages.dart';

class Pcc extends StatefulWidget {
  @override
  _PccState createState() => _PccState();
}

class _PccState extends State<Pcc> {
  int _current = 0;
  final List<int> beritaItems = [1, 2, 3, 4, 5];
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
                  title: "PCC Corner",
                ),
                InkWell(
                  onTap: () {
                    Get.to(SearchBoxPcc());
                  },
                  child: NeuBorder(
                    mBot: 0,
                    mTop: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Text(
                            "Cari Pcc ...",
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
                SizedBox(
                  height: 20,
                ),
                // RaisedButton(
                //   onPressed: () {
                //     Get.to(PreLoginPage());
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultMargin),
                  child: Container(
                    // height: 266,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: BlocBuilder<AboutPccBloc, AboutPccState>(
                        builder: (_, apState) {
                      if (apState is AboutPccLoaded) {
                        ApiReturnValue<List<AboutPcc>> aboutPcc = apState.aPcc;
                        List<AboutPcc> aboutPccVal = aboutPcc.value;
                        return Text(
                          parse(aboutPccVal[0].text).documentElement.text +
                              '\n\n' +
                              parse(aboutPccVal[1].text).documentElement.text,
                          style: normalFontStyle.copyWith(
                            color: "333333".toColor(),
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.4),
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return SpinKitFadingCircle(
                            color: backgroundColorGrey, size: 50);
                      }
                    }),
                  ),
                ),
                LineBorder(),
                BlocBuilder<PccBloc, PccState>(
                  builder: (_, pState) {
                    if (pState is PccLoaded) {
                      initializeDateFormatting();
                      ApiReturnValue<List<PccModel>> pcc = pState.pcc;
                      List<PccModel> pccVal = pcc.value.sublist(0, 5);
                      return CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          height: 150,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        items: pccVal
                            .map((item) => InkWell(
                                  onTap: () {
                                    Get.to(PccDetail(item));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 140,
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) -
                                              40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 122,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl: item.gambar,
                                                    progressIndicatorBuilder: (context,
                                                            url,
                                                            downloadProgress) =>
                                                        Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Colors.black
                                                                      .withOpacity(
                                                                          0.61),
                                                                  Colors
                                                                      .blueAccent
                                                                      .withOpacity(
                                                                          0),
                                                                ],
                                                                begin: Alignment
                                                                    .bottomCenter,
                                                                end: Alignment
                                                                    .topCenter,
                                                              ),
                                                            ),
                                                            child: SpinKitFadingCircle(
                                                                color:
                                                                    backgroundColorGrey,
                                                                size: 50)),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15,
                                                    right: defaultMargin),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: (MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width) -
                                                            215,
                                                        child: Text(
                                                          item.namaEvent,
                                                          style: titleStyle,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Event - " +
                                                            DateFormat(
                                                                    " d MMMM yyyy",
                                                                    "id_ID")
                                                                .format(item
                                                                    .tanggal),
                                                        style: normalFontStyle,
                                                      ),
                                                      SizedBox(height: 10),
                                                      Container(
                                                        width: (MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width) -
                                                            220,
                                                        child: Text(
                                                          (item.eventDesc ==
                                                                  null)
                                                              ? '-'
                                                              : parse(item.eventDesc)
                                                                      .documentElement
                                                                      .text
                                                                      .substring(
                                                                          0,
                                                                          90) +
                                                                  '...',
                                                          style: normalFontStyle
                                                              .copyWith(
                                                                  color: "333333"
                                                                      .toColor(),
                                                                  fontSize: 12),
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    } else if (pState is PccFilterLoaded) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(
                            defaultMargin, defaultMargin, defaultMargin, 0),
                        height: 30,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              context.bloc<PccBloc>().add(FetchPcc());
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
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(6.0)),
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
                      return Center(
                          child: SpinKitFadingCircle(
                        color: backgroundColorGrey,
                        size: 50,
                      ));
                    }
                  },
                ),
                SizedBox(),

                // INDICATOR
                BlocBuilder<PccBloc, PccState>(
                  builder: (_, pState) {
                    if (pState is PccLoaded) {
                      ApiReturnValue<List<PccModel>> pcc = pState.pcc;
                      List<PccModel> pccVal = pcc.value;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pccVal
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
                                      (pccVal.indexOf(val) == _current)
                                          ? mainColorRed
                                          : "DFDFDF".toColor(),
                                      (pccVal.indexOf(val) == _current)
                                          ? mainColorRed
                                          : "FEFEFE".toColor(),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    } else if (pState is PccFilterLoaded) {
                      return SizedBox();
                    } else {
                      return SizedBox();
                    }
                  },
                ),

                SizedBox(
                  height: 15,
                ),

                BlocBuilder<PccBloc, PccState>(builder: (_, pState) {
                  if (pState is PccLoaded) {
                    return Column(
                      children: [
                        LineBorder(),
                        LineBorder(),
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                }),

                // LIST PCC
                BlocBuilder<PccBloc, PccState>(
                  builder: (_, pState) {
                    if (pState is PccLoaded) {
                      ApiReturnValue<List<PccModel>> pcc = pState.pcc;
                      List<PccModel> pccVal = pcc.value;
                      return Column(
                        children: pccVal
                            .map(
                              (e) => InkWell(
                                  onTap: () {
                                    Get.to(PccDetail(e));
                                  },
                                  child: ListPcc(e)),
                            )
                            .toList(),
                      );
                    } else if (pState is PccFilterLoaded) {
                      ApiReturnValue<List<PccModel>> pcc = pState.pcc;
                      List<PccModel> pccVal = pcc.value;
                      return Column(
                        children: pccVal
                            .map(
                              (e) => InkWell(
                                  onTap: () {
                                    Get.to(PccDetail(e));
                                  },
                                  child: ListPcc(e)),
                            )
                            .toList(),
                      );
                    } else {
                      return Center(
                          child: SpinKitFadingCircle(
                              color: backgroundColorGrey, size: 50));
                    }
                  },
                ),

                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
