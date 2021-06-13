part of '../pages.dart';

class LoginFormEmailPage extends StatefulWidget {
  @override
  _LoginFormEmailPageState createState() => _LoginFormEmailPageState();
}

class _LoginFormEmailPageState extends State<LoginFormEmailPage> {
  bool isLoading = false;

  RegistrationData registrationData;

  TextEditingController emailController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController tempatLahirController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();

  int selectedProv;
  int selectedKota;
  int idProv;
  int selectedGender = 1;
  String identifier;

  List<String> provinsi = [];
  List<String> kota = [];

  List<String> itemProvinsi = [];
  String dropdownValue = 'Laki - Laki';
  bool isValueDate = false;
  final format = DateFormat("yyyy-MM-dd");

  void getProv() async {
    var result = await ProvinsiServices.getProvinsi();

    (result.value).asMap().forEach((index, value) {
      setState(() {
        provinsi.add(value.nama);
      });
    });
  }

  @override
  void initState() {
    this.getProv();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
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
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: heightScreen * 0.07,
                  ),
                  Image.asset(
                    'assets/images/logo_patrakomala.png',
                    width: 286,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFieldCustom(
                      textEditingController: emailController,
                      hintText: "Alamat Email"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldCustom(
                      textEditingController: namaController,
                      hintText: "Nama Lengkap"),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: dropdownValue,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            if (dropdownValue == 'Laki - Laki') {
                              selectedGender = 1;
                            } else if (dropdownValue == 'Perempuan') {
                              selectedGender = 2;
                            } else {
                              selectedGender = 3;
                            }
                          });
                        },
                        items: <String>[
                          'Laki - Laki',
                          'Perempuan',
                          'Tidak Disebutkan'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                value,
                                style: normalFontStyle.copyWith(
                                    color: "333333".toColor()),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SelectDropdownCustom(
                    hintText: "Pilih Provinsi",
                    items: provinsi,
                    onChanged: (value) {
                      setState(() {
                        getIDProv(value);
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SelectDropdownCustom(
                    hintText: "Pilih Kabupaten/Kota",
                    items: kota,
                    onChanged: (value) {
                      setState(() {
                        getIDKota(value, idProv);
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldCustom(
                      textEditingController: tempatLahirController,
                      hintText: "Tempat Lahir"),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: DateTimeField(
                      controller: tglLahirController,
                      decoration: InputDecoration(
                        hintText: "Tanggal Lahir",
                        hintStyle:
                            normalFontStyle.copyWith(color: "333333".toColor()),
                        contentPadding:
                            EdgeInsets.only(left: 10, top: 5, bottom: 0),
                      ),
                      format: format,
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime(2000),
                            lastDate: DateTime(2200));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      var result = await UserServices.getDeviceDetails();

                      setState(() {
                        isLoading = true;
                        identifier = result.message;
                      });

                      if (!(namaController.text.trim() != "" &&
                          emailController.text.trim() != "" &&
                          selectedProv != null &&
                          selectedKota != null &&
                          tempatLahirController.text.trim() != "" &&
                          tglLahirController.text.trim() != "")) {
                        Flushbar(
                          icon: Icon(
                            Icons.info_outline,
                            size: 28.0,
                            color: Colors.yellow[300],
                          ),
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          flushbarStyle: FlushbarStyle.FLOATING,
                          // backgroundColor: Color(0xFFFF5C83),
                          borderRadius: 8,
                          margin: EdgeInsets.all(defaultMargin),
                          message: "Mohon Isi semua kolom",
                        )..show(context);
                      } else if (!EmailValidator.validate(
                          emailController.text)) {
                        Flushbar(
                          icon: Icon(
                            Icons.info_outline,
                            size: 28.0,
                            color: Colors.yellow[300],
                          ),
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          flushbarStyle: FlushbarStyle.FLOATING,
                          // backgroundColor: Color(0xFFFF5C83),
                          borderRadius: 8,
                          margin: EdgeInsets.all(defaultMargin),
                          message: "Format Email salah",
                        )..show(context);
                      } else {
                        var loginResult = await UserServices.signInEmail(
                            namaController.text,
                            selectedGender,
                            emailController.text,
                            null,
                            selectedProv,
                            selectedKota,
                            tempatLahirController.text,
                            tglLahirController.text,
                            identifier);

                        try {
                          var email = loginResult.value.email;
                          print(email);
                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString('identifier', identifier);
                          Get.offAll(MainPage());
                        } catch (e) {
                          Flushbar(
                            icon: Icon(
                              Icons.info_outline,
                              size: 28.0,
                              color: Colors.yellow[300],
                            ),
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            flushbarStyle: FlushbarStyle.FLOATING,
                            // backgroundColor: Color(0xFFFF5C83),
                            borderRadius: 8,
                            margin: EdgeInsets.all(defaultMargin),
                            message: "Email atau Password salah",
                          )..show(context);
                        }
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: (isLoading)
                        ? SpinKitFadingCircle(
                            color: backgroundColor,
                            size: 50,
                          )
                        : Container(
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
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(10.0)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/small_patrakomala.png',
                                    width: 32,
                                    height: 32,
                                  ),
                                  Text(
                                    "Login",
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
                ],
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

  void getIDProv(values) async {
    var result = await ProvinsiServices.getProvinsi();
    (result.value).asMap().forEach((index, value) {
      if (value.nama == values) {
        setState(() {
          selectedProv = value.id;
        });
        getKota(value.id);
      }
    });
  }

  void getIDKota(values, id) async {
    var result = await ProvinsiServices.getKota(id);
    (result.value).asMap().forEach((index, value) {
      if (value.nama == values) {
        setState(() {
          selectedKota = value.id;
        });
      }
    });
  }

  void getKota(int id) async {
    var result = await ProvinsiServices.getKota(id);
    setState(() {
      kota = [];
    });

    (result.value).asMap().forEach((index, value) {
      setState(() {
        kota.add(value.nama);
        idProv = id;
      });
    });
  }
}
