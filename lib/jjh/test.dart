import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Http_Test extends StatefulWidget {
  const Http_Test({super.key});

  @override
  State<Http_Test> createState() => _Http_TestState();
}

class _Http_TestState extends State<Http_Test> {
  Future<Map> fetchInfo(env) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('access_token');
    String user_info_url = dotenv.get(env);
    final url = Uri.parse(user_info_url);

    /// 이곳은 네트워크 통신을 하여 json을 가져오는 곳입니다 ///////
    final jsonString = await http.get(
      url,
      headers: {
        "Authorization": "Bearer ${accessToken}",
      },
    );

//   http.Response jsonString = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json',
//   "Authorization": "Bearer ${accessToken}"
// },
//   );
    if (jsonString.statusCode == 200) {
      //만약 서버가 ok응답을 반환하면, json을 파싱합니다
      // print('백엔드쪽에서 응답 완료.');
      var jsonstring = utf8.decode(jsonString.bodyBytes);
      print(json.decode(jsonString.body));
      Map jsonMaps = jsonDecode(jsonstring);
      // List<User_Info> jsonLists =
      //     jsonMaps.map((dynamic item) => User_Info.fromJson(item)).toList();
      return jsonMaps;
      // return Info.fromJson(json.decode(response.body));
    } else {
      //만약 응답이 ok가 아니면 에러를 던집니다.
      throw Exception('status code = ${jsonString.statusCode} ');
    }
    //// 혼자 테스트한곳 //////
    // String jsonString =
    //     await rootBundle.loadString('assets/testjson/follow_list.json');
    // List<dynamic> jsonMaps = jsonDecode(jsonString);
    // List<Follows> jsonLists =
    //     jsonMaps.map((dynamic item) => Follows.fromJson(item)).toList();
    // // Follow_json follow_json = Follow_json.fromJson(jsonMaps);
    // return jsonLists;
    //// 여기까지 남겨두기 //////
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        //통신데이터 가져오기
        future: fetchInfo("profileImg"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            // print(snapshot.data.toString());
            print("성공적");
            return buildColumn(snapshot);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}에러!!");
            // return buildColumn(snapshot);
          }
          return CircularProgressIndicator();
          // return Http_Circle();
        },
      ),
    ));
  }

  Widget buildColumn(snapshot) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              Text(
                "${snapshot.data}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 100,),
              Container(width: 200,height: 200,child: FittedBox(fit: BoxFit.scaleDown,child: Image(image: NetworkImage("https://bridge-image-storage.s3.ap-northeast-2.amazonaws.com/test%40pusan.ac.kr/db6a84f5-b87d-4ca9-97ca-1ac5f4ffc18apoppy.jpg")))),
            ],
          ),
        ),
      ),
    );
  }
}
