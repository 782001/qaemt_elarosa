import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNAv(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                  textDirection: TextDirection.rtl,
                ),
                label: 'كل المنتجات',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                  textDirection: TextDirection.rtl,
                ),
                label: 'التصنيفات',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.article,
                  textDirection: TextDirection.rtl,
                ),
                label: 'الاحصائيات',
              ),
            ],
          ),
        );
      },
    );
  }
}
