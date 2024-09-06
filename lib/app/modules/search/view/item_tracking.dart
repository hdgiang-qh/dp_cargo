import 'package:ellipsized_text/ellipsized_text.dart';
import 'package:flutter/material.dart';

class ItemTracking extends StatefulWidget {
  const ItemTracking({Key? key}): super(key: key);

  @override
  State<ItemTracking> createState() => _ItemTrackingState();
}

class _ItemTrackingState extends State<ItemTracking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: const Offset(0.5, 0.5),blurRadius: 2.0, spreadRadius: 0.5),
            BoxShadow(color: Colors.white, offset: const Offset(0.0, 0.0), blurRadius: 0.0, spreadRadius: 0.0)
          ]
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Row(children: [
                Icon(Icons.file_copy_outlined),
                Container(
                  width: 150,
                  child: EllipsizedText(
                    "9405508205499876227815",
                    type: EllipsisType.start,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )              ]),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(10, 4, 103, 1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black38)
                  ),
                  child: Text("Đang giao hàng", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
                ),
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Text("Thời gian", style: TextStyle(fontSize: 12, color: Colors.black54),),
              Text("29/03/2024 - 17:49:50", style: TextStyle(fontSize: 12),),
            ]),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Text("Khách hàng", style: TextStyle(fontSize: 12, color: Colors.black54),),
              Text("Trọng Hakago", style: TextStyle(fontSize: 12),),
            ]),
          )
        ]),
      ),
    );
  }
}
