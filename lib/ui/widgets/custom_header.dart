part of 'widgets.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final Function backButton;
  CustomHeader({this.title, this.backButton});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: "F8F8F8".toColor(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: defaultMargin),
              child: (backButton != null)
                  ? InkWell(
                      onTap: backButton,
                      child: Image.asset("assets/images/back.png", width: 24))
                  : Image.asset("assets/images/small_grey.png", width: 34)),
          Padding(
            padding: const EdgeInsets.only(left: defaultMargin),
            child: Text(title,
                style: blackfontStyle1.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
