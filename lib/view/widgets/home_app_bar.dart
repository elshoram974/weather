import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/services/localize.dart';
import '../../routes_manger.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<WeatherCubit, WeatherState>(
    // builder: (context, state) {
    return AppBar(
      title: Text(MyLocale.s.home),
      centerTitle: true,
      // backgroundColor: Colors.amber,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => searchIcon(context),
        ),
        const SizedBox(width: AppConstants.defaultPadding / 2),
      ],
    );
    // },
    // );
  }

  void searchIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutManger.searchPage);
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
