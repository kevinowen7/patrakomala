part of '../pages.dart';

class LoginNoHp extends StatelessWidget {
  final TextEditingController noHpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_login.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_patrakomala.png',
                width: 286,
              ),
              SizedBox(
                height: 40,
              ),
              TextFieldCustom(
                  icon: Icons.mail,
                  textEditingController: noHpController,
                  hintText: "Masukan No Telpon"),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.to(LoginFormEmailPage());
                },
                child: Container(
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
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFC43008),
                        Color(0xFFF55226),
                      ],
                    ),
                    borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/small_patrakomala.png',
                          width: 32,
                          height: 32,
                        ),
                        Text(
                          "Lanjut",
                          style: normalFontStyle.copyWith(
                              color: 'FEFEFE'.toColor(),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        Container(
                          width: 32,
                          height: 32,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
        Positioned(
          top: 25,
          left: 0,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 21),
              child: Image.asset(
                'assets/images/back_white.png',
              ),
            ),
          ),
        )
      ]),
    );
  }
}
