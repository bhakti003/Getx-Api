import 'dart:convert';

import 'package:api_demo/Controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Models/single_model.dart';
import 'package:http/http.dart'as http;
class SecondPage extends StatefulWidget {
  String? id;
  SecondPage({Key? key,this.id}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
 var Controller = Get.put(HomePageController());

  @override
  void initState() {
    Controller.getSingleUser(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Singleuser'),
      ),
      body:Obx(() =>  Container(
        height: 100,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 80,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black54,
                image: DecorationImage(image:NetworkImage(Controller.singleuser.value.data!.avatar!,),fit: BoxFit.cover ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Controller.singleuser.value.data!.id.toString()),
                Text(Controller.singleuser.value.data!.email!),
                Text(Controller.singleuser.value.data!.firstName!),
                Text(Controller.singleuser.value.data!.lastName!),
              ],
            ),
          ],
        ),
      ),)
    );
  }
}
