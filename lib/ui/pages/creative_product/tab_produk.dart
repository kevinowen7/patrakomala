part of '../pages.dart';

class TabProduct extends StatefulWidget {
  @override
  _TabProductState createState() => _TabProductState();
}

class _TabProductState extends State<TabProduct> {
  ScrollController scrollController = ScrollController();

  void onScroll(){
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    print(currentScroll.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          defaultMargin, defaultMargin, defaultMargin, defaultMargin),
      child: BlocBuilder<ProductBloc, ProductState>(builder: (_, productState) {
        if (productState is ProductLoaded) {
          ApiReturnValue<List<Product>> product = productState.products;

          return StaggeredGridView.countBuilder(
              controller: scrollController,
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
                                      product.value[index].produkUrl +
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
