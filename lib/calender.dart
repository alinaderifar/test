import 'package:flutter/material.dart';
import 'package:jalali_table_calendar_plus/jalali_table_calendar_plus.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime today = DateTime.now();
  Map<DateTime, List<dynamic>> events = {
    DateTime.now(): ['sample event', 26],
    DateTime.now().add(Duration(days: 1)): [
      'all types can use here',
      {"key": "value"}
    ],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.help_outline)],
                  ),
                  Row(
                    children: [
                      Icon(Icons.checklist),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.sort),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   height: 40.0,
              //   child: ListView(
              //     physics: ClampingScrollPhysics(),
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       Stack(
              //         children: [
              //           Positioned(
              //             bottom: 0,
              //             child: Container(
              //               height: 4,
              //               width: 60,
              //               color: Color.fromRGBO(40, 75, 42, 1),
              //             ),
              //           ),
              //           Text(
              //             "فروردین",
              //             style: TextStyle(
              //               fontSize: 19,
              //               fontWeight: FontWeight.w900,
              //               color: Color.fromRGBO(40, 75, 42, 1),
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text(
              //         "اردیبهشت",
              //         style: TextStyle(
              //           fontSize: 19,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text(
              //         "خرداد",
              //         style: TextStyle(
              //           fontSize: 19,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text(
              //         "تیر",
              //         style: TextStyle(
              //           fontSize: 19,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text(
              //         "مرداد",
              //         style: TextStyle(
              //           fontSize: 19,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text(
              //         "شهریور",
              //         style: TextStyle(
              //           fontSize: 19,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text(
              //         "مهر",
              //         style: TextStyle(
              //           fontSize: 19,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text(
              //         "آبان",
              //         style: TextStyle(
              //           fontSize: 19,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text(
              //         "آذر",
              //         style: TextStyle(
              //           fontSize: 19,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text(
              //         "دی",
              //         style: TextStyle(
              //           fontSize: 19,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text(
              //         "بهمن",
              //         style: TextStyle(
              //           fontSize: 19,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       Text(
              //         "اسفند",
              //         style: TextStyle(
              //           fontSize: 19,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     Text(
              //       "شنبه",
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           color: Color.fromARGB(255, 124, 124, 124)),
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       "یکشنبه",
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           color: Color.fromARGB(255, 124, 124, 124)),
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       "دوشنبه",
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           color: Color.fromARGB(255, 124, 124, 124)),
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       "سه شنبه",
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           color: Color.fromARGB(255, 124, 124, 124)),
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       "چهارشنبه",
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           color: Color.fromARGB(255, 124, 124, 124)),
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       "پنج شنبه",
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           color: Color.fromARGB(255, 124, 124, 124)),
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       "جمعه",
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           color: Color.fromARGB(255, 124, 124, 124)),
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //   ],
              // ),
              JalaliTableCalendar(
                events: events,
                range: false,
                option: JalaliTableCalendarOption(
                  daysOfWeekTitles: [
                    "شنبه",
                    "یکشنبه",
                    "دوشنبه",
                    "سه شنبه",
                    "چهارشنبه",
                    "پنجشنبه",
                    "جمعه"
                  ],
                ),
                customHolyDays: [
                  // use jalali month and day for this
                  HolyDay(month: 4, day: 10), // For Repeated Days
                  HolyDay(year: 1404, month: 1, day: 26), // For Only One Day
                ],
                onRangeSelected: (selectedDates) {
                  for (DateTime date in selectedDates) {
                    print(date);
                  }
                },
                marker: (date, event) {
                  if (event.isNotEmpty) {
                    return Positioned(
                        top: -2,
                        left: 1,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: Text(event.length.toString())));
                  }
                  return null;
                },
                onDaySelected: (DateTime date) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
