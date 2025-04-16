import 'package:flutter/material.dart';
import 'package:notas/presentation/components/common/rounded_container_with_border.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PageableButtons extends StatelessWidget {
  final VoidCallback? onPressedMore;
  final VoidCallback? onPressedLess;
  final String page;
  final bool show;
  final bool canLoadMoreNotes;
  final bool canLoadMinusNotes;

  const PageableButtons({
    super.key,
    required this.onPressedMore,
    required this.onPressedLess,
    required this.page,
    required this.show,
    required this.canLoadMoreNotes,
    required this.canLoadMinusNotes,
  });

  @override
  Widget build(BuildContext context) {
    return show
        ? RoundedContainerWithBorder(
          color: Colors.white,
          width: 50.w,
          margin: EdgeInsets.symmetric(vertical: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: canLoadMinusNotes ? onPressedLess : null,

                child: Text(
                  'Anterior',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: canLoadMinusNotes ? Colors.amber[800] : Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withAlpha(50),
                ),
                child: Text(
                  page,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              TextButton(
                onPressed: canLoadMoreNotes ? onPressedMore : null,
                child: Text(
                  'Próximo',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: canLoadMoreNotes ? Colors.amber[800] : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        )
        : Container();
  }
}
