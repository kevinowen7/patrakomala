part of 'widgets.dart';

class TextFieldCustom extends StatelessWidget {
  final IconData icon;
  final TextEditingController textEditingController;
  final String hintText;

  TextFieldCustom({this.icon, this.textEditingController, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 271,
      height: 40,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xFF333333),
              offset: Offset(0.0, -2.0),
              blurRadius: 4.0,
            ),
            BoxShadow(
              color: Color(0xFF030303),
              offset: Offset(0.0, 1.0),
              blurRadius: 4.0,
            ),
            BoxShadow(
              color: Color.fromRGBO(51, 51, 51, 0.16),
              offset: Offset(0, 0.0),
              blurRadius: 0.0,
            ),
          ],
          color: "F8F8F8".toColor(),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: TextField(
        decoration: (icon != null)
            ? InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: mainColorRed,
                ),
                border: InputBorder.none,
                hintStyle: normalFontStyle.copyWith(
                  color: "333333".toColor().withOpacity(0.3),
                ),
                hintText: hintText)
            : InputDecoration(
                border: InputBorder.none,
                hintStyle: normalFontStyle.copyWith(
                  color: "333333".toColor().withOpacity(0.3),
                ),
                contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                hintText: hintText),
      ),
    );
  }
}
