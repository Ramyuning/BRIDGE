import 'dart:convert';

import 'package:bridge/jjh/kakaologin.dart';
import 'package:bridge/jjh/date.dart';
import 'package:bridge/jjh/datelist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputNickName extends StatefulWidget {
  const InputNickName({super.key});

  @override
  State<InputNickName> createState() => _InputNickNameState();
}

class _InputNickNameState extends State<InputNickName>
    with TickerProviderStateMixin {
  /// ANimaiton
  late Animation<double> _animation;
  late AnimationController _animation_controller;

  late Animation<double> _month_animation;
  late AnimationController _month_animation_controller;
  late Animation<double> _day_animation;
  late AnimationController _day_animation_controller;

  /// animation

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

  String check_time() {
    var now = new DateTime.now(); //반드시 다른 함수에서 해야함, Mypage같은 클래스에서는 사용 불가능
    String formatDate =
        DateFormat('yyyy/MM/dd - HH:mm:ss').format(now); //format변경
    String currentYear = formatDate.substring(0, 4);
    return currentYear;
  }

  callhim() {
    if (_formKey.currentState!.validate()) {
      //무조건 트루임 ㅇㅇ
    }
  }

  Future save(context) async {
    final url = Uri.parse(autherization_http);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? access_token = prefs.getString('access_token');
    /// callhim();
    FocusScope.of(context).unfocus();
    setState(() {
      // FocusScope.of(context).unfocus();
      // start = true;
      focus_month = false;
      focus_day = false;
      focus_year = false;
    });

    print("${nickname},${selectedyear},${selectedday},${selectedmonth}");
    print(access_token);
    Map data = {
      'nickname': nickname,
      'birthday': selectedyear + selectedday + selectedmonth,
    };
    var body = json.encode(data);
    http.Response res = await http.post(
      // 나중에 여기 주석처리 해제해서 사용.
      url,
      headers: {'Content-Type': 'application/json',"Authorization": "Bearer ${access_token}"},
      body: body,
    );
    // print();
    print(res.statusCode);
  }

  final _formKey = GlobalKey<FormState>();
  String nickname = "";
  String autherization_http = dotenv.get("Authorization");
  
  var _controller = TextEditingController();
  late FocusNode focusnode1;
  // _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length))
  bool onError = false;
  bool start = false;
  bool focus_month = false;
  bool focus_day = false;
  bool focus_year = false;
  late String Currentyear;
  late String selectedyear;
  late List<String> year;

  @override
  void initState() {
    //// For animantion
    print(autherization_http);
    _animation_controller = AnimationController(
      lowerBound: 0.3,
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _animation = CurvedAnimation(
      parent: _animation_controller,
      curve: Curves.easeIn,
    );
    _animation.addListener(() {
      setState(() {});
    });
    _month_animation_controller = AnimationController(
      lowerBound: 0.3,
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _month_animation = CurvedAnimation(
      parent: _month_animation_controller,
      curve: Curves.easeIn,
    );
    _month_animation.addListener(() {
      setState(() {});
    });
    _day_animation_controller = AnimationController(
      lowerBound: 0.3,
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _day_animation = CurvedAnimation(
      parent: _day_animation_controller,
      curve: Curves.easeIn,
    );
    _day_animation.addListener(() {
      setState(() {});
    });
    //// Stop
    /// TODO: implement initState
    int _nowyear = int.parse(check_time());
    String Currentyear = (_nowyear - 17).toString();
    year = return_year(_nowyear);
    print(Currentyear);
    selectedyear = Currentyear;
    super.initState();
    focusnode1 = FocusNode();
    // FocusScope.of(context).unfocus();
    focusnode1.addListener(() {
      if (focusnode1.hasFocus == false) {
        setState(() {
          start = true;
        });
      }
      ;
      callhim();
      // print("${focusnode1.hasFocus}");
    });
  }

  String selectedmonth = "01";
  String selectedday = "01";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          focus_month = false;
          focus_day = false;
          focus_year = false;
          _animation_controller.reverse();
          _day_animation_controller.reverse();
          _month_animation_controller.reverse();
        });
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.black),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: GetRealWidth(pixel: 20, context: context),
                  right: GetRealWidth(pixel: 20, context: context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: GetRealHeight(pixel: 65, context: context),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Image(
                            image: AssetImage(
                                "assets/images/inputnickname/leftvector.png")),
                        SizedBox(
                          width: GetRealWidth(pixel: 3, context: context),
                        ),
                        Text(
                          "뒤로가기",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: GetRealHeight(pixel: 44, context: context),
                  ),
                  Text(
                    "프로필을\n입력해주세요",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700,
                        fontSize: 28),
                  ),
                  SizedBox(
                    height: GetRealHeight(pixel: 87, context: context),
                  ),
                  Text(
                    "닉네임",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: GetRealHeight(pixel: 9, context: context),
                  ),
                  Text(
                    "닉네임은 한글, 영문, 숫자를 이용한 2~10자리 이내로 구성",
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: GetRealHeight(pixel: 10, context: context),
                  ),
                  Container(
                      height:
                          GetRealHeight(pixel: 80, context: context), // 여기 수정
                      width: double.maxFinite,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Column(
                        children: [
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
                                fillColor: Color.fromRGBO(255, 255, 255, 0.15),
                                contentPadding:
                                    EdgeInsets.fromLTRB(16, 0, 0, 0),
                                errorStyle: TextStyle(
                                    color: Color.fromRGBO(242, 199, 199, 1)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.3),
                                        width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.3),
                                        width: 1)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.3),
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.3),
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
                  SizedBox(
                    height: GetRealHeight(pixel: 37, context: context),
                  ),
                  Row(
                    children: [
                      Text(
                        "생년월일 ",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Text(
                        "(년, 월, 일)",
                        style: TextStyle(
                            color: Colors.white70,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: GetRealHeight(pixel: 6, context: context),
                  ),
                  Container(
                    height: GetRealHeight(pixel: 284, context: context),
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          height: GetRealHeight(pixel: 45, context: context),
                          width: double.maxFinite,
                          decoration: BoxDecoration(color: Colors.black),
                          child: Row(
                            children: [
                              GestureDetector(
                                // YEAR선택란
                                onTap: () {
                                  setState(() {
                                    if (focus_year == true) {
                                      focus_year = false;
                                    } else {
                                      focus_year = true;
                                    }
                                    _animation_controller.forward();
                                  });
                                },
                                child: Container(
                                  height: GetRealHeight(
                                      pixel: 45, context: context),
                                  width: GetRealWidth(
                                      pixel: 102, context: context),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.3),
                                          width: 1),
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.15),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Stack(children: [
                                    Center(
                                        child: Text(
                                      "${selectedyear}",
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white70,
                                          fontSize: 16),
                                    )),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/images/inputnickname/downvector.png")),
                                        )),
                                  ]),
                                ),
                              ),
                              SizedBox(
                                width:
                                    GetRealWidth(pixel: 22, context: context),
                              ),
                              GestureDetector(
                                // month선택란
                                onTap: () {
                                  setState(() {
                                    if (focus_month == true) {
                                      focus_month = false;
                                    } else {
                                      focus_month = true;
                                    }
                                    _month_animation_controller.forward();
                                  });
                                },
                                child: Container(
                                  height: GetRealHeight(
                                      pixel: 45, context: context),
                                  width: GetRealWidth(
                                      pixel: 102, context: context),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.3),
                                          width: 1),
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.15),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Stack(children: [
                                    Center(
                                        child: Text(
                                      "${selectedmonth}",
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white70,
                                          fontSize: 16),
                                    )),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/images/inputnickname/downvector.png")),
                                        )),
                                  ]),
                                ),
                              ),
                              SizedBox(
                                width:
                                    GetRealWidth(pixel: 22, context: context),
                              ),
                              GestureDetector(
                                //day선택란
                                onTap: () {
                                  setState(() {
                                    if (focus_day == true) {
                                      focus_day = false;
                                    } else {
                                      focus_day = true;
                                    }
                                    _day_animation_controller.forward();
                                  });
                                },
                                child: Container(
                                  height: GetRealHeight(
                                      pixel: 45, context: context),
                                  width: GetRealWidth(
                                      pixel: 102, context: context),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.3),
                                          width: 1),
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.15),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Stack(children: [
                                    Center(
                                        child: Text(
                                      "${selectedday}",
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white70,
                                          fontSize: 16),
                                    )),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/images/inputnickname/downvector.png")),
                                        )),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: GetRealHeight(pixel: 150, context: context),
                          child: InkWell(
                            onTap: () {
                              callhim();
                              if (!onError && !(nickname == "")) {
                                save(context);
                              } else {
                                setState(() {
                                  focus_day = false;
                                  focus_month = false;
                                  focus_year = false;
                                  start = true;
                                  onError = true;
                                });
                              }
                            },
                            child: Container(
                              width: GetRealWidth(pixel: 350, context: context),
                              height:
                                  GetRealHeight(pixel: 45, context: context),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(55, 29, 156, 1),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text(
                                  "회원가입",
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
                        ),
                        focus_year
                            ? Positioned(
                                left: GetRealWidth(pixel: 2, context: context),
                                top: GetRealHeight(pixel: 45, context: context),
                                child: Container(
                                  width:
                                      GetRealWidth(pixel: 97, context: context),
                                  height: GetRealHeight(
                                      pixel: _animation.value * 234,
                                      context: context),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(54, 54, 54, 1),
                                      borderRadius: BorderRadius.circular(9)),
                                  child: YearSelector(
                                    height: GetRealHeight(
                                        pixel: 10, context: context),
                                    yearlist: year,
                                    onDateTimeChanged: (int value) {
                                      setState(() {
                                        selectedyear = year[value];
                                        print(selectedyear);
                                      });
                                    },
                                  ),
                                ))
                            : Container(),
                        focus_month
                            ? Positioned(
                                left:
                                    GetRealWidth(pixel: 126, context: context),
                                top: GetRealHeight(pixel: 45, context: context),
                                child: Container(
                                  width:
                                      GetRealWidth(pixel: 97, context: context),
                                  height: GetRealHeight(
                                      pixel: _month_animation.value * 234,
                                      context: context),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(54, 54, 54, 1),
                                      borderRadius: BorderRadius.circular(9)),
                                  child: MonthSelector(
                                    height: GetRealHeight(
                                        pixel: 10, context: context),
                                    monthlist: month,
                                    onDateTimeChanged: (int value) {
                                      setState(() {
                                        selectedmonth = month[value];
                                        print(selectedmonth);
                                      });
                                    },
                                  ),
                                ))
                            : Container(),
                        focus_day
                            ? Positioned(
                                left:
                                    GetRealWidth(pixel: 250, context: context),
                                top: GetRealHeight(pixel: 45, context: context),
                                child: Container(
                                  width:
                                      GetRealWidth(pixel: 97, context: context),
                                  height: GetRealHeight(
                                      pixel: _day_animation.value * 234,
                                      context: context),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(54, 54, 54, 1),
                                      borderRadius: BorderRadius.circular(9)),
                                  child: DaySelector(
                                    height: GetRealHeight(
                                        pixel: 10, context: context),
                                    daylist: day,
                                    onDateTimeChanged: (int value) {
                                      setState(() {
                                        selectedday = day[value];
                                        print(selectedday);
                                      });
                                    },
                                  ),
                                ))
                            : Container()
                      ],
                    ),
                  ),
                  // Text("${selectedmonth}",style: TextStyle(color: Colors.white),),
                  Center(
                    child: Text(
                      "크리에이터 회원이신가요?",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  // OutlinedButton(
                  //   onPressed: () {
                  //     FocusScope.of(context).unfocus();
                  //     setState(() {
                  //       focus_month = false;
                  //       focus_day = false;
                  //       focus_year = false;
                  //     });
                  //   },
                  //   child: Text("포커스만 뺌"),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
