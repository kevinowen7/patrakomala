part of '../pages.dart';

class TabProfil extends StatelessWidget {
  final Bisnis bisnis;
  final String fasilitas;
  final List marketplace;
  TabProfil(this.bisnis, this.fasilitas, this.marketplace);

  Widget marketPlaceButton() {
    return PopupMenuButton(
        // color: Colors.transparent,
        child: Text("Beli Produk",
            style: normalFontStyle.copyWith(
                color: mainColorRed, fontSize: 14, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center),
        onSelected: (value) async {
          await launch(value);
        },
        itemBuilder: (context) {
          var list = List<PopupMenuEntry<Object>>();
          for (var i in marketplace) {
            list.add(
              PopupMenuItem(
                  value: i['id'],
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Image.network(i['imageUrl'], height: 40),
                      ),
                      Text('Playstore'),
                    ],
                  )),
            );
          }

          return list;
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BisnisBloc, BisnisState>(
      builder: (_, bState) {
        if (bState is BisnisLoaded) {
          ApiReturnValue<Bisnis> bisnis = bState.bisnis;
          Bisnis bisnisValue = bisnis.value;
          return Column(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    bisnisValue.perusahaanNm,
                                    style: titleStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IconWithText(
                            icon: FontAwesome.building,
                            text: fasilitas,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          IconWithText(
                            icon: FontAwesome.map_marker,
                            text: bisnisValue.perusahaanAlamat,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          IconWithText(
                            icon: FontAwesome.clock_o,
                            text: ((bisnisValue.jamBuka != null)
                                    ? bisnisValue.jamBuka
                                    : ' - ') +
                                ((bisnisValue.jamTutup != null)
                                    ? bisnisValue.jamTutup
                                    : ''),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          IconWithText(
                            icon: FontAwesome.phone,
                            text: bisnisValue.perusahaanNoTelp,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // GestureDetector(
                          //   onTap: () async {
                          //     await launch(
                          //         'https://www.figma.com/file/6n3L6wYhcbhRsHy6Bx4cPi/Patrakomala-v2?node-id=116%3A579');
                          //   },
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Website ",
                          //         style: normalFontStyle.copyWith(
                          //             decoration: TextDecoration.underline,
                          //             color: mainColorRed),
                          //       ),
                          //       Icon(
                          //         FontAwesome.external_link,
                          //         size: 15,
                          //         color: mainColorRed,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 20),
                          Container(
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
                            child: (marketplace != null)
                                ? Center(
                                    child: FlatButton(
                                      color: Colors.transparent,
                                      onPressed: null,
                                      child: Container(
                                        width: double.infinity,
                                        child: marketPlaceButton(),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LineBorder(),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(defaultMargin),
                  child: Text(
                    (bisnisValue.perusahaanDesc != null)
                        ? bisnisValue.perusahaanDesc
                        : '',
                    style: normalFontStyle,
                    textAlign: TextAlign.left,
                  )),
            ],
          );
        } else {
          return SpinKitFadingCircle(color: backgroundColorGrey, size: 50);
        }
      },
    );
  }
}
