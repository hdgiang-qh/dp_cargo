import 'package:flutter/material.dart';

class PageItem extends StatefulWidget {
  final int index;
  const PageItem(this.index, {super.key});

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      alignment: Alignment.center,
      child: Text('index:${widget.index}'),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
