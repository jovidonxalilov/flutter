import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loggy/core/color/app_colors.dart';
import 'package:loggy/features/widget/text_widget.dart';

class ChevronWidget extends StatefulWidget {
  final String title;
  final List<Widget>? description;

  const ChevronWidget({
    Key? key,
    required this.title,
    this.description,
  }) : super(key: key);

  @override
  State<ChevronWidget> createState() => _ChevronWidgetState();
}

class _ChevronWidgetState extends State<ChevronWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.buttonBorder, width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 20),
          childrenPadding: EdgeInsets.fromLTRB(20, 9, 20, 14),
          trailing: SvgPicture.asset(
            _isExpanded
                ? "assets/icons/chevron_on.svg"
                : "assets/icons/chevron_off.svg",
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          backgroundColor: AppColors.white,
          collapsedBackgroundColor: AppColors.white,
          title: TextWidget(
            text: widget.title,
            color: AppColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          children: widget.description ?? [],
        ),
      ),
    );
  }
}
