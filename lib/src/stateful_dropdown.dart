import 'package:flutter/material.dart';

class StatefulDropdown<T> extends StatefulWidget {
  final T? initialValue;
  final Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  const StatefulDropdown({Key? key, this.initialValue, required this.onChanged, required this.items}) : super(key: key);

  @override
  State<StatefulDropdown> createState() => _StatefulDropdownState<T>();
}

class _StatefulDropdownState<T> extends State<StatefulDropdown> {

  T? value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: DropdownButton<T>(
                underline: const SizedBox(),
                value: value,
                style: const TextStyle(fontSize: 14),
                onChanged: widget.onChanged == null ? null : (v) {
                  setState(() {
                    value = v;
                  });
                  widget.onChanged!(v);
                },
                items: (widget.items as List<DropdownMenuItem<T>>?)
            )
        )
    );
  }
}
