part of 'widgets.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final String isRow;

  IconWithText({this.icon, this.text, this.isRow});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
        ),
        SizedBox(
          width: 10,
        ),
        (isRow != null)
            ? Text(text, style: normalFontStyle.copyWith(color: Colors.grey))
            : Expanded(
                child: Text(text,
                    style: normalFontStyle.copyWith(color: Colors.grey)),
              )
      ],
    );
  }
}
