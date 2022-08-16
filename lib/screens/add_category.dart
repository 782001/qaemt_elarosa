import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaemat_elarosa/components.dart';
import 'package:qaemat_elarosa/cubit/cubit.dart';
import 'package:qaemat_elarosa/cubit/states.dart';
import 'package:qaemat_elarosa/home_layout.dart';

class AddCategory extends StatelessWidget {
  AddCategory({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var categoryTextController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  'اضافة تصنيف',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: ' اسم التصنيف',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          prefixIcon: const Icon(Icons.title),
                        ),
                        keyboardType: TextInputType.text,
                        controller: categoryTextController,
                        onTap: () {},
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'ضع اسم التصنيف';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.blue,
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit
                                  .insertIntoCategoryDatabase(
                                      categoryName: categoryTextController.text)
                                  .then((value) => {
                                        NavAndFinish(context, HomePage()),
                                        // NavTo(context,const HomePage()),
                                      });
                            }
                          },
                          child: const Text(
                            'حفظ التصنيف',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
