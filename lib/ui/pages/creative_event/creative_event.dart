part of '../pages.dart';

class CreativeEvent extends StatefulWidget {
  @override
  _CreativeEventState createState() => _CreativeEventState();
}

class _CreativeEventState extends State<CreativeEvent> {
  List<int> beritaItems = [1, 2, 3];
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
                mTop: 10,
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
            Container(
              // width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: (MediaQuery.of(context).size.height) - 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.red,
              ),
              child: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                itemCount: beritaItems.length,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(EventDetail());
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: ((beritaItems.length - 1) == index)
                                ? 0
                                : defaultMargin),
                        height: (MediaQuery.of(context).size.height) - 350,
                        width: (MediaQuery.of(context).size.width) - 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/03/29/1571813690.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultMargin,
                              ),
                              child: Text(
                                "Ngabuburinding 2019",
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
                                      " 12 April 2019",
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
                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical ...",
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
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: beritaItems
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
                            "DFDFDF".toColor(),
                            "FEFEFE".toColor(),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ])
        ],
      )),
    );
  }
}
