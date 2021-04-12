part of '../pages.dart';

class ListPcc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
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
                      "Contoh Arikel",
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
