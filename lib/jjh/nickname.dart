import 'package:bridge/jjh/kakaologin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InputNickName extends StatefulWidget {
  const InputNickName({super.key});

  @override
  State<InputNickName> createState() => _InputNickNameState();
}

class _InputNickNameState extends State<InputNickName> {
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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/images/leftvector.png")),
                    SizedBox(width: GetRealWidth(pixel: 3, context: context),),
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
                height: GetRealHeight(pixel: 34, context: context),
              ),
              Text(
                "프로필을 입력해주세요",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
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
                  height: GetRealHeight(pixel: 80, context: context), // 여기 수정
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
                height: GetRealHeight(pixel: 124, context: context),
              ),
              Container(
                width: GetRealWidth(pixel: 330, context: context),
                height: GetRealHeight(pixel: 45, context: context),
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
              SizedBox(
                height: GetRealHeight(pixel: 30, context: context),
              ),
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
              OutlinedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
                child: Text("포커스만 뺌"),
              ),
              OutlinedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {}
                },
                child: Text("누르면 바뀜"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
