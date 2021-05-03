part of 'widgets.dart';

class SelectNeuBorder extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final String label;
  final String selectedValue;
  final TextEditingController selectEditingController;
  final List<String> items;
  final Function(String selectProv) onChanged;

  SelectNeuBorder(
      {this.icon,
      this.hintText,
      this.label,
      this.selectEditingController,
      this.selectedValue,
      this.onChanged,
      this.items});
  @override
  _SelectNeuBorderState createState() => _SelectNeuBorderState();
}

class _SelectNeuBorderState extends State<SelectNeuBorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      //
      decoration: BoxDecoration(
        color: "F8F8F8".toColor(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SearchableDropdown.single(
        underline: Padding(
          padding: EdgeInsets.all(5),
        ),
        items: widget.items.map((data) {
          return (DropdownMenuItem(
            child: Text(
              data,
              style: normalFontStyle.copyWith(color: Colors.grey, fontSize: 18),
            ),
            value: data,
          ));
        }).toList(),
        // value: newSelectedValue,
        hint: Padding(
          padding: EdgeInsets.all(0),
          child: Text(
            widget.hintText,
            style: normalFontStyle.copyWith(color: Colors.grey, fontSize: 18),
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
