part of 'widgets.dart';

class SearchMultipleCustom extends StatefulWidget {
  final String hintText;
  final String label;
  final TextEditingController selectEditingController;
  final List<String> items;
  final Function onChanged;
  final Function closeButton;
  final List<int> selectedValue;

  SearchMultipleCustom(
      {this.hintText,
      this.label,
      this.selectEditingController,
      this.onChanged,
      this.closeButton,
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
      onChanged: widget.onChanged,
      closeButton: widget.closeButton,
      isExpanded: true,
    );
  }
}
