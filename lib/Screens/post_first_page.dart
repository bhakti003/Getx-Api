import 'package:api_demo/Controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PostFirstPage extends StatefulWidget {
  const PostFirstPage({Key? key}) : super(key: key);

  @override
  State<PostFirstPage> createState() => _PostFirstPageState();
}

class _PostFirstPageState extends State<PostFirstPage> {
  var homePageController = Get.put(HomePageController());
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  void initState() {
    // homePageController.postApiUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Api'),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(controller: nameController,),
          TextField(controller: jobController,),
          SizedBox(height: 5,),
          GestureDetector(onTap: (){
                homePageController.postApiUser(name: nameController.text, job: jobController.text);
          },
            child: Container(
              height: 40,
              width: 80,
              color: Colors.black54.withOpacity(0.3),
              child: Center(child: Text('Login')),
            ),
          )
        ]),
      ),
    );
  }
}
