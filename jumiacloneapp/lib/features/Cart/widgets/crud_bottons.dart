import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../feedFeature/ui/widgets/button.dart';

class CrudBottons extends StatefulWidget {
  const CrudBottons({
    super.key,
    required this.appColors,
    required this.id,
    required this.quantity,
    required this.onQtyChanged,
    required this.remove,
  });

  final AppColors appColors;
  final String id;
  final int quantity;
  final Function(int) onQtyChanged;
  final Function() remove;

  @override
  State<CrudBottons> createState() => _CrudBottonsState();
}

class _CrudBottonsState extends State<CrudBottons> {
  static const appColors = AppColors();

  int quantity=0;
  @override
  Widget build(BuildContext context) {
    setState(() {
      quantity=widget.quantity;
    });
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Button(
            appColors: widget.appColors,
            title: 'Remove',
            onPressed: widget.remove,
            width: 100,
            color: AppColors.appBarActive,
            backgroundColor: widget.appColors.secondColor,
          ),
        ),
        Spacer(),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 30.h,
                width: 35.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.appBarActive
                ),
                child: IconButton(
                  icon: Icon(Icons.remove,size: 20.sp,color: appColors.secondColor),
                  onPressed: () {
                    setState(() {
                      quantity-=1;
                    });
                    if (quantity > 0) {
                      widget.onQtyChanged(quantity);

                    }
                  },
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  height: 30.h,
                  width: 35.w,
                  child: Text(
                      '${quantity}',
                    style: TextStyle(
                      fontSize: 18.sp
                    ),
                  )
              ),
              Container(
                alignment: Alignment.center,
                height: 30.h,
                width: 35.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColors.appBarActive
                ),
                child: IconButton(
                  icon: Icon(Icons.add,size: 20.sp,color: appColors.secondColor,),
                  onPressed: () {
                    setState(() {
                      quantity+=1;
                    });
                    widget.onQtyChanged(quantity);
                  },
                ),
              ),
            ],
          )
        ),

      ],
    );
  }
}
