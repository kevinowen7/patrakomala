part of 'widgets.dart';

class IconMap extends StatelessWidget {
  final String image;
  final String nama;

  IconMap(this.image, this.nama);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            // color: Colors.red,
            border: Border.all(color: mainColorRed, width: 1),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Center(
            child: Image.asset(image, fit: BoxFit.cover, width: 20),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
            child: Text(nama,
                style: normalFontStyle.copyWith(color: mainColorRed))),
      ],
    );
  }
}
