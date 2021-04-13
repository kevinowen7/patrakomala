part of '../pages.dart';

class Pcc extends StatelessWidget {
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
                    Get.to(SearchBoxPCC());
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
                            "Cari Artikel ...",
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
                Container(
                  height: 266,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    "Patrakomala Coffee Club (PCC) adalah kegiatan yang diusung oleh Dinas Kebudayaan dan Pariwisata Kota Bandung yang bermaksud untuk mengenal dan mengidentifikasi masalah dari ke-16 sub sektor ekonomi kreatif di Kota Bandung, bertujuan untuk menimbulkan sinergitas antara pentahelix 16 sub sektor ekonomi kreatif yang kemudian mendukung kolaborasi di dalamnya.\n\nDinas Kebudayaan dan Pariwisata Kota Bandung sendiri melalui bidang ekonomi kreatif memiliki peran sebagai fasilitator dan juga regulator dalam kebijaksanaan pemecahan masalah dari pelaku Ekonomi Kreatif dalam hal suprastruktur. Selain itu Dinas Kebudayaan dan Pariwisata Kota Bandung sendiri juga sedang mencanangkan program berkelanjutan dengan beberapa proses yaitu kreasi-promosi-distribusi-konsumsi-konservasi. Dimana untuk merealisasikan program berkelanjutan tersebut diharapkan adanya kolaborasi antara semua bagian pentahelix yang salah satunya dengan kegiatan Patrakomala Coffee Club  ini.",
                    style: normalFontStyle.copyWith(
                      color: "333333".toColor(),
                      fontSize: 12,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                LineBorder(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 125,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: beritaItems.length,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        Get.to(PccDetail());
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
                            margin:
                                EdgeInsets.only(left: 15, right: defaultMargin),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Contoh PCC",
                                    style: titleStyle,
                                  ),
                                  Text(
                                    "Event - 12 April 2021",
                                    style: normalFontStyle,
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: (MediaQuery.of(context).size.width) -
                                        192,
                                    child: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                                      style: normalFontStyle.copyWith(
                                          color: "333333".toColor(),
                                          fontSize: 12),
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
                SizedBox(
                  height: 15,
                ),
                LineBorder(),
                LineBorder(),

                // LIST PCC
                ListPcc(),
                ListPcc(),
                ListPcc(),

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
