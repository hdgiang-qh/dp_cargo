

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerLoading extends StatelessWidget {
  final bool loading;
  const SkeletonizerLoading({super.key, required this.loading});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: loading,
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              height: 20,
              color: Colors.grey[200],
            ),
            subtitle: Container(
              height: 50,
              color: Colors.grey[200],
              margin: const EdgeInsets.only(top: 8),
            ),
          );
        },
        separatorBuilder:
            (BuildContext context, int index) {
          return const SizedBox(
            height: 16,
          );
        },
      ),
    );
  }
}
