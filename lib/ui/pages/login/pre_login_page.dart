part of '../pages.dart';

class PreLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            InkWell(
              onTap: () {
                Get.to(LoginEmail());
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
                        " Login dengan Patrakomala ID",
                        style: normalFontStyle.copyWith(
                            color: 'FEFEFE'.toColor(),
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      Container(
                        width: 20,
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
            GestureDetector(
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
                  color: "F8F8F8".toColor(),
                  borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mail,
                        color: mainColorRed,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "Login Dengan Email",
                          style: normalFontStyle.copyWith(
                              color: '333333'.toColor(), fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.to(LoginNoHp());
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
                  color: "F8F8F8".toColor(),
                  borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_android,
                        color: mainColorRed,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          "Login Dengan No Telpon",
                          style: normalFontStyle.copyWith(
                              color: '333333'.toColor(), fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
