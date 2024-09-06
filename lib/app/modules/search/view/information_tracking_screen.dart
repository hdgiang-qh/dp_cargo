
import 'package:ellipsized_text/ellipsized_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vncss/app/modules/util/images.dart';




class InformationTrackingScreen extends StatelessWidget {
  const InformationTrackingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(16),
                  child: Row(children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back, size: 30),
                    ),
                    const Expanded(child: Center(child: Text("Chi tiết tracking", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)))
              ])),
        
              Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.red
                    ),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: const Column(children: [
                    Text("Thông tin tracking", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    Row(children: [
                      Text("Trạng thái: ", style: TextStyle(fontSize: 16,)),
                      Text("Đang giao hàng", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ]),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Mã phiếu: ", style: TextStyle(fontSize: 16,)),
                      Text("DPUS29032401270", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ]),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: 320,
                          child: Row(children: [
                            Text("Mã tracking: ", style: TextStyle(fontSize: 16,)),
                            SizedBox(width: 210,child: EllipsizedText(
                              "9405508205499876227815",
                              type: EllipsisType.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            ),),
                          ]),
                        ),
                      ],
                    ),
        
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Người nhận: ", style: TextStyle(fontSize: 16,)),
                      Text("Trọng Hakago", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ]),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Kho US: ", style: TextStyle(fontSize: 16,)),
                      Text("Kho US - 01", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ]),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Kho VN: ", style: TextStyle(fontSize: 16,)),
                      Text("DP-HCM", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ]),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Mô tả: ", style: TextStyle(fontSize: 16,)),
                      Text("good job!", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ]),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Ghi chú: ", style: TextStyle(fontSize: 16,)),
                      Text("nope", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ]),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Thời gian tạo: ", style: TextStyle(fontSize: 16,)),
                      Text("29/03/2024 - 17:49:50", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ]),
                    SizedBox(height: 10,),
                  ]))
            ])
        ),
      )
    );
  }
}
