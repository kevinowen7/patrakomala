part of 'widgets.dart';

class SearchMultipleCustom extends StatefulWidget {
  final String hintText;
  final String label;
  List<int> selectedValue;
  final TextEditingController selectEditingController;
  final List<String> items;
  SearchMultipleCustom(
      {this.hintText,
      this.label,
      this.selectEditingController,
      this.selectedValue,
      this.items});
  @override
  _SearchMultipleCustomState createState() => _SearchMultipleCustomState();
}

class _SearchMultipleCustomState extends State<SearchMultipleCustom> {
  @override
  Widget build(BuildContext context) {
    return SearchableDropdown.multiple(
      underline: Padding(
        padding: EdgeInsets.all(5),
      ),
      items: widget.items.map((i) {
        return (DropdownMenuItem(
          child: Text(i.toString(),
              style:
                  normalFontStyle.copyWith(color: Colors.grey, fontSize: 18)),
          value: i.toString(),
        ));
      }).toList(),
      selectedItems: widget.selectedValue,
      hint: Padding(
        padding: EdgeInsets.all(0),
        child: Text(widget.hintText,
            style: normalFontStyle.copyWith(color: Colors.grey, fontSize: 18)),
      ),
      searchHint: widget.hintText,
      onChanged: (value) {
        setState(() {
          widget.selectedValue = value;
        });
      },
      closeButton: (newValue) {
        return (newValue.isNotEmpty
            ? "Simpan ${newValue.length == 1 ? '"' + widget.items[newValue.first].toString() + '"' : '(' + newValue.length.toString() + ')'}"
            : "Close");
      },
      isExpanded: true,
    );
  }
}
