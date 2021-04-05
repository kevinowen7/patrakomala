part of '../pages.dart';

class LoginFormPage extends StatefulWidget {
  @override
  _LoginFormPageState createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController tempatLahirController = TextEditingController();

  List<String> itemsProvinsi = ['Jawa Barat', 'Jawa Tengah', 'Jawa Timur'];
  List<String> itemsKota = ['Kab. Bandung', 'Kota Bandung', 'Kota Cimahi'];
  String dropdownValue = 'Laki - Laki';
  bool isValueDate = false;
  final format = DateFormat("dd-MM-yyyy");

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
                items: itemsProvinsi,
              ),
              SizedBox(
                height: 10,
              ),
              SelectDropdownCustom(
                hintText: "Pilih Kabupaten/Kota",
                items: itemsKota,
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
                onTap: () {},
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
