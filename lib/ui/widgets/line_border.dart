part of 'widgets.dart';

class LineBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: "FFFFFF".toColor(),
            offset: Offset(0.0, -1.0),
            blurRadius: 4.0,
          ),
          BoxShadow(
            color: "DFDFDF".toColor(),
            offset: Offset(0.0, 1.0),
            blurRadius: 4.0,
          ),
        ],
        border: Border.all(
            color: "DFDFDF".toColor(), width: 1.5, style: BorderStyle.solid),
      ),
    );
  }
}
