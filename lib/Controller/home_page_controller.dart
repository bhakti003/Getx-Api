import 'dart:convert';
import 'package:api_demo/Models/get_user_model.dart';
import 'package:api_demo/Models/post_user_model.dart';
import 'package:api_demo/Models/single_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController{
  var userData=GetUserModel().obs;
  var singleuser = Singleuser().obs;
  var postuser = Postusermodel().obs;
  getApicall() async {
    print('Call Ing');
    var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if(response.statusCode==200){
      print("RESPONSE ${response.body}");
      userData.value= GetUserModel.fromJson(jsonDecode(response.body));
    }
  }
  getSingleUser(String id) async {
    print('Call SingleUser');
    var response = await http.get(Uri.parse("https://reqres.in/api/users/$id",));
    if (response.statusCode == 200) {
      print("Response${response.body}");
      var jsonResponse=jsonDecode(response.body);
      singleuser.value = Singleuser.fromJson(jsonResponse);
    }
  }
  postApiUser({required String name,required String job}) async {
    print('Call');
    var result = await http.post(Uri.parse("https://reqres.in/api/users"),body:{
      "name": name,
      "job": job,
    });
    print(result.body);
    if(result.statusCode == 201){
      print("Response${result.body}");
    }
  }
  // getApilist() async {
  //   print('calling');
  //   var res = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
  //   if(res.statusCode==200){
  //     print("FinalCall${res.body}");
  //     var jsonres = jsonDecode(res.body);
  //     userdata.value = GetUserModel.fromJson(jsonDecode(jsonres)) ;
  //   }
  // }
 }
