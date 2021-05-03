part of '../pages.dart';

class CreativeNews extends StatefulWidget {
  @override
  _CreativeNewsState createState() => _CreativeNewsState();
}

class _CreativeNewsState extends State<CreativeNews> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: CustomHeader(title: "Berita & Publikasi"),
            ),
            ListView(children: [
              SizedBox(height: 60),
              CustomTabBar(
                titles: ['Berita', 'Publikasi'],
                selectedIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(height: 20),
              (selectedIndex == 0) ? TabBerita() : TabPublikasi(),
            ])
          ],
        ),
      ),
    );
  }
}
