import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/my_utils.dart';

class IntoCateogires extends StatefulWidget {
  final List<CategoryModel> data;

  const IntoCateogires({super.key, required this.data});

  @override
  State<IntoCateogires> createState() => _IntoCateogiresState();
}

class _IntoCateogiresState extends State<IntoCateogires> {
   bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFFFFFF),
      appBar: AppBar(
      leading: IconButton(onPressed: (){
         Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
      elevation: 0,
      backgroundColor:const Color(0xFFFFFFFF),
        title:const Text('Categories',style: TextStyle(color: Colors.black),),),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.data.length,
        itemBuilder:(context, index) {
          index % 2 == 0?isTrue = false:isTrue = true;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context)*0.06,vertical: height(context)*0.012),
            child: Container(
              height: height(context)*0.15,
              width: width(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width(context)*0.04),
                color: const Color(0xFFEAEAE8)
              ),
              child:isTrue?Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width(context)*0.32),
                    child: SizedBox(
                      height: height(context)*0.15,
                      width: width(context)*0.54,
                      child: Image.asset(AppImages.iphone,fit: BoxFit.fitWidth,)),
                  ),
                   Positioned(
                    left: width(context)*0.08,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       SizedBox(height: height(context)*0.038,),
                        Text(widget.data[index].categoryName,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                       SizedBox(height: height(context)*0.003,),
                       Text('${widget.data[index].product.length} Product',style: TextStyle(fontWeight: FontWeight.w600),)
                     ],),
                   ),
                ],
              ):Stack(
                children: [
                  SizedBox(
                    height: height(context)*0.15,
                    width: width(context)*0.54,
                    child: Image.asset(AppImages.iphone,fit: BoxFit.fitWidth,)),
                  SizedBox(width: width(context)*0.02,),
                   Positioned(
                    left: width(context)*0.58,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       SizedBox(height: height(context)*0.038,),
                       Text(widget.data[index].categoryName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                       SizedBox(height: height(context)*0.003,),
                       Text('${widget.data[index].product.length} Product',style: TextStyle(fontWeight: FontWeight.w600),)
                     ],),
                   ),
                ],
              ),
            ),
          );
        },),
    );
  }
}