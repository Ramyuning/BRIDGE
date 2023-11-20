import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonthSelector extends StatelessWidget {
  
  MonthSelector({super.key, required this.onDateTimeChanged, required this.monthlist, required this.height});

  final void Function(int) onDateTimeChanged;
  final FixedExtentScrollController controller =
    FixedExtentScrollController(initialItem: 1);
  final List<String> monthlist;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
    diameterRatio: 1.7,
    selectionOverlay: 
    Container(decoration: BoxDecoration(border:Border.symmetric(horizontal: BorderSide(color: Color.fromRGBO(190, 190, 190, 1)))),),
      looping: true,
      itemExtent: 39,
    onSelectedItemChanged: onDateTimeChanged,
    children: [...monthlist.map((e) => Padding(
      padding: EdgeInsets.only(top: height),
      child: Text(
                                e,
                                style: TextStyle(color: Colors.white,fontSize: 14),
                              ),
    ))],);
  }
}

class DaySelector extends StatelessWidget {
  
  DaySelector({super.key, required this.onDateTimeChanged, required this.daylist, required this.height});

  final void Function(int) onDateTimeChanged;
  final FixedExtentScrollController controller =
    FixedExtentScrollController(initialItem: 1);
  final List<String> daylist;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
    diameterRatio: 1.7,
    selectionOverlay: 
    Container(decoration: BoxDecoration(border:Border.symmetric(horizontal: BorderSide(color: Color.fromRGBO(190, 190, 190, 1)))),),
      looping: true,
      itemExtent: 39,
    onSelectedItemChanged: onDateTimeChanged,
    children: [...daylist.map((e) => Padding(
      padding: EdgeInsets.only(top: height),
      child: Text(
                                e,
                                style: TextStyle(color: Colors.white,fontSize: 14),
                              ),
    ))],);
  }
}

class YearSelector extends StatelessWidget {
  
  YearSelector({super.key, required this.onDateTimeChanged, required this.yearlist, required this.height});

  final void Function(int) onDateTimeChanged;
  final FixedExtentScrollController controller =
    FixedExtentScrollController(initialItem: 0);
  final List<String> yearlist;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
    scrollController: controller,
    diameterRatio: 1.7,
    selectionOverlay: 
    Container(decoration: BoxDecoration(border:Border.symmetric(horizontal: BorderSide(color: Color.fromRGBO(190, 190, 190, 1)))),),
      looping: true,
      itemExtent: 39,
    onSelectedItemChanged: onDateTimeChanged,
    children: [...yearlist.map((e) => Padding(
      padding: EdgeInsets.only(top: height),
      child: Text(
                                e,
                                style: TextStyle(color: Colors.white,fontSize: 14),
                              ),
    ))],);
  }
}

