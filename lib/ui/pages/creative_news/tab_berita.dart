part of '../pages.dart';

class TabBerita extends StatelessWidget {
  final List<int> beritaItems = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.to(SearchBoxCreativeNews());
          },
          child: NeuBorder(
            mBot: 0,
            mTop: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    "Cari Berita ...",
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
        SizedBox(height: 40),
        Container(
          height: 125,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: beritaItems.length,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                Get.to(NewsDetail());
              },
              child: Row(
                children: [
                  Container(
                    height: 122,
                    width: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/03/29/1571813690.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: defaultMargin),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contoh Berita",
                            style: titleStyle,
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: (MediaQuery.of(context).size.width) - 192,
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                              style: normalFontStyle.copyWith(
                                  color: "333333".toColor()),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
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
        SizedBox(height: 23),
        Container(
          margin: EdgeInsets.only(left: defaultMargin),
          child: Text(
            "Berita Lainnya",
            style: titleStyle.copyWith(fontSize: 12),
          ),
        ),

        // LIST BERITA
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Container(
                height: 77,
                width: 91,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2021/04/06/teror-pelemparan-batu-di-bandung_169.jpeg?w=620"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contoh Berita",
                      style: titleStyle,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: (MediaQuery.of(context).size.width) - 172,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                        style: normalFontStyle.copyWith(
                            fontSize: 12, color: "333333".toColor()),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        LineBorder(),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Container(
                height: 77,
                width: 91,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2021/04/06/teror-pelemparan-batu-di-bandung_169.jpeg?w=620"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contoh Berita",
                      style: titleStyle,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: (MediaQuery.of(context).size.width) - 172,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                        style: normalFontStyle.copyWith(
                            fontSize: 12, color: "333333".toColor()),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        LineBorder(),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Container(
                height: 77,
                width: 91,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2021/04/06/teror-pelemparan-batu-di-bandung_169.jpeg?w=620"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contoh Berita",
                      style: titleStyle,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: (MediaQuery.of(context).size.width) - 172,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                        style: normalFontStyle.copyWith(
                            fontSize: 12, color: "333333".toColor()),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        LineBorder(),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Container(
                height: 77,
                width: 91,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2021/04/06/teror-pelemparan-batu-di-bandung_169.jpeg?w=620"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contoh Berita",
                      style: titleStyle,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: (MediaQuery.of(context).size.width) - 172,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                        style: normalFontStyle.copyWith(
                            fontSize: 12, color: "333333".toColor()),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        LineBorder(),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Container(
                height: 77,
                width: 91,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2021/04/06/teror-pelemparan-batu-di-bandung_169.jpeg?w=620"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contoh Berita",
                      style: titleStyle,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: (MediaQuery.of(context).size.width) - 172,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                        style: normalFontStyle.copyWith(
                            fontSize: 12, color: "333333".toColor()),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        LineBorder(),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Container(
                height: 77,
                width: 91,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2021/04/06/teror-pelemparan-batu-di-bandung_169.jpeg?w=620"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contoh Berita",
                      style: titleStyle,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: (MediaQuery.of(context).size.width) - 172,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                        style: normalFontStyle.copyWith(
                            fontSize: 12, color: "333333".toColor()),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        LineBorder(),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Container(
                height: 77,
                width: 91,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2021/04/06/teror-pelemparan-batu-di-bandung_169.jpeg?w=620"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contoh Berita",
                      style: titleStyle,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: (MediaQuery.of(context).size.width) - 172,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                        style: normalFontStyle.copyWith(
                            fontSize: 12, color: "333333".toColor()),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        LineBorder(),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Container(
                height: 77,
                width: 91,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2021/04/06/teror-pelemparan-batu-di-bandung_169.jpeg?w=620"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contoh Berita",
                      style: titleStyle,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: (MediaQuery.of(context).size.width) - 172,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                        style: normalFontStyle.copyWith(
                            fontSize: 12, color: "333333".toColor()),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        LineBorder(),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Container(
                height: 77,
                width: 91,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://awsimages.detik.net.id/community/media/visual/2021/04/06/teror-pelemparan-batu-di-bandung_169.jpeg?w=620"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contoh Berita",
                      style: titleStyle,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: (MediaQuery.of(context).size.width) - 172,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                        style: normalFontStyle.copyWith(
                            fontSize: 12, color: "333333".toColor()),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        LineBorder(),
      ],
    );
  }
}
