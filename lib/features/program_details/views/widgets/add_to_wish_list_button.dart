import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/helpers/wish_list_service.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';

class AddToWishListButton extends StatefulWidget {
  const AddToWishListButton({super.key, required this.program});

  final ProgramModel program;

  @override
  State<AddToWishListButton> createState() => _AddToWishListButtonState();
}

class _AddToWishListButtonState extends State<AddToWishListButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  void _loadFavoriteStatus() {
    final list = WishlistService.loadWishlist();
    final fav = list.any((p) => p.code == widget.program.code);
    setState(() => isFavorite = fav);
  }

  Future<void> _toggleFavorite() async {
    if (isFavorite) {
      await WishlistService.removeProgram(widget.program.code);
      ToastHelper.showErrorToast('Removed From Wishlist');
    } else {
      await WishlistService.addProgram(widget.program);
      ToastHelper.showSuccessToast('Added To Wishlist');
    }
    setState(() => isFavorite = !isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleFavorite,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
                vertical: 6.h,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Center(
                child: Transform.scale(
                  scale: 1.25.w,
                  child: Icon(
                    // <-- switch icon here
                    isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    size: 20.w,
                    color: AppColors.orange,
                  ),
                ),
              ),
            ),
            6.horizontalSpace,
            Text(
              'Add To Wishlist',
              style: TextStyles.font16BlackRegular,
            ),
          ],
        ),
      ),
    );
  }
}
