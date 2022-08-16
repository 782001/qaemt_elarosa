import 'package:flutter/material.dart';


void NavTo(context,Widget)=>  Navigator.push(context,MaterialPageRoute(
    builder: (context)=>Widget));
void NavAndFinish(context,Widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context)=>Widget), (route) => false);

Widget BuildCategoruItem(Map model)=>Directionality(
  textDirection: TextDirection.rtl,
  child: Padding(
    padding: const EdgeInsetsDirectional.only(
      top: 40,
      end: 30,
      start: 30
    ),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20)
      ),

      // height: 118,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            //
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
               const Text('اسم التصنيف: ',
                  style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
               const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Text(' ${model['categoryName']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
           const SizedBox(
              height: 10,
            ),
        const    Text('عدد المنتجات:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
           const SizedBox(
              height: 10,
            ),
          const  Text('اجمالي السعر:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  ),
);
Widget BuildProductItem(Map model)=>Directionality(
  textDirection: TextDirection.rtl,
  child: Padding(
    padding: const EdgeInsetsDirectional.only(
      top: 40,
      end: 30,
      start: 30
    ),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10)
      ),

      // height: 118,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            //

            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('اسم المنتج :',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
               const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Text(' ${model['productsName']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      fontSize: 16,

                    ),
                  ),
                ),
              ],
            ),
           const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('الكميه:       ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                Expanded(
                  child: Text(' ${model['quantum']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,

                    ),
                  ),
                ),
              ],
            ),
           const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('سعر الواحده :     ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                Expanded(
                  child: Text(' ${model['price1']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,

                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('التاريخ :',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                Expanded(
                  child: Text(' ${model['date']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,

                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  ),
);
