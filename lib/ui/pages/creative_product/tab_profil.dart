part of '../pages.dart';

class TabProfil extends StatelessWidget {
  Widget marketPlaceButton() {
    return PopupMenuButton(
        // color: Colors.transparent,
        child: Text("MarketPlace",
            style: normalFontStyle.copyWith(color: mainColorRed),
            textAlign: TextAlign.center),
        onSelected: (value) {
          Fluttertoast.showToast(
              msg: "You have selected " + value.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Image.asset('assets/images/lazada.jpg',
                            width: 20, height: 20),
                      ),
                      Text('Lazada')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Image.asset('assets/images/tokped.png',
                            width: 20, height: 20),
                      ),
                      Text('Tokopedia')
                    ],
                  )),
              PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Image.asset('assets/images/shopee.png',
                            width: 20, height: 20),
                      ),
                      Text('Shopee')
                    ],
                  )),
            ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Sample Workshop",
                              style: titleStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconWithText(
                      icon: FontAwesome.building,
                      text: 'Tolet, Parkir',
                    ),
                    IconWithText(
                      icon: FontAwesome.map_marker,
                      text:
                          'Jl. Gatot Subroto No.289, Cibangkong, Kec. Batununggal, Kota Bandung, Jawa Barat 40273',
                    ),
                    IconWithText(
                      icon: FontAwesome.clock_o,
                      text: '08:00 - 17:00',
                    ),
                    IconWithText(
                      icon: FontAwesome.phone,
                      text: '08XXXXXXXXXX',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await launch(
                            'https://www.figma.com/file/6n3L6wYhcbhRsHy6Bx4cPi/Patrakomala-v2?node-id=116%3A579');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Website ",
                            style: normalFontStyle.copyWith(
                                decoration: TextDecoration.underline,
                                color: mainColorRed),
                          ),
                          Icon(
                            FontAwesome.external_link,
                            size: 15,
                            color: mainColorRed,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 40,
                      width: (MediaQuery.of(context).size.width) - 70,
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color.fromRGBO(17, 18, 19, 0.3),
                            offset: Offset(0.0, 0.0),
                            blurRadius: 2.0,
                          ),
                        ],
                        gradient: RadialGradient(colors: [
                          "FEFEFE".toColor(),
                          "F8F8F8".toColor(),
                        ]),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(5.0)),
                      ),
                      child: Center(
                        child: FlatButton(
                          color: Colors.transparent,
                          onPressed: null,
                          child: Container(
                            width: double.infinity,
                            child: marketPlaceButton(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LineBorder(),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: normalFontStyle,
              textAlign: TextAlign.left,
            )),
      ],
    );
  }
}
