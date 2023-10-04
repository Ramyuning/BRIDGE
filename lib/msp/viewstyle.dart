import 'package:bridge/msp/functions.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


//Colors////////////////////////
///F5F5F5
const colorBackground = Color(0xffF5F5F5);
///484848
const colorDarkGray =  Color(0xff484848);
///F8F8F8
const colorLightGray =  Color(0xfff8f8f8);
///000000
const colorBlack =  Color(0xff000000);
///2192FB
const colorBlue =  Color(0xff2192FB);
///FFFFFF
const colorWhite =  Color(0xffFFFFFF);

const colorGrayhalfVis = Color(0xff9B9999);

const colorDarkBlue = Color(0xff0152B1);

//TextStyle///////////////////////////


const textstyleLoginButton = TextStyle(
  color: colorDarkGray,
  fontSize: 22,
  fontFamily: 'Pretendard',
);

const textstyleLoginButtonInvert = TextStyle(
  color: colorWhite,
  fontSize: 22,
  fontFamily: 'Pretendard',
);

const textstyleSignupTitle = TextStyle(
  color: colorBlack,
  fontSize: 22,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600,
  letterSpacing: -0.4 ,
);

const textstyleSignupContent = TextStyle(
  color: colorBlack,
  fontSize: 17,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w500,
  letterSpacing: -0.4 ,
);

const textstyleGenderButton = TextStyle(
  color: colorBlack,
  fontSize: 14,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w400,
  letterSpacing: -0.4 ,
);

///22, Prentendard, w700
const textstylePageHeader = TextStyle(
  color: colorBlack,
  fontSize: 22,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w700,
  letterSpacing: -0.4 ,
);
///15, Prentendard, w400
const textstylePageSubHeader = TextStyle(
  color: colorBlack,
  fontSize: 15,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w400,
  letterSpacing: -0.4 ,
);
///20, Prentendard, w600
const textstyleBoxHeader = TextStyle(
  color: colorBlack,
  fontSize: 20,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600,
  letterSpacing: -0.4 ,
);
///11, Prentendard, w400
const textstyleBoxSub = TextStyle(
  color: colorBlack,
  fontSize: 11,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w400,
  letterSpacing: -0.4 ,
);
///14, Prentendard, w400
const textstyleBoxDescr = TextStyle(
  color: colorBlack,
  fontSize: 14,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w400,
  letterSpacing: -0.4 ,
);
///14, Prentendard, w400, grayhalfvis
const textstyleBoxDescrHalfVis = TextStyle(
  color: colorGrayhalfVis,
  fontSize: 14,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w400,
  letterSpacing: -0.4 ,
);
///19, Prentendard, w600, blue
const textstyle19DarkBlue = TextStyle(
  color: colorDarkBlue,
  fontSize: 19,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600,
  letterSpacing: -0.4 ,
);
///19, Prentendard, w600
const textstyle19W600 = TextStyle(
  fontSize: 19,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600,
  letterSpacing: -0.4 ,
);
///17, Prentendard, w600
const textstyle17W600 = TextStyle(
  fontSize: 17,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600,
  letterSpacing: -0.4 ,
);

///////////////Text///////////////////////////////////

var textLoginPhrase = const Text(
    "We just \nproviding \ntaxi pot",
    textAlign: TextAlign.left,
    style: TextStyle(
        shadows: <Shadow>[
          Shadow(
            offset: Offset(0, 4),
            color: Color.fromRGBO(0, 0, 0, 0.25)
          )
        ],
        color: Color(0xff787676),
        fontFamily: 'Balthazar',
        fontSize: 25,
        letterSpacing: 1.5920000076293945,
        fontWeight: FontWeight.normal,
        height: 0.88),
  );

var textLogoSide = Transform.rotate(
  angle: -16.8 * (math.pi / 180),
  child: const Text('Cinderella',
    // overflow: TextOverflow.clip,
    //  maxLines: 1,
    // softWrap: false,
    style: TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.7),
      fontFamily: 'Italianno',
      fontSize: 135,
      letterSpacing: -0.40799999237060547,
      fontWeight: FontWeight.normal,
      height: 0.16296296296296298
  ),),
);

var textLogoMain = Transform.rotate(
  angle: -16.8 * (math.pi / 180),
  child: const Text('Cinderella', textAlign: TextAlign.right, style: TextStyle(
      color: Color.fromRGBO(76, 133, 187, 1),
      fontFamily: 'Italianno',
      fontSize: 135,
      letterSpacing: -0.40799999237060547,
      fontWeight: FontWeight.normal,
      height: 0.16296296296296298
  ),),
);

var textLogoShadow = Transform.rotate(
  angle: -16.8 * (math.pi / 180),
  child: const Text('Cinderella', textAlign: TextAlign.right, style: TextStyle(
      color: Color.fromRGBO(179, 213, 245, 1),
      fontFamily: 'Italianno',
      fontSize: 135,
      letterSpacing: -0.40799999237060547,
      fontWeight: FontWeight.normal,
      height: 0.16296296296296298
  ),),
);

var textSignupTitle = Text(
  "회원가입",
  style: textstyleSignupTitle,
);

var textTaxiHistoryTitle = Text(
  "탑승기록",
  style: textstylePageHeader,
);

var textTaxiHistorySub = Text(
    "탑승 현황",
  style: textstylePageSubHeader,
);

var textTaxiListTitle = Text(
  "택시팟 목록",
  style: textstylePageHeader,
);

final textTaxiListAdd = Text(
  "추가",
  style: textstylePageSubHeader.copyWith(fontSize: 17),
);

/////////////////////ROW////////////////////////////

var rowLoginPageSub = Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left:19),
        child: textLoginPhrase,
      )
    ]
);
var rowLoginLogoSub =
      Padding(
        padding: const EdgeInsets.only(right:200.24),
        child: textLogoSide,
);

var rowBaseInfoButtons =
    Row(
      children: [
        buttonGenderMale,
        SizedBox(width : 13.64,),
        buttonGenderFemale,
      ],
    );

var rowSignupTitle = Row(
    children: [
      textSignupTitle,
    ]
);

var rowSingupConfirm = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    buttonSignupConfirm,
  ],
);

var rowTaxiHistoryTitle = Row(
  children: [
    textTaxiHistoryTitle,
  ],
);

var rowTaxiListTitle = Row(
  children: [
    textTaxiListTitle,
    SizedBox(width: 224,),
    textTaxiListAdd,
  ],
);

/////////////BUTTON/////////////////////
///UNUSED -- NAVIGATOR ISSUE!
var buttonLoginGoogle = Container(
  width: 249,
  height: 53,
  child: OutlinedButton.icon(
    onPressed: ()
    {
      print("object");
    },
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      side: BorderSide(color: colorDarkGray, width: 1.4)
    ),
    icon: Image.asset("assets/images/icon_google_black.png"),
    label: Text("구글로 로그인", style: textstyleLoginButton),
  ),
);
///UNUSED -- NAVIGATOR ISSUE!
var buttonLoginApple = Container(
  width: 249,
  height: 53,
  child: OutlinedButton.icon(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
      backgroundColor: colorDarkGray,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
    ),
    icon: Image.asset("assets/images/icon_apple.png"),
    label: Text("애플로 로그인", style: textstyleLoginButton),
  ),
);

var buttonGenderMale = Container(
  width: 68.18,
  height: 40,
  child: ElevatedButton(
    onPressed: (){},
    style: ElevatedButton.styleFrom(
      backgroundColor: colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    child: Text("남성", style: textstyleGenderButton),
  ),
);

var buttonGenderFemale = Container(
  width: 68.18,
  height: 40,
  child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    child: Text("여성", style: textstyleGenderButton),
  ),
);
///UNUSED -- NAVIGATOR ISSUE!
var buttonSignupConfirm = Container(
  width: 290,
  height: 53,
  child: OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
      backgroundColor: colorDarkGray,
      side: BorderSide(color: colorDarkGray, width: 1.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    child: Text("완료", style: textstyleLoginButtonInvert),
  ),
);

////////////////////////BOX/////////////////////////

var boxSingupTitle = Container(
  margin: const EdgeInsets.only(top: 89, left: 17),
  child: rowSignupTitle,
);

var boxSignup = Container(
  margin: const EdgeInsets.only(
    top: 34,
  ),

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children : [
      Padding(
          padding: const EdgeInsets.only(left: 37, top: 51),
        child: Text(
          "닉네임",
          style: textstyleSignupContent,
        ),
      ),
      TextField(
        style: textstyleSignupContent,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder()
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 37, top: 56),
        child: Text(
          "성별",
          style: textstyleSignupContent,
        ),
      ),
      const SizedBox(height: 27,),
      Container(
        margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: rowBaseInfoButtons,
      )

    ]
  )
);

var boxTaxiHistoryTitle = Container(
  margin: const EdgeInsets.only(top: 67, left: 20),
  child: rowTaxiHistoryTitle,
);

var boxTaxiListTitle = Container(
  margin: EdgeInsets.only(top: 67, left: 20),
  child: rowTaxiListTitle,
);
