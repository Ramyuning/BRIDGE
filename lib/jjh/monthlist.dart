import 'package:intl/intl.dart';

List<String> return_year(Currentyear){ 
  final List<String> year = List.generate(
            100
            ,
        (index) => "${Currentyear -(index)}"
          );
  return year;
}

final List<String> month = List.generate(
  12, (index) => index < 9 ? "0${index + 1}" : "${index + 1}");

final List<String> day = List.generate(
  31, (index) => index < 9 ? "0${index + 1}" : "${index + 1}");

// List<String> _year = [];
// _year = List.generate(
//         widget.interval == null || widget.interval == 0
//             ? 100
//             : widget.interval!,
//         (index) => widget.interval == null || widget.interval! < 1
//             ? "${index + (_currentYear - 50)}"
//             : "${index + (_currentYear - (widget.interval == 1 ? 0 : widget.interval! ~/ 2))}");