part of 'widgets.dart';

class SelectDropdownCustom extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final String label;
  final String selectedValue;
  final TextEditingController selectEditingController;
  final List<String> items;
  final Function(String selectProv) onChanged;

  SelectDropdownCustom(
      {this.icon,
      this.hintText,
      this.label,
      this.selectEditingController,
      this.selectedValue,
      this.onChanged,
      this.items});
  @override
  _SelectDropdownCustomState createState() => _SelectDropdownCustomState();
}

class _SelectDropdownCustomState extends State<SelectDropdownCustom> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 271,
      // height: 40,
      //
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
      child: SearchableDropdown.single(
        underline: Padding(
          padding: EdgeInsets.all(5),
        ),
        items: widget.items.map((data) {
          return (DropdownMenuItem(
            child: Text(
              data,
              style: normalFontStyle.copyWith(color: "333333".toColor()),
            ),
            value: data,
          ));
        }).toList(),
        // value: newSelectedValue,
        hint: Padding(
          padding: EdgeInsets.all(0),
          child: Text(
            widget.hintText,
            style: normalFontStyle.copyWith(color: "333333".toColor()),
          ),
        ),
        searchHint: widget.hintText,
        onChanged: widget.onChanged,
        dialogBox: true,
        isExpanded: true,
      ),
    );
  }
}
