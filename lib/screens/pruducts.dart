
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaemat_elarosa/screens/add_products.dart';

import '../components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class pruducts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
 return BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
    builder: (context, state) {

    var list =AppCubit.get(context).list;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) =>BuildProductItem(list[index]),
          separatorBuilder: (BuildContext context, int index)=>Container(
            height: 1,
            width: double.infinity,

          ),
          itemCount:list.length,

        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 170,
              bottom: 20,
              right: 20
          ),
          child:FloatingActionButton.extended(
            onPressed: (){    NavTo(context, AddProducts());

            },
            icon:const Icon(Icons.add),
            label:const Text('اضافة منتج',
              style:TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ) ,
            ),

          )
        )
      ],

    );
      }
      );
  }
}
