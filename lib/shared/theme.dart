part of 'shared.dart';

Color backgroundColor = "E5E5E5".toColor();
Color backgroundColorGrey = "DFDFDF".toColor();
Color mainColorRed = "E03001".toColor();
Color iconColorMain = "CACACA".toColor();


TextStyle blackfontStyle1 = GoogleFonts.montserrat()
    .copyWith(color: "333333".toColor().withOpacity(0.7));
TextStyle blackfontStyle2 = GoogleFonts.montserrat()
    .copyWith(color: "333333".toColor().withOpacity(0.25));
TextStyle normalFontStyle = GoogleFonts.montserrat();

TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);
// TextStyle menuFontStyle = GoogleFonts.poppins()
//     .copyWith(color: mainColor, fontWeight: FontWeight.w100);

const double defaultMargin = 24;
