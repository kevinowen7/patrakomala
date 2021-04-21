part of '../pages.dart';

class TabPublikasi extends StatelessWidget {
  final List<int> beritaItems = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      InkWell(
        onTap: () {
          Get.to(SearchBoxCreativePublic());
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
                  "Cari Publikasi ...",
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

      // List Publikasi
      SizedBox(height: 20),
      BlocBuilder<PublikasiBloc, PublikasiState>(
        builder: (_, pState) {
          if (pState is PublikasiFilterLoaded) {
            return Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
              height: 30,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    context.bloc<PublikasiBloc>().add(FetchPublikasi());
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
          }else{
            return SizedBox();
          }
        },
      ),

      BlocBuilder<PublikasiBloc, PublikasiState>(
        builder: (_, pState) {
          if (pState is PublikasiLoaded) {
            ApiReturnValue<List<Publikasi>> publikasi = pState.publikasi;

            return Column(
              children: publikasi.value
                  .map(
                    (e) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(PublicDetail(e));
                          },
                          child: Container(
                            width: double.infinity,
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(e.title, style: titleStyle),
                                SizedBox(height: 5),
                                Text("Tahun Terbit 2019",
                                    style: normalFontStyle.copyWith(
                                        color: "777777".toColor(),
                                        fontSize: 12)),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        LineBorder(),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                  .toList(),
            );
          } else if (pState is PublikasiFilterLoaded) {
            ApiReturnValue<List<Publikasi>> publikasi = pState.publikasi;

            return Column(
              children: publikasi.value
                  .map(
                    (e) => Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(PublicDetail(e));
                          },
                          child: Container(
                            width: double.infinity,
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(e.title, style: titleStyle),
                                SizedBox(height: 5),
                                Text("Tahun Terbit 2019",
                                    style: normalFontStyle.copyWith(
                                        color: "777777".toColor(),
                                        fontSize: 12)),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        LineBorder(),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                  .toList(),
            );
          } else {
            return SpinKitFadingCircle(color: backgroundColorGrey, size: 50);
          }
        },
      ),
    ]);
  }
}
