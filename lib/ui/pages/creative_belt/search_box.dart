part of '../pages.dart';

class SearchBoxBelt extends StatefulWidget {
  @override
  _SearchBoxBeltState createState() => _SearchBoxBeltState();
}

class _SearchBoxBeltState extends State<SearchBoxBelt> {
  bool isLoading = false;
  List<int> selectedSubsector;
  int selectedKecamatan;
  int selectedKelurahan;
  int selectedTravelPackage;
  List<int> selectedBeltPackage;
  List<int> selectedIDSubsector = [];
  bool isLoadingSubsector = false;
  TextEditingController judul = TextEditingController();

  Future getFilter(
      List<int> subsectorID, int kecamatanID, int kelurahanID) async {
    // ignore: await_only_futures
    await BeltBloc().add(Filter3(subsectorID, kecamatanID, kelurahanID));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, 0.0),
              end: Alignment(0.996, 0.092),
              colors: [
                Color(0xFFF5F5F5),
                Color(0xFFFEFEFE),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    height: 20,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 20, defaultMargin, 20),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      image: AssetImage('assets/images/back.png'),
                      // fit : BoxFit.cover,
                    ))),
              ),

              NeuBorder3(
                mTop: 0,
                mBot: 0,
                child: BlocBuilder<SubsectorBloc, SubsectorState>(
                  builder: (_, subsectorState) {
                    if (subsectorState is SubsectorLoaded) {
                      List<Subsector> subsectors = subsectorState.subsector;
                      List<String> subsectorItem = [];
                      subsectors.asMap().forEach((key, value) {
                        subsectorItem.add(value.subSectorName);
                      });
                      return SearchMultipleCustom(
                        selectedValue: selectedSubsector,
                        hintText: "Pilih Subsektor",
                        items: subsectorItem,
                        onChanged: (value) {
                          setState(() {
                            selectedSubsector = value;
                          });

                          // print(subsectors[0].id);

                          for (var i in selectedSubsector) {
                            setState(() {
                              selectedIDSubsector.add(subsectors[i].id);
                            });
                          }
                        },
                        closeButton: (newValue) {
                          return (newValue.isNotEmpty
                              ? "Simpan ${newValue.length == 1 ? '"' + subsectorItem[newValue.first].toString() + '"' : '(' + newValue.length.toString() + ')'}"
                              : "Tutup");
                        },
                      );
                    } else {
                      return SelectNeuBorder(
                        hintText: "Pilih Subsektor",
                        items: [],
                      );
                    }
                  },
                ),
              ),

              // NeuBorder3(
              //   mTop: 0,
              //   mBot: 0,
              //   child: BlocBuilder<SubsectorBloc, SubsectorBloc>(
              //       builder: (_, subsectorState) {
              //     if (subsectorState is SubsectorLoaded) {
              //       List<Subsector> subsectors = subsectorState.subsector;
              //       List<String> subsectorItem = [];
              //       subsectors.asMap().forEach((key, value) {
              //         subsectorItem.add(value.subSectorName);
              //       });
              //       return SelectNeuBorder(
              //         hintText: "Pilih Subsektor",
              //         items: subsectorItem,
              //         onChanged: (value) {
              //           subsectors.asMap().forEach((key, values) {
              //             if (value == values.subSectorName) {
              //               setState(() {
              //                 selectedSubsector = [];
              //                 selectedSubsector.add(values.id);
              //               });
              //             }
              //           });
              //         },
              //       );
              //     } else {
              //       return SelectNeuBorder(
              //         hintText: "Pilih Subsektor",
              //         items: [],
              //       );
              //     }
              //   }),
              // ),
              // InkWell(
              //     onTap: () {
              //       setState(() {
              //         isLoading = true;
              //       });
              //       if (selectedSubsector == null) {
              //         setState(() {
              //           isLoading = false;
              //         });
              //         Flushbar(
              //           icon: Icon(
              //             Icons.info_outline,
              //             size: 28.0,
              //             color: Colors.yellow[300],
              //           ),
              //           duration: Duration(milliseconds: 2000),
              //           flushbarPosition: FlushbarPosition.TOP,
              //           flushbarStyle: FlushbarStyle.FLOATING,
              //           // backgroundColor: Color(0xFFFF5C83),
              //           borderRadius: 8,
              //           margin: EdgeInsets.all(defaultMargin),
              //           message: "Subsektor Belum dipilih !",
              //         )..show(context);
              //       } else {
              //         context
              //             .bloc<BeltBloc>()
              //             .add(BeltBySubsector(selectedSubsector));

              //         new Future.delayed(Duration(seconds: 3), () {
              //           // deleayed code here
              //           setState(() {
              //             isLoading = false;
              //           });
              //           Get.to(MainPage());
              //         });
              //       }
              //     },
              //     child: Container(
              //       margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              //       height: 40,
              //       width: 50,
              //       decoration: BoxDecoration(
              //         boxShadow: <BoxShadow>[
              //           BoxShadow(
              //             color: Color.fromRGBO(17, 18, 19, 0.3),
              //             offset: Offset(0.0, 0.0),
              //             blurRadius: 2.0,
              //           ),
              //         ],
              //         gradient: RadialGradient(colors: [
              //           mainColorRed,
              //           mainColorRed,
              //         ]),
              //         borderRadius:
              //             BorderRadius.all(const Radius.circular(5.0)),
              //       ),
              //       child: Center(
              //           child: Text(
              //         "Cari",
              //         style: normalFontStyle.copyWith(
              //             color: Colors.white,
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600),
              //       )),
              //     )),

              SizedBox(height: 10),

              NeuBorder3(
                mTop: 0,
                mBot: 0,
                child: BlocBuilder<KecamatanBloc, KecamatanState>(
                    builder: (_, kecamatanState) {
                  if (kecamatanState is KecamatanLoaded) {
                    ApiReturnValue<List<Kecamatan>> kecamatan =
                        kecamatanState.kecamatan;
                    List<Kecamatan> kecamatanVal = kecamatan.value;
                    List<String> kecamatanItem = [];
                    kecamatanVal.asMap().forEach((key, value) {
                      kecamatanItem.add(value.kecamatan);
                    });
                    return SelectNeuBorder(
                      hintText: "Pilih Kecamatan",
                      items: kecamatanItem,
                      onChanged: (value) {
                        kecamatanVal.asMap().forEach((key, values) {
                          if (value == values.kecamatan) {
                            setState(() {
                              selectedKecamatan = values.id;
                            });
                          }
                        });
                      },
                    );
                  } else {
                    return SelectNeuBorder(
                      hintText: "Pilih Kecamatan",
                      items: [],
                    );
                  }
                }),
              ),

              SizedBox(height: 10),

              NeuBorder3(
                mTop: 0,
                mBot: 0,
                child: BlocBuilder<KelurahanBloc, KelurahanState>(
                    builder: (_, kelurahanState) {
                  if (kelurahanState is KelurahanLoaded) {
                    ApiReturnValue<List<Kelurahan>> kelurahan =
                        kelurahanState.kelurahan;
                    List<Kelurahan> kelurahanVal = kelurahan.value;
                    List<String> kecamatanItem = [];
                    kelurahanVal.asMap().forEach((key, value) {
                      kecamatanItem.add(value.villageName);
                    });
                    return SelectNeuBorder(
                      hintText: "Pilih Kelurahan",
                      items: kecamatanItem,
                      onChanged: (value) {
                        kelurahanVal.asMap().forEach((key, values) {
                          if (value == values.villageName) {
                            setState(() {
                              selectedKelurahan = values.id;
                            });
                          }
                        });
                        // print(selectedKelurahan);
                      },
                    );
                  } else {
                    return SelectNeuBorder(
                      hintText: "Pilih Kelurahan",
                      items: [],
                    );
                  }
                }),
              ),

              // TODO: TravelPackage
              SizedBox(height: 10),

              NeuBorder3(
                mTop: 0,
                mBot: 0,
                child: BlocBuilder<TravelPackageBloc, TravelPackageState>(
                    builder: (_, tpState) {
                  if (tpState is TravelPackageLoaded) {
                    ApiReturnValue<List<TravelPackage>> travelPackage =
                        tpState.travelPackage;
                    List<TravelPackage> tpVal = travelPackage.value;
                    List<String> travelPackageItem = [];
                    tpVal.asMap().forEach((key, value) {
                      travelPackageItem.add(value.packageName);
                    });
                    return SelectNeuBorder(
                      hintText: "Travel Package",
                      items: travelPackageItem,
                      onChanged: (value) {
                        tpVal.asMap().forEach((key, values) {
                          if (value == values.packageName) {
                            setState(() {
                              isLoading = true;
                              selectedTravelPackage = values.id;
                            });
                            context
                                .bloc<BeltBloc>()
                                .add(TourPackages(selectedTravelPackage));

                            new Future.delayed(Duration(seconds: 4), () {
                              Get.to(MainPage());
                              setState(() {
                                isLoading = false;
                              });
                            });
                          }
                        });
                      },
                    );
                  } else {
                    return SelectNeuBorder(
                      hintText: "Travel Package",
                      items: [],
                    );
                  }
                }),
              ),

              // TODO:: BeltPackage
              SizedBox(height: 10),

              NeuBorder3(
                mTop: 0,
                mBot: 0,
                child: BlocBuilder<TourPackageBloc, TourPackageState>(
                    builder: (_, tpbState) {
                  if (tpbState is TourPackageLoaded) {
                    ApiReturnValue<List<BeltPackage>> tourPackage =
                        tpbState.beltPackage;
                    List<BeltPackage> tourPackageVal = tourPackage.value;
                    List<String> tourPackageItem = [];
                    tourPackageVal.asMap().forEach((key, value) {
                      tourPackageItem.add(value.beltTitle);
                    });
                    return SelectNeuBorder(
                      hintText: "Belt Package",
                      items: tourPackageItem,
                      onChanged: (value) {
                        tourPackageVal.asMap().forEach((key, values) {
                          if (value == values.beltTitle) {
                            setState(() {
                              isLoading = true;
                              selectedBeltPackage = [];
                              selectedBeltPackage.add(values.id);
                            });

                            context
                                .bloc<BeltBloc>()
                                .add(BeltPackages(selectedBeltPackage));

                            new Future.delayed(Duration(seconds: 4), () {
                              Get.to(MainPage());
                              setState(() {
                                isLoading = false;
                              });
                            });
                          }
                        });
                        // print(selectedBeltPackage);
                      },
                    );
                  } else {
                    return SelectNeuBorder(
                      hintText: "Belt Package",
                      items: [],
                    );
                  }
                }),
              ),
              SizedBox(height: 16),
              (!isLoading)
                  ? Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (selectedIDSubsector.length == 0 &&
                                selectedKecamatan == null &&
                                selectedKelurahan == null) {
                              Flushbar(
                                icon: Icon(
                                  Icons.info_outline,
                                  size: 28.0,
                                  color: Colors.yellow[300],
                                ),
                                duration: Duration(milliseconds: 2000),
                                flushbarPosition: FlushbarPosition.TOP,
                                flushbarStyle: FlushbarStyle.FLOATING,
                                // backgroundColor: Color(0xFFFF5C83),
                                borderRadius: 8,
                                margin: EdgeInsets.all(defaultMargin),
                                message: "Pilih Salah satu kolom !",
                              )..show(context);
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              context.bloc<BeltBloc>().add(Filter3(
                                  selectedIDSubsector,
                                  selectedKecamatan,
                                  selectedKelurahan));
                              BeltState bState = context.bloc<BeltBloc>().state;
                              if (bState is Filter3Loaded){
                                print('================= selesai');
                              } else {
                                Get.to(MainPage());
                              }
                              // setState(() {
                              //   isLoading = true;
                              // });
                              // new Future.delayed(Duration(seconds: 3), () {
                              //   getFilter(selectedIDSubsector,
                              //         selectedKecamatan, selectedKelurahan);

                              //   setState(() {
                              //     isLoading = false;
                              //   });
                              //   Get.to(MainPage());
                              // });

                            }
                          },
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            height: 40,
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
                                child: Text(
                              "Cari",
                              style: normalFontStyle.copyWith(
                                  color: mainColorRed,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            new Future.delayed(Duration(seconds: 10), () {
                              context.bloc<BeltBloc>().add(FetchBelt());
                              Get.to(MainPage());
                            });
                          },
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            height: 40,
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
                                child: Text(
                              "Tampilkan Semua",
                              style: normalFontStyle.copyWith(
                                  color: mainColorRed,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      ],
                    )
                  : SpinKitFadingCircle(
                      size: 50,
                      color: mainColorRed,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
