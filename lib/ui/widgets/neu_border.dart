part of 'widgets.dart';

// class NeuBorders extends StatelessWidget {
//   final Widget child;
//   final double mTop;
//   final double mBot;
//   NeuBorders({this.child, this.mTop, this.mBot});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment(0.0, 0.0),
//           end: Alignment(0.996, 0.092),
//           colors: [
//             Color(0xFFF5F5F5),
//             Color(0xFFFEFEFE),
//           ],
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [],
//       ),
//     );
//   }
// }

class NeuBorder extends StatelessWidget {
  final Widget child;
  final double mTop;
  final double mBot;
  NeuBorder({this.child, this.mTop, this.mBot});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.fromLTRB(defaultMargin, mTop, defaultMargin, mBot),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFFFFFFFF),
            offset: Offset(0.0, -1.0),
            blurRadius: 2.0,
          ),
          BoxShadow(
            color: Color(0xFFCACACA),
            offset: Offset(0.0, 1.0),
            blurRadius: 2.0,
          ),
          BoxShadow(
            color: Color.fromRGBO(51, 51, 51, 0.16),
            offset: Offset(0, 0.0),
            blurRadius: 0.0,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment(0.0, 0.0),
          end: Alignment(0.996, 0.092),
          colors: [
            Color(0xFFF5F5F5),
            Color(0xFFFEFEFE),
          ],
        ),
        borderRadius: BorderRadius.all(const Radius.circular(10.0)),
        border: Border.all(
            color: Color(0xFFDFDFDF), width: 1.0, style: BorderStyle.solid),
      ),
      child: child,
    );
  }
}
