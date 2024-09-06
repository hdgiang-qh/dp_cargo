import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vncss/app/modules/util/images.dart';

import '../../../../app/core/widget/textfields/app_text_field.dart';


class ItemPriceConfig extends StatefulWidget {
  final String namePriceList;
  const ItemPriceConfig({Key? key,
    required this.namePriceList
  }): super(key: key);

  @override
  State<ItemPriceConfig> createState() => _ItemPriceConfigState();
}

class _ItemPriceConfigState extends State<ItemPriceConfig> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            isDismissible: false,
            context: context,
            builder: (context){
              return _BottomSheetView(name: widget.namePriceList,);
            });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SvgPicture.asset(Images.file2),
                  const SizedBox(width: 8,),
                  Text("Bảng giá ${widget.namePriceList}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
                ]),
                Row(children: [
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                          isDismissible: false,
                          context: context,
                          builder: (context){
                            return _BottomSheetView(name: widget.namePriceList,);
                          });
                    },
                    child: Column(children: [
                      SvgPicture.asset(Images.edit2, color: Colors.blue,),
                      const Text("Sửa")
                    ]),
                  ),
                  const SizedBox(width: 16,),
                  InkWell(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                const Text("Bạn có muốn xóa ", style: TextStyle(fontSize: 13),),
                                const Text("Xóa ", style: TextStyle(fontSize: 13, color:  Color.fromRGBO(171, 59, 53, 1)),),
                                Text(widget.namePriceList, style: const TextStyle(fontSize: 13),),
                              ]),
                              const SizedBox(height: 16,),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: 40,
                                        margin: const EdgeInsets.only(left: 16, right: 8),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: const Color.fromRGBO(171, 59, 53, 1),),
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: const Text("Hủy", style: TextStyle(fontSize: 13, color: Color.fromRGBO(171, 59, 53, 1)),),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: 40,
                                        margin: const EdgeInsets.only(left: 8, right: 16),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(171, 59, 53, 1),
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: const Text("Xác nhận", style: TextStyle(fontSize: 13, color: Colors.white,)),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      );
                    },
                    child: Column(children: [
                      SvgPicture.asset(Images.trash),
                      const Text("Xóa")
                    ]),
                  )
                ])
              ]),
        ]),
      ),
    );
  }
}
class _ItemBottomSheetPrice extends StatelessWidget {
  const _ItemBottomSheetPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: const Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Loại hàng:", style: TextStyle(fontSize: 13, color: Colors.grey),),
            Text("Hàng thường", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),)
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Kho:", style: TextStyle(fontSize: 13, color: Colors.grey),),
            Text("HCM", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),)
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Giá cước:", style: TextStyle(fontSize: 13, color: Colors.grey),),
            Text("215,000", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),)
          ],
        ),

      ]),
    );
  }
}
class _BottomSheetView extends StatefulWidget {
  final String name;
  const _BottomSheetView({super.key, required this.name});

  @override
  State<_BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<_BottomSheetView> {
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(children: [
            const Expanded(
                flex: 3,
                child: Text("Bảng giá vận chuyển", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),)
            ),
            Expanded(
                flex: 2,
                child: AppTextFieldWidget(
                  hintText: widget.name,
                  inputController: nameController,
                )
            ),
          ]),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(children: [
                  const Expanded(
                      flex: 2,
                      child: Text("Loại hàng hóa", style: TextStyle(fontSize: 13),)
                  ),
                  const Expanded(
                      flex: 1,
                      child: Text("Kho", style: TextStyle(fontSize: 13),)
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                          child: const Text("Giá cước", style: TextStyle(fontSize: 13),))
                  ),
                ]),
              ),
              _ItemBottomSheet(typeProduct: "Mỹ phẩm", warehouse: "HN", controller: priceController),
              _ItemBottomSheet(typeProduct: "Mỹ phẩm", warehouse: "HN", controller: priceController),
              _ItemBottomSheet(typeProduct: "Mỹ phẩm", warehouse: "HN", controller: priceController),
              _ItemBottomSheet(typeProduct: "Mỹ phẩm", warehouse: "HN", controller: priceController),
              _ItemBottomSheet(typeProduct: "Mỹ phẩm", warehouse: "HN", controller: priceController),
              _ItemBottomSheet(typeProduct: "Mỹ phẩm", warehouse: "HN", controller: priceController),
              _ItemBottomSheet(typeProduct: "Mỹ phẩm", warehouse: "HN", controller: priceController),
              _ItemBottomSheet(typeProduct: "Mỹ phẩm", warehouse: "HN", controller: priceController),
              _ItemBottomSheet(typeProduct: "Mỹ phẩm", warehouse: "HN", controller: priceController),

            ]),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: InkWell(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Bạn có muốn xóa ", style: TextStyle(fontSize: 13),),
                                const Text("Xóa ", style: TextStyle(fontSize: 13, color:  Color.fromRGBO(171, 59, 53, 1)),),
                                Text(widget.name, style: const TextStyle(fontSize: 13),),
                              ]),
                          const SizedBox(height: 16,),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: 40,
                                    margin: const EdgeInsets.only(left: 16, right: 8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: const Color.fromRGBO(171, 59, 53, 1),),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: const Text("Hủy", style: TextStyle(fontSize: 13, color: Color.fromRGBO(171, 59, 53, 1)),),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: 40,
                                    margin: const EdgeInsets.only(left: 8, right: 16),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(171, 59, 53, 1),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: const Text("Xác nhận", style: TextStyle(fontSize: 13, color: Colors.white,)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                  );
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(171, 59, 53, 1),
                        ),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: const Text("Xóa", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color.fromRGBO(171, 59, 53, 1),
                    ),)
                ),
              )),
              Expanded(child: InkWell(
                onTap: (){},
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(171, 59, 53, 1),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: const Text("Cập nhật", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white),)
                ),
              ))
            ])
      ]),
    );
  }
}
class _ItemBottomSheet extends StatefulWidget {
  final typeProduct;
  final warehouse;
  final controller;
  const _ItemBottomSheet({super.key,
    required this.typeProduct,
    required this.warehouse,
    required this.controller,
  });

  @override
  State<_ItemBottomSheet> createState() => _ItemBottomSheetState();
}

class _ItemBottomSheetState extends State<_ItemBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [
        Expanded(
            flex: 2,
            child: Text(widget.typeProduct, style: const TextStyle(fontSize: 13),)
        ),
        Expanded(
            flex: 1,
            child: Text(widget.warehouse, style: const TextStyle(fontSize: 13),)
        ),
        Expanded(
            flex: 2,
            child: Container(
                alignment: Alignment.center,
                child: AppTextFieldWidget(
                  inputController: widget.controller,
                )
            )
        )
      ]),
    );
  }
}

