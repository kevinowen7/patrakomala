part of '../pages.dart';

class NewsDetail extends StatelessWidget {
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
                  title: "Berita",
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      defaultMargin, 8, defaultMargin, defaultMargin),
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.bisnis-cdn.com/posts/2021/02/11/1355396/antarafoto-penerapan-psbb-di-bandung-raya-170420-agr-2a.jpg'),
                        fit: BoxFit.cover,
                      )),
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
                    "Contoh Artikel",
                    style: blackfontStyle1.copyWith(
                        color: "333333".toColor(),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(defaultMargin),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker \n\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\n\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker\n\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker ",
                      style:
                          normalFontStyle.copyWith(color: "333333".toColor()),
                      textAlign: TextAlign.left,
                    )),
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
