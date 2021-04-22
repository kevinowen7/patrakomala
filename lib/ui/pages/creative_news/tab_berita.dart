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

        // SLIDER
        BlocBuilder<NewsBloc, NewsState>(builder: (_, newsState) {
          if (newsState is NewsLoaded) {
            ApiReturnValue<List<News>> news = newsState.news;
            List<News> newsValue = news.value.sublist(0, 5);
            return Container(
              height: 125,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newsValue.length,
                itemBuilder: (BuildContext ctx, int index) => InkWell(
                  onTap: () {
                    // context.bloc<NewsBloc>().add(FetchNewsDetail(newsValue[index].id));
                    Get.to(NewsDetail(newsValue[index]));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 122,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: newsValue[index].imgEvent[0],
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
                      Container(
                        margin: EdgeInsets.only(
                            left: 15,
                            right: (index == newsValue.length - 1) ? 0 : 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width) - 192,
                                child: Text(
                                  newsValue[index].title,
                                  maxLines: 2,
                                  style: titleStyle,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width) - 192,
                                child: Container(
                                  child: Text(
                                    parse(newsValue[index].description)
                                            .documentElement
                                            .text
                                            .substring(0, 130) +
                                        '...',
                                    style: normalFontStyle.copyWith(
                                        color: "333333".toColor()),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (newsState is NewsFilterLoaded) {
            return Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
              height: 30,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    context.bloc<NewsBloc>().add(FetchNews());
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
            return Center(child: SpinKitFadingCircle(color: backgroundColorGrey,size: 50));
          }
        }),
        SizedBox(
          height: 10,
        ),

        // DOT
        BlocBuilder<NewsBloc, NewsState>(builder: (_, newsState) {
          if (newsState is NewsLoaded) {
            ApiReturnValue<List<News>> news = newsState.news;
            List<News> newsValue = news.value.sublist(0, 5);
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: newsValue
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
            );
          } else if (newsState is NewsFilterLoaded) {
            ApiReturnValue<List<News>> news = newsState.news;
            List<News> newsValue = news.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: newsValue
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
            );
          } else {
            return SizedBox();
          }
        }),
        SizedBox(height: 23),

        BlocBuilder<NewsBloc, NewsState>(
          builder: (_, newState) {
            if (newState is NewsLoaded) {
              return Container(
                margin: EdgeInsets.only(left: defaultMargin),
                child: Text(
                  "Berita Lainnya",
                  style: titleStyle.copyWith(fontSize: 12),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),

        // LIST BERITA
        BlocBuilder<NewsBloc, NewsState>(builder: (_, newsState) {
          if (newsState is NewsLoaded) {
            ApiReturnValue<List<News>> news = newsState.news;
            List<News> newsValue = news.value.sublist(2, news.value.length - 1);
            return Column(
              children: newsValue
                  .map(
                    (val) => InkWell(
                      onTap: () {
                        Get.to(NewsDetail(val));
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              children: [
                                Container(
                                  height: 77,
                                  width: 91,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: val.imgEvent[0],
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.black
                                                        .withOpacity(0.61),
                                                    Colors.blueAccent
                                                        .withOpacity(0),
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                              child: SpinKitFadingCircle(
                                                  color: backgroundColorGrey,
                                                  size: 50)),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 15, right: defaultMargin),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) -
                                            172,
                                        child: Text(
                                          val.title,
                                          maxLines: 2,
                                          style: titleStyle,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) -
                                            172,
                                        child: Text(
                                          parse(val.description)
                                                  .documentElement
                                                  .text
                                                  .substring(0, 130) +
                                              '...',
                                          style: normalFontStyle.copyWith(
                                              fontSize: 12,
                                              color: "333333".toColor()),
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
                      ),
                    ),
                  )
                  .toList(),
            );
          } else if (newsState is NewsFilterLoaded) {
            ApiReturnValue<List<News>> news = newsState.news;
            List<News> newsValue = news.value;
            return Column(
              children: newsValue
                  .map(
                    (val) => InkWell(
                      onTap: () {
                        Get.to(NewsDetail(val));
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              children: [
                                Container(
                                  height: 77,
                                  width: 91,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: val.imgEvent[0],
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.black
                                                        .withOpacity(0.61),
                                                    Colors.blueAccent
                                                        .withOpacity(0),
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                              child: SpinKitFadingCircle(
                                                  color: backgroundColorGrey,
                                                  size: 50)),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 15, right: defaultMargin),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) -
                                            172,
                                        child: Text(
                                          val.title,
                                          maxLines: 2,
                                          style: titleStyle,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) -
                                            172,
                                        child: Text(
                                          parse(val.description)
                                                  .documentElement
                                                  .text
                                                  .substring(0, 130) +
                                              '...',
                                          style: normalFontStyle.copyWith(
                                              fontSize: 12,
                                              color: "333333".toColor()),
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
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: SpinKitFadingCircle(color: backgroundColorGrey, size: 50));
          }
        }),
        SizedBox(height: 100),
      ],
    );
  }
}
