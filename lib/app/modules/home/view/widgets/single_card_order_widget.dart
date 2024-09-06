import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_text_styles.dart';

class SingleCardOrderWidget extends StatelessWidget {
  final String code;
  final String address;
  final String customer;
  final String status;
  const SingleCardOrderWidget({super.key, required this.code, required this.address, required this.status, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(), 
        children: [                            
          _SlidableAction(
            color: AppColors.primary, 
            nameAction: "Trả hàng", 
            icon: Assets.icons.icActionReturn.svg(), 
            onTap: (context){
              Slidable.of(context)!.close();
            }
          ),
          _SlidableAction(
            color: AppColors.bluePrimary, 
            nameAction: "Gọi điện", 
            icon: Assets.icons.icActionPhone.svg(), 
            onTap: (context){
              Slidable.of(context)!.close();
            }
          ),          
        ]
      ),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(                
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.icons.icCode.svg(),
                      SizedBox(width: 10.w),
                      Text(
                        code,
                        style: Theme.of(context).BodyText2Bold,
                      ),
                    ],
                  ),
                  Container(   
                    height: 30.h,                       
                    decoration: BoxDecoration(
                      color: AppColors.transportingToVNSelected,
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,                            
                      ),
                      child: Text(                            
                        status,
                        style: Theme.of(context).BodyText1.copyWith(color: AppColors.dottedBorder),                              
                      ),
                    )
                  )
                ],
              ),
              _InfoOrderWidget(
                label: "Địa chỉ", 
                data: address, 
                icon: Assets.icons.icAddress.path,
              ),
              _InfoOrderWidget(
                label: "Khách hàng", 
                data: customer, 
                icon: Assets.icons.icCustomer.path,
              ),                                     
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoOrderWidget extends StatelessWidget {
  final String label;
  final String data;
  final String icon;

  const _InfoOrderWidget({required this.label, required this.data, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [                          
                SvgPicture.asset(icon),
                const SizedBox(width: 12,),
                Text(
                  label,
                  style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutral06),
                ),
              ],
            ),
            Text(
              data,
              style: Theme.of(context).BodyText1.copyWith(color: AppColors.neutrals08),
            )
          ],
        ),
      ],
    );
  }
}

class _SlidableAction extends StatelessWidget {
  final Color color;
  final String nameAction;
  final SvgPicture icon;
  final SlidableActionCallback onTap;
  const _SlidableAction({required this.color, required this.nameAction, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(            
      child: GestureDetector(
        onTap: (){
        onTap(context);
      },
        child: Container(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const Gap(8),
              Text(
                nameAction,
                style: Theme.of(context).BodyText2Bold.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}