part of '../pages.dart';

class WorkshopDetail extends StatefulWidget {
  @override
  _WorkshopDetailState createState() => _WorkshopDetailState();
}

class _WorkshopDetailState extends State<WorkshopDetail> {
  @override
  int selectedIndex = 0;

  @override
  Widget imageCarousel = new Container(
    height: 200,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          NetworkImage(
              'https://www.seva.id/wp-content/uploads/2019/07/ARS09649.jpg'),
          NetworkImage('https://pbs.twimg.com/media/DgThe9gXUAIeAkk.jpg'),
        ],
        autoplay: true,
        dotSize: 4.0,
        borderRadius: true,
        indicatorBgPadding: 2.0,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              CustomHeader(
                backButton: () {
                  Get.back();
                },
                title: "Contoh Workshop",
              ),
              imageCarousel,
              SizedBox(height: 16),
              Container(
                child: CustomTabBar(
                  titles: ['Profil', 'Produk'],
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              selectedIndex == 0 ? TabProfil() : TabProduct(),
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
      ),
    );
  }
}
