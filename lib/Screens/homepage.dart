import 'dart:convert';
import 'package:api_demo/Controller/home_page_controller.dart';
import 'package:api_demo/Screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homePageController = Get.put(HomePageController());

  @override
  void initState() {
    homePageController.getApicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
      ),
      body: Obx(() => homePageController.userData.value.userList == null
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: homePageController.userData.value.userList!.length,
              itemBuilder: (context, index) {
                var userData =
                    homePageController.userData.value.userList![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => SecondPage(id:userData.id.toString()),),);
                          },
                          child: Container(
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
                                      image: DecorationImage(image:NetworkImage(userData.avatar!,),fit: BoxFit.cover ),
                                    ),
                                  ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${userData.id}",style: TextStyle(fontSize: 20),),
                                    Text("${userData.email}",),
                                    Text("${userData.firstName}",),
                                    Text("${userData.lastName}",),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
            )),
    );
  }
}
