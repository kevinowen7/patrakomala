part of '../pages.dart';

class NewsDetail extends StatelessWidget {
  final News news;
  NewsDetail(this.news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: 60,
                ),
                CarouselSlider(
                  items: news.imgEvent.map((fileImage) {
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
                SizedBox(
                  height: 20,
                ),
                LineBorder(),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    news.title,
                    style: blackfontStyle1.copyWith(
                        color: "333333".toColor(),
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(defaultMargin),
                    child: Text(
                      parse(news.description).documentElement.text,
                      style:
                          normalFontStyle.copyWith(color: "333333".toColor()),
                      textAlign: TextAlign.left,
                    )),
              ],
            ),
            Positioned(
              child: CustomHeader(
                backButton: () {
                  Get.back();
                },
                title: "Berita",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
