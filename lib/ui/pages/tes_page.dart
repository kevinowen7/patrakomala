part of 'pages.dart';

class TesPage extends StatefulWidget {
  @override
  _TesPageState createState() => _TesPageState();
}

class _TesPageState extends State<TesPage> {
  String userIdentifier;

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var identifier = await UserServices.getIdentifier();
    var obtainedEmail = sharedPreferences.getString('identifier');
    setState(() {
      userIdentifier =
          (identifier.value == obtainedEmail) ? identifier.value : 'no-data';
    });
  }

  // @override
  void initState() {
    getValidationData().whenComplete(() async {
      Get.to((userIdentifier == 'no-data') ? PreLoginPage() : MainPage());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        // child: RaisedButton(
        //   onPressed: () async {
        //     var result = await UserServices.getIdentifier();
        //     print(result.value);
        //   },
        // ),
        child: SpinKitFadingCircle(
          color: mainColorRed,
          size: 50,
        ),
      ),
    );
  }
}
