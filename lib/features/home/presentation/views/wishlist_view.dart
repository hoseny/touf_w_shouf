import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/widgets/failure_state.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_state.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/see_all/see_all_app_bar.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/see_all/see_all_list_view.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeCubit>()..getWishList(),
      child: Scaffold(
        appBar: const SeeAllAppBar(title: 'Wishlist'),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.wishListStatus == WishListStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.orange,
                ),
              );
            } else if (state.wishListStatus == WishListStatus.success) {
              return state.wishList!.isEmpty
                  ? Center(
                      child: Text(
                        'Your wishlist is empty',
                        style: TextStyles.font18BlackMedium,
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.wishList!.length,
                      itemBuilder: (context, index) {
                        final program = state.wishList![index];
                        return InkWell(
                          onTap: () {
                            context.pushReplacementNamed(
                              Routes.programDetailsView,
                              arguments: program,
                            );
                          },
                          child: SeeAllListViewItem(programModel: program),
                        );
                      },
                    );
            } else if (state.wishListStatus == WishListStatus.failure) {
              return Expanded(
                child: Center(
                  child: FailureState(
                    message: state.errorMessage,
                    onRetry: () => context.read<HomeCubit>().getWishList(),
                  ),
                ),
              );
            } else {
              return const Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
    );
  }
}
