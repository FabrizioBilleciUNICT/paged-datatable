import 'package:flutter/material.dart';
import 'package:paged_datatable/paged_datatable.dart';

/// The default footer renderer for [PagedDataTable].
///
/// It renders the [RefreshTable], [PageSizeSelector], [CurrentPage] and [NavigationButtons] widgets.
class DefaultFooter<K extends Comparable<K>, T> extends StatelessWidget {
  /// An additional widget to render at the left of the footer
  final Widget? child;

  const DefaultFooter({this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        RefreshTable<K, T>(),
        const VerticalDivider(
            color: Color(0xFFD6D6D6), width: 3, indent: 10, endIndent: 10),
        PageSizeSelector<K, T>(),
        const VerticalDivider(
            color: Color(0xFFD6D6D6), width: 3, indent: 10, endIndent: 10),
        if (child != null) child! else CurrentPage<K, T>(),
        const VerticalDivider(
            color: Color(0xFFD6D6D6), width: 3, indent: 10, endIndent: 10),
        NavigationButtons<K, T>(),
      ],
    );
  }
}
