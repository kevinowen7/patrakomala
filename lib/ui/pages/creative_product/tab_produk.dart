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
      child: new StaggeredGridView.countBuilder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(ProductDetail());
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageList[index]),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye_sharp,
                            size: 15,
                            color: Colors.white,
                          ),
                          Text(' 120',
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
                          color: 'BD0085'.toColor(),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("Arsitektur",
                              style: normalFontStyle.copyWith(
                                  color: Colors.white, fontSize: 11)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (index) {
            return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
          }),
    );
  }
}
