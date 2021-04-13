import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:patrakomala_neumorphic/ui/pages/pages.dart';
import 'package:supercharged/supercharged.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: TesPage(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key key}) : super(key: key);

//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: NeumorphicFloatingActionButton(
//         child: Icon(Icons.add, size: 30),
//         onPressed: () {},
//       ),
//       backgroundColor: NeumorphicTheme.baseColor(context),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             NeumorphicTheme(
//                 themeMode: ThemeMode.light, //or dark / system
//                 darkTheme: NeumorphicThemeData(
//                   baseColor: Color(0xff333333),
//                   accentColor: Colors.green,
//                   lightSource: LightSource.topLeft,
//                   depth: 3,
//                   intensity: 0.3,
//                 ),
//                 theme: NeumorphicThemeData(
//                   baseColor: Color(0xffDDDDDD),
//                   accentColor: Colors.cyan,
//                   lightSource: LightSource.topLeft,
//                   depth: 6,
//                   intensity: 0.5,
//                 ),
//                 child: Column(
//                   children: [
//                     NeumorphicToggle(
//                       height: 50,
//                       selectedIndex: 0,
//                       displayForegroundOnlyIfSelected: true,
//                       children: [
//                         ToggleElement(
//                           background: Center(
//                               child: Text(
//                             "This week",
//                             style: TextStyle(fontWeight: FontWeight.w500),
//                           )),
//                           foreground: Center(
//                               child: Text(
//                             "This week",
//                             style: TextStyle(fontWeight: FontWeight.w700),
//                           )),
//                         ),
//                         ToggleElement(
//                           background: Center(
//                               child: Text(
//                             "This month",
//                             style: TextStyle(fontWeight: FontWeight.w500),
//                           )),
//                           foreground: Center(
//                               child: Text(
//                             "This month",
//                             style: TextStyle(fontWeight: FontWeight.w700),
//                           )),
//                         ),
//                         ToggleElement(
//                           background: Center(
//                               child: Text(
//                             "This year",
//                             style: TextStyle(fontWeight: FontWeight.w500),
//                           )),
//                           foreground: Center(
//                               child: Text(
//                             "This year",
//                             style: TextStyle(fontWeight: FontWeight.w700),
//                           )),
//                         )
//                       ],
//                     ),
//                     NeumorphicButton(
//                       onPressed: () {
//                         print("onClick");
//                       },
//                       style: NeumorphicStyle(
//                         shape: NeumorphicShape.flat,
//                         boxShape: NeumorphicBoxShape.circle(),
//                       ),
//                       padding: const EdgeInsets.all(12.0),
//                       child: Icon(
//                         Icons.favorite_border,
//                         color: _iconsColor(context),
//                       ),
//                     ),
//                   ],
//                 )),
//             NeumorphicButton(
//               onPressed: () {
//                 print("onClick");
//               },
//               style: NeumorphicStyle(
//                 shape: NeumorphicShape.flat,
//                 boxShape: NeumorphicBoxShape.circle(),
//               ),
//               padding: const EdgeInsets.all(12.0),
//               child: Icon(
//                 Icons.favorite_border,
//                 color: _iconsColor(context),
//               ),
//             ),
//             NeumorphicButton(
//                 margin: EdgeInsets.only(top: 12),
//                 onPressed: () {
//                   NeumorphicTheme.of(context).themeMode =
//                       NeumorphicTheme.isUsingDark(context)
//                           ? ThemeMode.light
//                           : ThemeMode.dark;
//                 },
//                 style: NeumorphicStyle(
//                   shape: NeumorphicShape.flat,
//                   boxShape:
//                       NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
//                 ),
//                 padding: const EdgeInsets.all(12.0),
//                 child: Text(
//                   "Toggle Theme",
//                   style: TextStyle(color: _textColor(context)),
//                 )),
//             NeumorphicButton(
//                 margin: EdgeInsets.only(top: 12),
//                 onPressed: () {
//                   // Navigator.of(context)
//                   //     .pushReplacement(MaterialPageRoute(builder: (context) {
//                   //   return FullSampleHomePage();
//                   // }));
//                 },
//                 style: NeumorphicStyle(
//                   shape: NeumorphicShape.flat,
//                   boxShape:
//                       NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
//                   //border: NeumorphicBorder()
//                 ),
//                 padding: const EdgeInsets.all(12.0),
//                 child: Text(
//                   "Go to full sample",
//                   style: TextStyle(color: _textColor(context)),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }

//   Color _iconsColor(BuildContext context) {
//     final theme = NeumorphicTheme.of(context);
//     if (theme.isUsingDark) {
//       return theme.current.accentColor;
//     } else {
//       return null;
//     }
//   }

//   Color _textColor(BuildContext context) {
//     if (NeumorphicTheme.isUsingDark(context)) {
//       return Colors.white;
//     } else {
//       return Colors.black;
//     }
//   }
// }
