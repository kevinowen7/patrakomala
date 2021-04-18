part of '../pages.dart';

class WorkshopDetail extends StatefulWidget {
  final List masrketplace;
  WorkshopDetail(this.masrketplace);
  @override
  _WorkshopDetailState createState() => _WorkshopDetailState();
}

class _WorkshopDetailState extends State<WorkshopDetail> {
  @override
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BisnisBloc, BisnisState>(builder: (_, bisnisState) {
        if (bisnisState is BisnisLoaded) {
          ApiReturnValue<Bisnis> bisnis = bisnisState.bisnis;
          String fasilitas = '';
          if (bisnis.value.parking) {
            fasilitas += 'Parkir,';
          }
          if (bisnis.value.toilet) {
            fasilitas += 'Toilet,';
          }
          if (bisnis.value.mushola) {
            fasilitas += 'Mushola,';
          }
          if (bisnis.value.showroom) {
            fasilitas += 'Showroom,';
          }
          return Stack(
            children: [
              ListView(
                children: [
                  CustomHeader(
                    backButton: () {
                      context.bloc<ProductBloc>().add(FetchProduct());
                      Get.back();
                    },
                    title: bisnis.value.perusahaanNm,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 8, defaultMargin, defaultMargin),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/skeleton_image.gif'),
                          fit: BoxFit.cover,
                        )),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: bisnis.value.perusahaanLogo,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                SpinKitRipple(color: mainColorRed, size: 50),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    child: CustomTabBar(
                      titles: ['Profil', 'Produk'],
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        if(index == 1){
                          context.bloc<ProductBloc>().add(ProductBisnis(bisnis.value.bisnisId));
                        }
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  selectedIndex == 0
                      ? TabProfil(bisnis.value, fasilitas,widget.masrketplace)
                      : TabProduct(),
                ],
              ),
              // Positioned(
              //   top: MediaQuery.of(context).size.height - 80,
              //   right: MediaQuery.of(context).size.width - 70,
              //   child: Container(
              //     width: 50,
              //     height: 50,
              //     child: FloatingActionButton(
              //       onPressed: null,
              //       elevation: 0,
              //       child: myPopMenu(),
              //       backgroundColor: backgroundColor,
              //     ),
              //   ),
              // )
            ],
          );
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
