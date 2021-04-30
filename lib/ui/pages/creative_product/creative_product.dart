part of '../pages.dart';

class CreativeProduct extends StatefulWidget {
  @override
  _CreativeProductState createState() => _CreativeProductState();
}

class _CreativeProductState extends State<CreativeProduct> {
  bool resetBtn = false;

  @override
  void initState() {
    ProductBloc().add(FetchProduct());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: "F8F8F8".toColor(),
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(SearchBoxProduct());
              },
              child: Container(
                height: 40,
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 20),
                decoration: BoxDecoration(
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
                      Color(0xFFF5F5F5),
                      Color(0xFFFEFEFE),
                    ],
                  ),
                  borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                  border: Border.all(
                      color: Color(0xFFDFDFDF),
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Text(
                        "Cari Produk ...",
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
            BlocBuilder<ProductBloc, ProductState>(builder: (_, productState) {
              if (productState is ProductFilterLoaded) {
                return Container(
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 75, defaultMargin, 0),
                  height: 30,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        context.bloc<ProductBloc>().add(FetchProduct());
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
                return SizedBox();
              }
            }),
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 80, defaultMargin, 80),
              child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (_, productState) {
                if (productState is ProductLoaded) {
                  ApiReturnValue<List<Product>> product = productState.products;
                  return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      itemCount: product.value.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(ProductDetail(product.value[index]));
                          },
                          child: Stack(children: [
                            Center(
                              child: SpinKitFadingCircle(
                                  color: backgroundColorGrey, size: 50),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        (product.value[index].produkImg == null)
                                            ? 'https://img.youtube.com/vi/' +
                                                product.value[index].produkUrl +
                                                '/0.jpg'
                                            : product.value[index].produkImg),
                                    fit:
                                        (product.value[index].produkImg == null)
                                            ? BoxFit.contain
                                            : BoxFit.cover,
                                  ),
                                  color: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
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
                                            child: Image.asset(
                                                'assets/images/play.png',
                                                width: 50),
                                          )
                                        : SizedBox(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          // SizedBox(height: 80),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.remove_red_eye_sharp,
                                                    size: 15,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                      product.value[index]
                                                                  .counters ==
                                                              null
                                                          ? ' 0'
                                                          : ' ${product.value[index].counters}',
                                                      style: normalFontStyle
                                                          .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                      )),
                                                ],
                                              ),
                                              Container(
                                                // width: 74,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  color: mainColorRed,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                      product.value[index]
                                                          .subsector,
                                                      style: normalFontStyle
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
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
                          ]),
                        );
                      },
                      staggeredTileBuilder: (index) {
                        return new StaggeredTile.count(
                            1, index.isEven ? 1.2 : 1.8);
                      });
                } else if (productState is ProductFilterLoaded) {
                  ApiReturnValue<List<Product>> product = productState.products;
                  return Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: StaggeredGridView.countBuilder(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
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
                                            child: Image.asset(
                                                'assets/images/play.png',
                                                width: 50),
                                          )
                                        : SizedBox(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          // SizedBox(height: 80),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.remove_red_eye_sharp,
                                                    size: 15,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                      product.value[index]
                                                                  .counters ==
                                                              null
                                                          ? ' 0'
                                                          : ' ${product.value[index].counters}',
                                                      style: normalFontStyle
                                                          .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                      )),
                                                ],
                                              ),
                                              Container(
                                                // width: 74,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  color: mainColorRed,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                      product.value[index]
                                                          .subsector,
                                                      style: normalFontStyle
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
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
                          return new StaggeredTile.count(
                              1, index.isEven ? 1.2 : 1.8);
                        }),
                  );
                } else {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: backgroundColorGrey,
                      size: 50,
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
