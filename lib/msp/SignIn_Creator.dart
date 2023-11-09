import 'package:bridge/jjh/date.dart';
import 'package:bridge/jjh/datelist.dart';
import 'package:bridge/msp/Classes.dart';
import 'package:flutter/material.dart';
import 'package:bridge/msp/functions.dart';
import 'package:email_otp/email_otp.dart';

EmailOTP emailOTP = EmailOTP();

class GoBackButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      Navigator.pop(context);
      },
      child: Row(
      children: [
      Image(image: AssetImage("assets/images/inputnickname/leftvector.png")),
      SizedBox(width: GetRealWidth(pixel: 3, context: context),),
      Text("뒤로가기",
          style:  SimpleTextStyle(size: 16, color: Colors.white, weight: FontWeight.w300)
      ),
      ],
      ),
    );
  }
}

// class TextBoxInput extends StatefulWidget{
//   @override
//   State<TextBoxInput> createState() => _TextBoxInputState();
// }
//
// class _TextBoxInputState extends State<TextBoxInput> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text(
//             "닉네임",
//             style: SimpleTextStyle(size: 16, color: Colors.white, weight: FontWeight.w500)
//           ),
//           SizedBox(
//             height: GetRealHeight(pixel: 9, context: context),
//           ),
//           Text(
//             "닉네임은 한글, 영문, 숫자를 이용한 2~10자리 이내로 구성",
//             style: SimpleTextStyle(size: 12, color: Colors.white70, weight: FontWeight.w500)
//           ),
//           SizedBox(
//             height: GetRealHeight(pixel: 10, context: context),
//           ),
//           Container(
//               height: GetRealHeight(pixel: 80, context: context), // 여기 수정
//               width: double.maxFinite,
//               decoration: BoxDecoration(color: Colors.black),
//               child: Column(
//                 children: [
//                   Form(
//                     key: _formKey,
//                     child: TextFormField(
//                       // autovalidateMode: AutovalidateMode.always,
//                       focusNode: focusnode1,
//                       // TextSelection.fromPosition(TextPosition(offset: editContent.text.length)),
//                       controller: _controller,
//                       // TextEditingController(text: dest,),
//                       // onTap: () {_controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));},
//                       onChanged: (val) {
//                         dest = val;
//                       },
//                       validator: (String? value) {
//                         setState(() {
//                           onError = false;
//                         });
//                         if (value!.isEmpty) {
//                           setState(() {
//                             onError = true;
//                           });
//                           return null;
//                         }
//                         return;
//                       },
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                           fontFamily: "Pretendard",
//                           fontWeight: FontWeight.w300),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color.fromRGBO(255, 255, 255, 0.15),
//                         contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
//                         errorStyle: TextStyle(
//                             color: Color.fromRGBO(242, 199, 199, 1)),
//                         errorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide(
//                                 color: Color.fromRGBO(255, 255, 255, 0.3),
//                                 width: 1)),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide(
//                                 color: Color.fromRGBO(255, 255, 255, 0.3),
//                                 width: 1)),
//                         focusedErrorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide(
//                                 color: Color.fromRGBO(255, 255, 255, 0.3),
//                                 width: 1)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide(
//                                 color: Color.fromRGBO(255, 255, 255, 0.3),
//                                 width: 1)),
//                         hintText: "ex) 방구석 백수",
//                         hintStyle: TextStyle(
//                           color: Color.fromRGBO(255, 255, 255, 0.7),
//                           fontFamily: "Pretendard",
//                           fontWeight: FontWeight.w300,
//                           //     color: Colors.blueAccent,
//                           fontSize: 16,
//                         ),
//                         //   border: OutlineInputBorder(
//                         //       borderSide: BorderSide.none),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 9,
//                   ),
//                   // focusnode1.hasFocus
//                   //     ? Container()
//                   //     : (_formKey.currentState!.validate()
//                   //         ? Container()
//                   //         : Container()), // ㅋㅋㅋ 이거뭐임ㅋㅋㅋ
//                   // focusnode1.hasFocus ? null : callhim(),
//                   start ? !onError
//                       ? Row(
//                     children: [
//                       Text(
//                         "일치하긴 하네",
//                         style: TextStyle(
//                           color: Color.fromRGBO(51, 255, 0, 1),
//                           fontFamily: "Pretendard",
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ) :
//                   Row(
//                     children: [
//                       Text(
//                         "입력점 해주세요",
//                         style: TextStyle(
//                           color: Color.fromRGBO(255, 0, 0, 1),
//                           fontSize: 12,
//                           fontFamily: "Pretendard",
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ) : Container(),
//
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
// }


class InputFirstPage extends StatefulWidget {
  const InputFirstPage({super.key});

  @override
  State<InputFirstPage> createState() => _InputFirstPageState();
}

class _InputFirstPageState extends State<InputFirstPage> {
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

  callhim() {
    if (_formKey.currentState!.validate()) {
      // print("${_formKey.currentState!.validate()}");
      return true;
    } else {
      // print("${_formKey.currentState!.validate()}");
      return false;
    }
  }
  callback_realName() {
    if (_formKey2.currentState!.validate()) {
      // print("${_formKey.currentState!.validate()}");
      return true;
    } else {
      // print("${_formKey.currentState!.validate()}");
      return false;
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String dest = "";
  var _controller = TextEditingController();
  var _controller2 = TextEditingController();
  late FocusNode focusnode1;
  late FocusNode focusnode2;
  // _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length))
  bool onError = false;
  bool start = false;
  bool start2 = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusnode1 = FocusNode();
    focusnode2 = FocusNode();
    // FocusScope.of(context).unfocus();
    focusnode1.addListener(() {
      if (focusnode1.hasFocus == false) {
        setState(() {
        start = true;
      });};
      callhim();
      // print("${focusnode1.hasFocus}");
    });
    focusnode2.addListener(() {
      if (focusnode2.hasFocus == false) {
        setState(() {
        start2 = true;
      });};
      callback_realName();
      // print("${focusnode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: EdgeInsets.only(
              left: GetRealWidth(pixel: 30, context: context),
              right: GetRealWidth(pixel: 30, context: context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: GetRealHeight(pixel: 65, context: context),
              ),
              GoBackButton(),
              SizedBox(
                height: GetRealHeight(pixel: 34, context: context),
              ),
              Text(
                "크리에이터님,\n정보를 입력해주세요!",
                style: SimpleTextStyle(size: 28, weight: FontWeight.w600)
              ),
              SizedBox(
                height: GetRealHeight(pixel: 87, context: context),
              ),
              //크리에이터명
              Text(
                "크리에이터명",
                style: SimpleTextStyle(size: 16, weight: FontWeight.w500),
              ),
              SizedBox(
                height: GetRealHeight(pixel: 9, context: context),
              ),
              Container(
                  height: GetRealHeight(pixel: 80, context: context),
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
                            dest = val;
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
                            return;
                          },
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 0.15),
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            errorStyle: TextStyle(
                                color: Color.fromRGBO(242, 199, 199, 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            hintText: "ex) 마스크걸",
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
                      start ? !onError
                          ? Row(
                              children: [
                              ],
                            ) :
                          Row(
                              children: [
                                Text(
                                  "크리에이터명을 입력해 주세요",
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 0, 0, 1),
                                    fontSize: 12,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ) : Container(),

                    ],
                  )),
              //이름 칸
              Text(
                "이름 (실명)",
                style: SimpleTextStyle(size: 16, weight: FontWeight.w500),
              ),
              SizedBox(
                height: GetRealHeight(pixel: 9, context: context),
              ),
              Container(
                  height: GetRealHeight(pixel: 80, context: context),
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey2,
                        child: TextFormField(
                          // autovalidateMode: AutovalidateMode.always,
                          focusNode: focusnode2,
                          // TextSelection.fromPosition(TextPosition(offset: editContent.text.length)),
                          controller: _controller2,
                          // TextEditingController(text: dest,),
                          // onTap: () {_controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));},
                          onChanged: (val) {
                            dest = val;
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
                            return;
                          },
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 0.15),
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            errorStyle: TextStyle(
                                color: Color.fromRGBO(242, 199, 199, 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            hintText: "ex) 김모미",
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
                      start2 ? !onError
                          ? Row(
                              children: [

                              ],
                            ) :
                          Row(
                              children: [
                                Text(
                                  "이름을 입력해주세요",
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 0, 0, 1),
                                    fontSize: 12,
                                    fontFamily: "Pretendard",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ) : Container(),

                    ],
                  )),
              SizedBox(
                height: GetRealHeight(pixel: 15, context: context),
              ),
              //생년월일
              Row(
                children: [
                  Text(
                    "성별",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
              RealSizedBox(width: 0, height: 9),
              Container(
                height: GetRealHeight(pixel: 45, context: context),
                width: double.maxFinite,
                decoration: BoxDecoration(color: Colors.black),
                child: Row(
                  children: [
                    Container(
                      height: GetRealHeight(pixel: 45, context: context),
                      width: GetRealWidth(pixel: 102, context: context),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.3),
                              width: 1),
                          color: Color.fromRGBO(255, 255, 255, 0.15),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text("남성", style: SimpleTextStyle(size: 16, color: Color.fromRGBO(255, 255, 255, 0.7), weight: FontWeight.w400),),
                    ),
                    SizedBox(
                      width: GetRealWidth(pixel: 12, context: context),
                    ),
                    Container(
                      height: GetRealHeight(pixel: 45, context: context),
                      width: GetRealWidth(pixel: 102, context: context),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.3),
                              width: 1),
                          color: Color.fromRGBO(255, 255, 255, 0.15),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text("여성", style: SimpleTextStyle(size: 16, color: Color.fromRGBO(255, 255, 255, 0.7), weight: FontWeight.w400),),
                    ),
                    SizedBox(
                      width: GetRealWidth(pixel: 12, context: context),
                    ),
                    Container(
                      height: GetRealHeight(pixel: 45, context: context),
                      width: GetRealWidth(pixel: 102, context: context),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.3),
                              width: 1),
                          color: Color.fromRGBO(255, 255, 255, 0.15),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text("제 3의 성", style: SimpleTextStyle(size: 16, color: Color.fromRGBO(255, 255, 255, 0.7), weight: FontWeight.w400),),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: GetRealHeight(pixel: 37, context: context),
              ),
              //생년월일
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
                    "(월, 일, 년)",
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ],
              ),
              Container(
                height: GetRealHeight(pixel: 45, context: context),
                width: double.maxFinite,
                decoration: BoxDecoration(color: Colors.black),
                child: Row(
                  children: [
                    YearSelector(onDateTimeChanged: (int a){}, yearlist: return_year(2023), height: 50),

                    Container(
                      height: GetRealHeight(pixel: 45, context: context),
                      width: GetRealWidth(pixel: 102, context: context),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.3),
                              width: 1),
                          color: Color.fromRGBO(255, 255, 255, 0.15),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(
                      width: GetRealWidth(pixel: 12, context: context),
                    ),
                    Container(
                      height: GetRealHeight(pixel: 45, context: context),
                      width: GetRealWidth(pixel: 102, context: context),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.3),
                              width: 1),
                          color: Color.fromRGBO(255, 255, 255, 0.15),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(
                      width: GetRealWidth(pixel: 12, context: context),
                    ),
                    Container(
                      height: GetRealHeight(pixel: 45, context: context),
                      width: GetRealWidth(pixel: 102, context: context),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.3),
                              width: 1),
                          color: Color.fromRGBO(255, 255, 255, 0.15),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: GetRealHeight(pixel: 110, context: context),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const InputSecondPage()));
                },
                child: Container(
                  width: GetRealWidth(pixel: 330, context: context),
                  height: GetRealHeight(pixel: 45, context: context),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(55, 29, 156, 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "다음",
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
            ],
          ),
        ),
      ),
    );
  }
}

class InputSecondPage extends StatefulWidget {
  const InputSecondPage({super.key});

  @override
  State<InputSecondPage> createState() => _InputSecondPageState();
}

class _InputSecondPageState extends State<InputSecondPage> {
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

  callhim() {
    if (_formKey3.currentState!.validate()) {
      // print("${_formKey.currentState!.validate()}");
      return true;
    } else {
      // print("${_formKey.currentState!.validate()}");
      return false;
    }
  }

  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  String dest = "";
  var _controller = TextEditingController();
  var _controller2 = TextEditingController();
  var _controller3 = TextEditingController();
  var _controller4 = TextEditingController();
  late FocusNode focusnode1;
  late FocusNode focusnode2;
  late FocusNode focusnode3;
  late FocusNode focusnode4;
  // _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length))
  bool onError = false;
  bool start = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusnode1 = FocusNode();
    focusnode2 = FocusNode();
    focusnode3 = FocusNode();
    focusnode4 = FocusNode();
    // FocusScope.of(context).unfocus();
    focusnode1.addListener(() {
      if (focusnode1.hasFocus == false) {
        setState(() {
          start = true;
        });};
      callhim();
      // print("${focusnode1.hasFocus}");
    });
    focusnode2.addListener(() {
      if (focusnode2.hasFocus == false) {
        setState(() {
          start = true;
        });};
      callhim();
      // print("${focusnode1.hasFocus}");
    });
    focusnode3.addListener(() {
      if (focusnode3.hasFocus == false) {
        setState(() {
          start = true;
        });};
      callhim();
      // print("${focusnode1.hasFocus}");
    });
    focusnode4.addListener(() {
      if (focusnode4.hasFocus == false) {
        setState(() {
          start = true;
        });};
      callhim();
      // print("${focusnode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: EdgeInsets.only(
              left: GetRealWidth(pixel: 30, context: context),
              right: GetRealWidth(pixel: 30, context: context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: GetRealHeight(pixel: 65, context: context),
              ),
              GoBackButton(),
              SizedBox(
                height: GetRealHeight(pixel: 34, context: context),
              ),
              Text(
                  "크리에이터님,\n정보를 입력해주세요!2",
                  style: SimpleTextStyle(size: 28, weight: FontWeight.w600)
              ),
              SizedBox(
                height: GetRealHeight(pixel: 87, context: context),
              ),
              //크리에이터명
              Text(
                "채널 링크",
                style: SimpleTextStyle(size: 16, weight: FontWeight.w500),
              ),
              SizedBox(
            height: GetRealHeight(pixel: 9, context: context),
          ),
          Text(
            "활동하시는 플랫폼의 개인 채널 링크를 입력해주세요 (최대 3개)",
            style: SimpleTextStyle(size: 12, color: Colors.white70, weight: FontWeight.w500)
          ),
              SizedBox(
                height: GetRealHeight(pixel: 9, context: context),
              ),
              Container(
                  height: GetRealHeight(pixel: 80, context: context),
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey3,
                        child: TextFormField(
                          // autovalidateMode: AutovalidateMode.always,
                          focusNode: focusnode1,
                          // TextSelection.fromPosition(TextPosition(offset: editContent.text.length)),
                          controller: _controller,
                          // TextEditingController(text: dest,),
                          // onTap: () {_controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));},
                          onChanged: (val) {
                            dest = val;
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
                            return;
                          },
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 0.15),
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            errorStyle: TextStyle(
                                color: Color.fromRGBO(242, 199, 199, 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            hintText: "ex) https://www.youtube.com",
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
                      start ? !onError
                          ? Row(
                        children: [
                          Text(
                            "일치하긴 하네",
                            style: TextStyle(
                              color: Color.fromRGBO(51, 255, 0, 1),
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ) :
                      Row(
                        children: [
                          Text(
                            "입력점 해주세요",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 0, 0, 1),
                              fontSize: 12,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ) : Container(),

                    ],
                  )),
              Container(
                  height: GetRealHeight(pixel: 80, context: context),
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey4,
                        child: TextFormField(
                          // autovalidateMode: AutovalidateMode.always,
                          focusNode: focusnode2,
                          // TextSelection.fromPosition(TextPosition(offset: editContent.text.length)),
                          controller: _controller2,
                          // TextEditingController(text: dest,),
                          // onTap: () {_controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));},
                          onChanged: (val) {
                            dest = val;
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
                            return;
                          },
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 0.15),
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            errorStyle: TextStyle(
                                color: Color.fromRGBO(242, 199, 199, 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            hintText: "ex) https://www.youtube.com",
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
                      start ? !onError
                          ? Row(
                        children: [
                          Text(
                            "일치하긴 하네",
                            style: TextStyle(
                              color: Color.fromRGBO(51, 255, 0, 1),
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ) :
                      Row(
                        children: [
                          Text(
                            "입력점 해주세요",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 0, 0, 1),
                              fontSize: 12,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ) : Container(),
                    ],
                  )),
              Container(
                  height: GetRealHeight(pixel: 80, context: context),
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey5,
                        child: TextFormField(
                          // autovalidateMode: AutovalidateMode.always,
                          focusNode: focusnode3,
                          // TextSelection.fromPosition(TextPosition(offset: editContent.text.length)),
                          controller: _controller3,
                          // TextEditingController(text: dest,),
                          // onTap: () {_controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));},
                          onChanged: (val) {
                            dest = val;
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
                            return;
                          },
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 0.15),
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            errorStyle: TextStyle(
                                color: Color.fromRGBO(242, 199, 199, 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            hintText: "ex) https://www.youtube.com",
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
                      start ? !onError
                          ? Row(
                        children: [
                          Text(
                            "일치하긴 하네",
                            style: TextStyle(
                              color: Color.fromRGBO(51, 255, 0, 1),
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ) :
                      Row(
                        children: [
                          Text(
                            "입력점 해주세요",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 0, 0, 1),
                              fontSize: 12,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ) : Container(),

                    ],
                  )),
              //이름 칸
              Text(
                "비즈니스 이메일",
                style: SimpleTextStyle(size: 16, weight: FontWeight.w500),
              ),
              SizedBox(
                height: GetRealHeight(pixel: 9, context: context),
              ),
              Text(
                  "크리에이터 인증을 위해 개인 채널에 기재된 비즈니스 이메일을 입력해주세요",
                  style: SimpleTextStyle(size: 12, color: Colors.white70, weight: FontWeight.w500)
              ),
              Container(
                  height: GetRealHeight(pixel: 80, context: context),
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey6,
                        child: TextFormField(
                          // autovalidateMode: AutovalidateMode.always,
                          focusNode: focusnode1,
                          // TextSelection.fromPosition(TextPosition(offset: editContent.text.length)),
                          controller: _controller,
                          // TextEditingController(text: dest,),
                          // onTap: () {_controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));},
                          onChanged: (val) {
                            dest = val;
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
                            return;
                          },
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 0.15),
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            errorStyle: TextStyle(
                                color: Color.fromRGBO(242, 199, 199, 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            hintText: "ex) https://www.youtube.com",
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
                      start ? !onError
                          ? Row(
                        children: [
                          Text(
                            "일치하긴 하네",
                            style: TextStyle(
                              color: Color.fromRGBO(51, 255, 0, 1),
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ) :
                      Row(
                        children: [
                          Text(
                            "입력점 해주세요",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 0, 0, 1),
                              fontSize: 12,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ) : Container(),
                    ],
                  )),
              SizedBox(
                height: GetRealHeight(pixel: 37, context: context),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Signin_OTP()));

                },
                child: Container(
                  width: GetRealWidth(pixel: 330, context: context),
                  height: GetRealHeight(pixel: 45, context: context),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(55, 29, 156, 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "다음",
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
            ],
          ),
        ),
      ),
    );
  }
}
class Signin_OTP extends StatefulWidget {
  const Signin_OTP({super.key});

  @override
  State<Signin_OTP> createState() => _Signin_OTPState();
}

class _Signin_OTPState extends State<Signin_OTP> {
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
  String dest = "";
  var _controller = TextEditingController();
  late FocusNode focusnode1;
  // _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length))
  bool onError = false;
  bool start = false;

  Future<void> SendOTP()
  async {
        print("OTP");
        emailOTP.setConfig(
            appEmail: "tjdvlf0201@gmail.com",
            appName: "Email OTP TEST",
            userEmail: "tjdvlf0201@gmail.com",
            otpLength: 6,
            otpType: OTPType.digitsOnly
        );
        if (await emailOTP.sendOTP() == true) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
    content: Text("OTP has been sent"),
    ));
    } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
    content: Text("Oops, OTP send failed"),
    ));
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SendOTP();
    focusnode1 = FocusNode();
    // FocusScope.of(context).unfocus();
    focusnode1.addListener(() {
      if (focusnode1.hasFocus == false) {
        setState(() {
          start = true;
        });
      };
      callhim();
      // print("${focusnode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: EdgeInsets.only(
              left: GetRealWidth(pixel: 30, context: context),
              right: GetRealWidth(pixel: 30, context: context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: GetRealHeight(pixel: 65, context: context),
              ),
              GoBackButton(),
              SizedBox(
                height: GetRealHeight(pixel: 34, context: context),
              ),
              Text(
                  "마지막 단계에요!",
                  style: SimpleTextStyle(size: 28, weight: FontWeight.w600)
              ),
              SizedBox(
                height: GetRealHeight(pixel: 150, context: context),
              ),
              Text(
                "비지니스 이메일로 전송된 인증코드를 입력해주세요.",
                style: SimpleTextStyle(size: 16, weight: FontWeight.w500),
              ),
              SizedBox(
                height: GetRealHeight(pixel: 9, context: context),
              ),
              Container(
                  height: GetRealHeight(pixel: 80, context: context),
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
                            dest = val;
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
                            return;
                          },
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w300),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 0.15),
                            contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            errorStyle: TextStyle(
                                color: Color.fromRGBO(242, 199, 199, 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1)),
                            hintText: "입력창",
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
                      start ? !onError
                          ? Row(
                        children: [
                          Text(
                            "유효한 인증코드입니다.",
                            style: TextStyle(
                              color: Color.fromRGBO(51, 255, 0, 1),
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ) :
                      Row(
                        children: [
                          Text(
                            "유효하지 않은 인증코드입니다.",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 0, 0, 1),
                              fontSize: 12,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ) : Container(),
                    ],
                  )),
              RealSizedBox(width: 0, height: 170,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Signin_Complete()));
                },
                child: Container(
                  width: GetRealWidth(pixel: 330, context: context),
                  height: GetRealHeight(pixel: 45, context: context),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(55, 29, 156, 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "인증완료",
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
            ],
          ),
        ),
      ),
    );
  }
}
//완료 페이지
class Signin_Complete extends StatefulWidget {
  const Signin_Complete({super.key});

  @override
  State<Signin_Complete> createState() => _Signin_CompleteState();
}

class _Signin_CompleteState extends State<Signin_Complete> {
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
  String dest = "";
  var _controller = TextEditingController();
  late FocusNode focusnode1;
  // _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length))
  bool onError = false;
  bool start = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      emailOTP.setConfig(
          appEmail: "tjdvlf0201@gmail.com",
          appName: "Email OTP",
          userEmail: "tjdvlf0201@gmail.com",
          otpLength: 6,
          otpType: OTPType.digitsOnly
      );
      if (await emailOTP.sendOTP ()
    == true) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
    content: Text("OTP has been sent"),
    ));
    } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
    content: Text("Oops, OTP send failed"),
    ));
    }
    };
    focusnode1 = FocusNode();
    // FocusScope.of(context).unfocus();
    focusnode1.addListener(() {
      if (focusnode1.hasFocus == false) {
        setState(() {
          start = true;
        });};
      callhim();
      // print("${focusnode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: EdgeInsets.only(
              left: GetRealWidth(pixel: 30, context: context),
              right: GetRealWidth(pixel: 30, context: context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: GetRealHeight(pixel: 65, context: context),
              ),
              GoBackButton(),
              SizedBox(
                height: GetRealHeight(pixel: 34, context: context),
              ),
              Text(
                  "팬과 이어지는 공간\nBRIDGE에\n오신 걸 환영해요!",
                  style: SimpleTextStyle(size: 28, weight: FontWeight.w600)
              ),
              SizedBox(
                height: GetRealHeight(pixel: 87, context: context),
              ),
              SizedBox(
                height: GetRealHeight(pixel: 124, context: context),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const InputSecondPage()));
                },
                child: Container(
                  width: GetRealWidth(pixel: 330, context: context),
                  height: GetRealHeight(pixel: 45, context: context),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(55, 29, 156, 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "인증완료",
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
            ],
          ),
        ),
      ),
    );
  }
}


