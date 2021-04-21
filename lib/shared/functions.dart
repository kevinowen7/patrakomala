part of 'shared.dart';

class MyFunctions {
  Future<String> limitDesc(String str) async {
    String pisah = str.substring(0,10);
    String newValue = pisah;
    return newValue;
  }
}