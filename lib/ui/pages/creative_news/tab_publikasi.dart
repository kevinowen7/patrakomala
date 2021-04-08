part of '../pages.dart';

class TabPublikasi extends StatelessWidget {
  final List<int> beritaItems = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      NeuBorder(
        mBot: 0,
        mTop: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Text(
                "Cari Publikasi ...",
                style:
                    normalFontStyle.copyWith(color: Colors.grey, fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: defaultMargin),
              child: Icon(Icons.search, color: Colors.grey),
            )
          ],
        ),
      ),

      // List Publikasi
      SizedBox(height: 20),
      InkWell(
        onTap: () {
          Get.to(PublicDetails());
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("PERDA No. 1 Tahun 2019", style: titleStyle),
              SizedBox(height: 5),
              Text("Tahun Terbit 2019",
                  style: normalFontStyle.copyWith(
                      color: "777777".toColor(), fontSize: 12)),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      LineBorder(),
      SizedBox(height: 20),
      Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("PERDA No. 1 Tahun 2019", style: titleStyle),
            SizedBox(height: 5),
            Text("Tahun Terbit 2019",
                style: normalFontStyle.copyWith(
                    color: "777777".toColor(), fontSize: 12)),
            SizedBox(height: 10),
          ],
        ),
      ),
      LineBorder(),
      SizedBox(height: 20),
      Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("PERDA No. 1 Tahun 2019", style: titleStyle),
            SizedBox(height: 5),
            Text("Tahun Terbit 2019",
                style: normalFontStyle.copyWith(
                    color: "777777".toColor(), fontSize: 12)),
            SizedBox(height: 10),
          ],
        ),
      ),
      LineBorder(),
    ]);
  }
}
