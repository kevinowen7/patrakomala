part of '../pages.dart';

class TabProduct extends StatelessWidget {
  final List<String> imageList = [
    'https://myeatandtravelstory.files.wordpress.com/2017/03/cover-braga-1280x855.jpg?w=1280&h=855&crop=1',
    'https://ik.imagekit.io/tvlk/cul-asset/guys1L+Yyer9kzI3sp-pb0CG1j2bhflZGFUZOoIf1YOBAm37kEUOKR41ieUZm7ZJ/tvlk-prod-cul-assets/culinary/asset/REST_IMG-960x720-FIT_AND_TRIM-8f057e8555fa27002bf0296c64316874.jpeg?tr=q-40,c-at_max,w-1080,h-1920&_src=imagekit',
    'https://backpanel.kemlu.go.id/sites/pusat/PublishingImages/Tentang%20Kami/Museum%20Konferensi%20Asia%20Afrika_jpg.jpg',
    'https://asset.kompas.com/crops/IVeFFpLdYLdryzxXPhXwDuuz_NI=/0x0:780x390/780x390/data/photo/2014/07/02/1700039bandunggg2780x390.jpg',
    'https://4.bp.blogspot.com/-CXnLhw35tdk/U6_cQIKnwRI/AAAAAAAAAJQ/VfgpazMAYRQ/s1600/braga_malam.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          defaultMargin, defaultMargin, defaultMargin, defaultMargin),
      child: BlocBuilder<ProductBloc, ProductState>(builder: (_, productState) {
        if (productState is ProductLoaded) {
          ApiReturnValue<List<Product>> product = productState.products;

          return StaggeredGridView.countBuilder(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              itemCount: product.value.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(ProductDetail(product.value[index]));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              (product.value[index].produkImg == null)
                                  ? 'https://img.youtube.com/vi/' +
                                      '2cKapqou5l0' +
                                      '/0.jpg'
                                  : product.value[index].produkImg),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
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
                      child: Container(
                        child: Stack(children: [
                          (product.value[index].produkImg == null)
                              ? Center(
                                  child: Image.asset('assets/images/play.png',
                                      width: 50),
                                )
                              : SizedBox(),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // SizedBox(height: 80),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.remove_red_eye_sharp,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        Text(
                                            product.value[index].counters ==
                                                    null
                                                ? ' 0'
                                                : ' ${product.value[index].counters}',
                                            style: normalFontStyle.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            )),
                                      ],
                                    ),
                                    Container(
                                      // width: 74,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color: mainColorRed,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                            product.value[index].subsector,
                                            style: normalFontStyle.copyWith(
                                                color: Colors.white,
                                                fontSize: 11)),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index) {
                return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              });
        } else {
          return SpinKitFadingCircle(
            color: mainColorRed,
            size: 50,
          );
        }
      }),
    );
  }
}
