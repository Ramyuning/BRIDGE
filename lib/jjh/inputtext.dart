import 'package:bridge/jjh/inputtext.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  String dest = "";
  var _controller = TextEditingController();
  late FocusNode focusnode1;
  // _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length))
  bool onError = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusnode1 = FocusNode();
    focusnode1.addListener(() {
      print("${focusnode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
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
                  errorStyle:
                      TextStyle(color: Color.fromRGBO(242, 199, 199, 1)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 0.3), width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 0.3), width: 1)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 0.3), width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 0.3), width: 1)),
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
            focusnode1.hasFocus
                ? Container()
                : (_formKey.currentState!.validate()
                    ? Container()
                    : Container()), // ㅋㅋㅋ 이거뭐임ㅋㅋㅋ
            focusnode1.hasFocus
                ? Container()
                : onError
                    ? Row(
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
                      )
                    : Row(
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
                      ),
            // onError
            //     ? Row(
            //         children: [
            //           Text(
            //             "인증번호가 일치하지 않습니다",
            //             style: TextStyle(color: Color.fromRGBO(255, 0, 0, 1),
            //             fontSize: 12,
            //             fontFamily: "Pretendard",
            //             fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ],
            //       )
            //     : Container(),
            OutlinedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState!.validate()) {}
              },
              child: Text("누르면 바뀜"),
            ),
            OutlinedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              child: Text("포커스만 뺌"),
            ),
          ],
        ),
      ),
    ));
  }
}
