part of 'pages.dart';

class TesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () async {
              var result = await UserServices.signInSSO(
                  "kerjaanburhan@gmail.com", "localhost");
              print('INI LOG YA ====');
              print(result.value.appLogin);
            },
          ),
        ),
      ),
    );
  }
}
