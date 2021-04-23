part of '../pages.dart';

class ListPcc extends StatelessWidget {
  final PccModel pcc;
  ListPcc(this.pcc);
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: pcc.gambar,
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
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width) - 170,
                      child: Text(
                        pcc.namaEvent,
                        style: titleStyle,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: (MediaQuery.of(context).size.width) - 172,
                      child: Text(
                        (pcc.eventDesc == null)
                            ? '-'
                            : parse(pcc.eventDesc)
                                    .documentElement
                                    .text
                                    .substring(0, 60) +
                                '...',
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
