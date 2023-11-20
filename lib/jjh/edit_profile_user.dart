import 'dart:convert';
import 'package:bridge/jjh/generator_class/userinfo_convert.dart';
import 'package:bridge/jjh/http_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'generator_class/follow_list_convert.dart';
import 'mypage_user.dart';

class Edit_Profile_User extends StatefulWidget {
  const Edit_Profile_User({super.key});

  @override
  State<Edit_Profile_User> createState() => _Edit_Profile_UserState();
}

class _Edit_Profile_UserState extends State<Edit_Profile_User> {
  Future<Map> fetchInfo(env) async {

    /// 이곳은 accesstoken과 url을 가져오는 곳입니다! 혼자테스트할때는 지워주세요!
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('access_token');
  String user_info_url = dotenv.get(env);
  final url = Uri.parse(user_info_url);
  /// 이곳은 네트워크 통신을 하여 json을 가져오는 곳입니다 ///////
  final jsonString = await http.get(url,headers: {
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
//     String jsonString =
//         await rootBundle.loadString('assets/testjson/follow_list.json');
//     List jsonMaps = jsonDecode(jsonString);

    
//     // Follow_json follow_json = Follow_json.fromJson(jsonMaps);
//     return {
//     "id": 2,
//     "email": "test@pusan.ac.kr"
// };
    //// 여기까지 남겨두기 //////
  }
  callhim() {
    if (_formKey.currentState!.validate()) {
      // print("${_formKey.currentState!.validate()}");
      return true;
    } else {
      // print("${_formKey.currentState!.validate()}");
      return false;
    }
  }
  final _formKey = GlobalKey<FormState>();
  var _controller = TextEditingController();
  String nickname = "";
  bool onError = false;
  bool start = false;
  late FocusNode focusnode1;

  final GlobalKey _containerKey = GlobalKey();
  Offset? offset;

  @override
  void initState() {
    super.initState();
    focusnode1 = FocusNode();
    focusnode1.addListener(() {
      if (focusnode1.hasFocus == false) {
        setState(() {
        start = true;
      });};
      callhim();
      // print("${focusnode1.hasFocus}");
    });
    // setState(() {
    //     offset = _getOffset();
    //   });
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        offset = _getOffset();
      });
    });
  }

  double GetRealWidth({
    required double pixel,
    required BuildContext context,
  }) {
    double PX = MediaQuery.of(context).size.width / 390;
    return pixel * PX;
  }

//Return Real Height from Figma's Widget height
  double GetRealHeight({
    required double pixel,
    required BuildContext context,
  }) {
    double PX = MediaQuery.of(context).size.height / 844;
    return pixel * PX;
  }

  Offset? _getOffset() {
    if (_containerKey.currentContext != null) {
      final RenderBox renderBox =
          _containerKey.currentContext!.findRenderObject() as RenderBox;
      Offset offset = renderBox.localToGlobal(Offset.zero);
      print("안뇽");
      return offset;
    }
  }

Future<bool> save(context,birthday) async {
  String autherization_http = dotenv.get("Authorization");
    final url = Uri.parse(autherization_http);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? access_token = prefs.getString('access_token');
    /// callhim();
    FocusScope.of(context).unfocus();

    print("${nickname}");
    print(access_token);
    Map data = {
      'nickname': nickname,
      'birthday': birthday,
    };
    var body = json.encode(data);
    http.Response res = await http.post(
      // 나중에 여기 주석처리 해제해서 사용.
      url,
      headers: {'Content-Type': 'application/json',"Authorization": "Bearer ${access_token}"},
      body: body,
    );
    // print();
    if (res.statusCode== 200) {
      return Future<bool>.value(true);
    }
    else {
      return Future<bool>.value(false);
    }
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Center(
  //     child: FutureBuilder(
  //       //통신데이터 가져오기
  //       future: fetchInfo("myinfo"),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {

  //           print(snapshot.data);
  //           print("성공적");

  //           return buildColumn(snapshot);
  //         } else if (snapshot.hasError) {
  //           return Text("${snapshot.error}에러!!");
  //           // return buildColumn(snapshot);
  //         }
  //         return
  //         // Scaffold(body: Container(width: double.infinity,height: double.infinity,child: Center(child: Text("안돼용")),),);
  //         CircularProgressIndicator();
  //         // return buildColumn(snapshot);
  //       },
  //     ),
  //   ));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        //통신데이터 가져오기
        future: fetchInfo("myinfo"),
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
          // return CircularProgressIndicator();
          return Http_Circle();
        },
      ),
    ));
  }

  Widget buildColumn(snapshot) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return GestureDetector(
      onTap: () {
        focusnode1.unfocus();
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.black),
          child: Padding(
            padding: EdgeInsets.only(top: statusBarHeight, left: 16, right: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      SizedBox(
                        width: GetRealHeight(pixel: 23, context: context),
                        height: GetRealHeight(pixel: 23, context: context),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Icon(
                            CupertinoIcons.left_chevron,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: GetRealWidth(pixel: 58, context: context),
                          height: GetRealHeight(pixel: 22, context: context),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "뒤로가기",
                              style: TextStyle(
                                  fontFamily: "Pretendard",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    "프로필 편집",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: GetRealHeight(pixel: 35, context: context),
                ),
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: GetRealWidth(pixel: 200, context: context),
                        height: GetRealHeight(pixel: 130, context: context),
                      ),
                      Center(
                        child: Container(
                          key: _containerKey,
                          width: GetRealWidth(pixel: 124, context: context),
                          height: GetRealHeight(pixel: 124, context: context),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          child: FittedBox(fit: BoxFit.contain,child: Icon(CupertinoIcons.person_alt)),
                        ),
                      ),
                      Positioned(
                        top: 90,
                        left: 210,
                        child: Container(
                        width: GetRealWidth(pixel: 33, context: context),
                        height: GetRealHeight(pixel: 33, context: context),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                            child: Icon(CupertinoIcons.pencil),
                      ),),
                    ],
                  ),
                ),
                SizedBox(
                  height: GetRealHeight(pixel: 64, context: context),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "닉네임",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      Text(
                        "닉네임은 한글, 영문, 숫자를 이용한 2~10자리 이내로 구성",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: GetRealHeight(pixel: 6, context: context),
                ),
                // Container(height: GetRealHeight(pixel: 45, context: context),width: GetRealWidth(pixel: 350, context: context),decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(88, 0, 255, 1),),borderRadius: BorderRadius.all(Radius.circular(8))),),
                Container(
                    height: GetRealHeight(pixel: 80, context: context), // 여기 수정
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        // Text("텍스트필드 들어갈 자리")
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              // autovalidateMode: AutovalidateMode.always,
                              focusNode: focusnode1,
                              // TextSelection.fromPosition(TextPosition(offset: editContent.text.length)),
                              controller: _controller,
                              // TextEditingController(text: dest,),
                              // onTap: () {_controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));},
                              onChanged: (val) {
                                nickname = val;
                              },
                              validator: (String? value) {
                                setState(() {
                                  onError = false;
                                });
                                if (value!.isEmpty) {
                                  setState(() {
                                    onError = true;
                                  });
                                  return null;
                                }
                                // if (value.contains(other))
                                return null;
                              },
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w300),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                                contentPadding:
                                    EdgeInsets.fromLTRB(16, 0, 0, 0),
                                errorStyle: TextStyle(
                                    color: Color.fromRGBO(242, 199, 199, 1)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color:
                                        Color.fromRGBO(88, 0, 255, 1),
                                            // Color.fromRGBO(255, 255, 255, 0.3),
                                        width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color:
                                        Color.fromRGBO(88, 0, 255, 1),
                                            // Color.fromRGBO(255, 255, 255, 0.3),
                                        width: 1)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color:
                                        Color.fromRGBO(88, 0, 255, 1),
                                            // Color.fromRGBO(255, 255, 255, 0.3),
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color:
                                        Color.fromRGBO(118, 44, 255, 1),
                                            // Color.fromRGBO(255, 255, 255, 0.3),
                                        width: 1)),
                                hintText: "ex) 방구석 백수",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.7),
                                  fontFamily: "Pretendard",
                                  fontWeight: FontWeight.w300,
                                  //     color: Colors.blueAccent,
                                  fontSize: 16,
                                ),
                                //   border: OutlineInputBorder(
                                //       borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          // focusnode1.hasFocus
                          //     ? Container()
                          //     : (_formKey.currentState!.validate()
                          //         ? Container()
                          //         : Container()), // ㅋㅋㅋ 이거뭐임ㅋㅋㅋ
                          // focusnode1.hasFocus ? null : callhim(),
                          start
                              ? !onError
                                  ? Row(
                                      children: [
                                        Text(
                                          "멋진 닉네임이네요!",
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(51, 255, 0, 1),
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                          "유효하지 않은 닉네임입니다",
                                          style: TextStyle(
                                            color: Color.fromRGBO(255, 0, 0, 1),
                                            fontSize: 12,
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                              : Container(),
                      ],
                    )),
    
                /// 텍스트필드 끝
                SizedBox(
                  height: GetRealHeight(pixel: 15, context: context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "이용자 아이디 ",
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    Text(
                      "(변경 불가)",
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: GetRealHeight(pixel: 5, context: context),
                ),
                Container(
                  width: GetRealWidth(pixel: 350, context: context),
                  height: GetRealHeight(pixel: 45, context: context),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.15),
                      border: Border.all(
                        color: Color.fromRGBO(255, 255, 255, 0.3),
                      ),
                      borderRadius: BorderRadius.circular(8)),
                      child: Align(alignment: Alignment.centerLeft,child: Row(
                        children: [
                          SizedBox(width: GetRealWidth(pixel: 15, context: context),),
                          Text("#${snapshot.data['id']}",style: TextStyle(color: Colors.white.withOpacity(0.7),fontFamily: "Pretendard",fontSize: 17,fontWeight: FontWeight.w300),),
                        ],
                      )),
                ),
                SizedBox(
                  height: GetRealHeight(pixel: 48, context: context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "가입일 ",
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    Text(
                      "(변경 불가)",
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: GetRealHeight(pixel: 6, context: context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: GetRealWidth(pixel: 102, context: context),
                      height: GetRealHeight(pixel: 45, context: context),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.15),
                          border: Border.all(
                            color: Color.fromRGBO(255, 255, 255, 0.3),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text("2023",style: TextStyle(color: Colors.white.withOpacity(0.7),fontFamily: "Pretendard",fontSize: 17,fontWeight: FontWeight.w300),),),
                    ),
                    Container(
                      width: GetRealWidth(pixel: 102, context: context),
                      height: GetRealHeight(pixel: 45, context: context),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.15),
                          border: Border.all(
                            color: Color.fromRGBO(255, 255, 255, 0.3),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text("11",style: TextStyle(color: Colors.white.withOpacity(0.7),fontFamily: "Pretendard",fontSize: 17,fontWeight: FontWeight.w300),),),
                    ),
                    Container(
                      width: GetRealWidth(pixel: 102, context: context),
                      height: GetRealHeight(pixel: 45, context: context),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.15),
                          border: Border.all(
                            color: Color.fromRGBO(255, 255, 255, 0.3),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text("17",style: TextStyle(color: Colors.white.withOpacity(0.7),fontFamily: "Pretendard",fontSize: 17,fontWeight: FontWeight.w300),),),
                    ),
                  ],
                ),
                SizedBox(height: GetRealHeight(pixel: 30, context: context),),
                Container(
                width: GetRealWidth(pixel: 330, context: context),
                height: GetRealHeight(pixel: 45, context: context),
                decoration: BoxDecoration(
                    // color: Color.fromRGBO(88, 0, 255, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(88, 0, 255, 0.5),

                      ),
                      BoxShadow(
                          color: Color.fromRGBO(88, 0, 255, 1),
                          spreadRadius: -2.0,
                          blurRadius: 3.0,
                          offset: Offset(0, 2)),
                    ],
                    borderRadius: BorderRadius.circular(30)),
                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      Future<bool> asdf = save(context,snapshot.data["birthday"]);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: ButtonTheme.of(context).minWidth,
                      height: ButtonTheme.of(context).height,
                      child: Center(
                        child: Text(
                          "완료",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.2),
                        ),
                      ),
                    ),
                  ),
                  color: Colors.transparent,
                ),
              ),
    
                // Text(
                //   "${_containerKey.currentContext}",
                //   // "응ㅇ",
                //   style: TextStyle(color: Colors.white),
                // ),
                // Text(
                //   "${GetRealHeight(pixel: 1, context: context)}",
                //   style: TextStyle(color: Colors.white),
                // ),
                // Text(
                //   "${GetRealWidth(pixel: 1, context: context)}",
                //   style: TextStyle(color: Colors.white),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
