import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaemat_elarosa/components.dart';
import 'package:qaemat_elarosa/screens/add_category.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class category extends StatelessWidget {
  category({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).Categorylist;

        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) =>
                  BuildCategoruItem(list[index]),
              separatorBuilder: (BuildContext context, int index) => Container(
                height: 1,
                width: double.infinity,
              ),
              itemCount: list.length,
            ),
            Padding(
                padding:
                    const EdgeInsets.only(left: 170, bottom: 20, right: 20),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    NavTo(context, AddCategory());
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'اضافة تصنيف',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        );
      },
    );
  }
}
