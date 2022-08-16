
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qaemat_elarosa/components.dart';
import 'package:qaemat_elarosa/cubit/cubit.dart';
import 'package:qaemat_elarosa/cubit/states.dart';
import 'package:qaemat_elarosa/home_layout.dart';

class AddProducts extends StatelessWidget {
  AddProducts({Key? key}) : super(key: key);
var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var ProdutTextController=TextEditingController();
    var quantomTextController=TextEditingController();
    var priceFor1TextController=TextEditingController();
    var DateTextController=TextEditingController();
    var resultPriceTextController=TextEditingController();

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=AppCubit.get(context);
        return Scaffold(

          appBar: AppBar(
              centerTitle: true,
              title: const Text('اضافة تصنيف',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              )
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: ' اسم المنتج',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        prefixIcon: const Icon(Icons.title),

                      ),
                      keyboardType: TextInputType.text,
                      controller: ProdutTextController,
                      onTap: () {
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'ضع اسم المنتج';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: ' الكميه',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        prefixIcon: const Icon(Icons.format_list_numbered),

                      ),
                      keyboardType: TextInputType.phone,
                      controller:quantomTextController,
                      onTap: () {
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'ضع الكميه';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: ' سعر الواحده',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        prefixIcon: const Icon(Icons.price_check_outlined),

                      ),
                      keyboardType: TextInputType.phone,
                      controller:priceFor1TextController,
                      onTap: () {
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'ضع سعر الواحده';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'الاجمالي',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        prefixIcon: const Icon(Icons.price_change),

                      ),
                      keyboardType: TextInputType.phone,
                      controller:resultPriceTextController,
                      onTap: () {
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'ضع سعر الواحده';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'التاريخ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        prefixIcon: const Icon(Icons.date_range),

                      ),
                      keyboardType: TextInputType.datetime,
                      controller:DateTextController,
                      onTap: () {
                        showDatePicker(context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.parse('1900-08-07'),
                          lastDate: DateTime.parse('3022-08-07'),
                        ).then((value) {
                          DateTextController.text =
                              DateFormat.MMMd().format(value!);
                        }); },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'ضع التاريخ';
                        }
                        return null;
                      },
                    ),

                    const  SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      color: Colors.blue,
                      child: MaterialButton(

                        onPressed: (){
                        cubit.insertIntoDatabase(
                          productsName: ProdutTextController.text,
                          date: DateTextController.text,
                          price1: priceFor1TextController.text,
                          quantum:  quantomTextController.text,

                        ).then((value) => {
                          NavTo(context,const HomePage())
                        }
                        );

                        },
                        child: const Text('حفظ تفاصيل المنتج',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20
                          ),),
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
