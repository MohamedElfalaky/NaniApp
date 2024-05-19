import 'package:intl/intl.dart';

extension FormatStringToDate on String {
  String get timeFromString => DateFormat.jm().format(DateTime.parse(this));

  String get dayFormat =>
      DateFormat("dd", "en_US").format(DateTime.parse(this)); // 02
  String get monthFormat =>
      DateFormat("MMM", "en_US").format(DateTime.parse(this)); // Oct
  String get dayMonthFormat =>
      DateFormat("dd MMM", "en_US").format(DateTime.parse(this)); // 02 Oct
  String get timeTo12Format => DateFormat("h:mm a")
      .format(DateTime.parse(this)); // Time to 12 Hour Format

  String get namedDayMonthFormat => DateFormat("EEEE dd MMM", "en_US")
      .format(DateTime.parse(this)); // Monday 02 Oct

  String get dayMonthYearFormat => DateFormat("dd MMM yyyy", "en_US")
      .format(DateTime.parse(this)); // 02 Oct 2022

  String get ddMMyyyyFormat =>
      DateFormat("dd-MM-yyyy").format(DateTime.parse(this)); // 02-10-2022
  String get mmYYFormat =>
      DateFormat("MM/yy").format(DateTime.parse(this)); // 02-10-2022

  String get namedDayMonthYearFormat =>
      DateFormat("EEEE, dd MMMM yyyy", "en_US")
          .format(DateTime.parse(this)); // Monday, 02 October 2022
  DateTime get convertStringToTime {
    // 11:30 PM
    late int hour;
    late int minutes;
    hour = int.parse(this.split(':')[0]);
    minutes = int.parse(this.split(':')[1].split(' ')[0]);
    if (this.split(':')[1].contains('PM') && hour < 12)
      hour += 12;
    else if (this.split(':')[1].contains('AM') && hour == 12) hour += 12;
    DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minutes);
    return dateTime;
  }

  String get timeDifference {
    // 11:30 PM
    Duration difference = DateTime.now().difference(DateTime.parse(this));
    int hours = difference.inHours;
    int days = difference.inDays;

    int minutes = difference.inMinutes;
    int seconds = difference.inSeconds;
    if (days > 0 && days < 7)
      return '${days}d';
    else if (days > 0 && days >= 7)
      return '${(days / 7).ceil()}w';
    else if (hours > 0)
      return '${hours}h';
    else if (minutes > 0)
      return '${minutes}m';
    else if (seconds == 0)
      return '1s';
    else
      return '${seconds}s';
  }

  bool get isSameDate {
    return DateTime.now().year == DateTime.parse(this).year &&
        DateTime.now().month == DateTime.parse(this).month &&
        DateTime.now().day == DateTime.parse(this).day;
  }
}

extension DateTimeExt on DateTime {
  String get getQuarterStartDate {
    int quarter = ((this.month - 1) / 3).floor();
    int quarterStartMonth = quarter * 3 + 1;
    DateTime quarterStartDate = DateTime(this.year, quarterStartMonth, 1);
    return quarterStartDate.toString();
  }

  String get getQuarterEndDate {
    int quarter = ((this.month - 1) / 3).floor();
    int quarterEndMonth = quarter * 3 + 3;
    int daysInQuarter = DateTime(this.year, quarterEndMonth + 1, 0).day;
    DateTime quarterEndDate =
        DateTime(this.year, quarterEndMonth, daysInQuarter);
    return quarterEndDate.toString();
  }
}
