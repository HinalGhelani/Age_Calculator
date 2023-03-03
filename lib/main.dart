import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyPage(),
  );
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  TextStyle bodyText = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Color(0xff000000),
  );

  DateTime currentDate = DateTime.now();

  String Date = "00", Month = "00", Year = "0000";

  final dateController = TextEditingController(),
      monthController = TextEditingController(),
      yearController = TextEditingController();

  int presentYear = 00;
  int presentMonth = 00;
  int presentDay = 00;
  int nextMonth = 00;
  int nextDay = 00;

  //int month= 00;

  String s = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Age Calculator",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xffFFFFFF),
            ),
          ),
          backgroundColor: const Color(0xff203A43),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Today's Date",
                        style: bodyText,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.only(left: 20),
                      height: 50,
                      width: 499,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "${currentDate.day}-${currentDate.month}-${currentDate.year}",
                        style: const TextStyle(
                            color: Color(0xff1c003e),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ), //today date
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Date Of Birth",
                        style: bodyText,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 50,
                            child: Align(
                              child: TextField(
                                keyboardType: TextInputType.datetime,
                                controller: dateController,
                                decoration: InputDecoration(
                                  hintText: "DD",
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  hintStyle: const TextStyle(
                                      color: Color(0xffe5e5e5),
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey.shade400),
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 50,
                            child: Align(
                              child: TextField(
                                keyboardType: TextInputType.datetime,
                                controller: monthController,
                                decoration: InputDecoration(
                                  hintText: "MM",
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  hintStyle: const TextStyle(
                                      color: Color(0xffe5e5e5),
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey.shade400),
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 50,
                            child: Align(
                              child: TextField(
                                keyboardType: TextInputType.datetime,
                                controller: yearController,
                                decoration: InputDecoration(
                                  hintText: "YYYY",
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  hintStyle: const TextStyle(
                                    color: Color(0xffe5e5e5),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey.shade400),
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ), //date of month
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              setState(() {
                                dateController.clear();
                                monthController.clear();
                                yearController.clear();
                                Date = "";
                                Month = "";
                                Year = "";
                              });
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff13547a)),
                                  borderRadius: BorderRadius.circular(5)),
                              alignment: Alignment.center,
                              child: const Text(
                                "Clear",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(9),
                            onTap: () {
                              setState(() {
                                if (currentDate.month <= int.parse(Month)) {
                                  presentYear =
                                      currentDate.year - int.parse(Year) - 1;
                                  if (currentDate.day < int.parse(Date)) {
                                    presentMonth = ((12 - int.parse(Month)) +
                                            currentDate.month) -
                                        1;
                                    presentDay = (31 - int.parse(Date)) +
                                        currentDate.day;
                                  } else {
                                    presentMonth = (12 - int.parse(Month)) +
                                        currentDate.month;
                                    presentDay =
                                        currentDate.day - int.parse(Date);
                                  }
                                  if (int.parse(Month) == currentDate.month) {
                                    if (currentDate.day < int.parse(Date)) {
                                      presentYear =
                                          (currentDate.year - int.parse(Year)) -
                                              1;
                                      presentMonth = ((12 - int.parse(Month)) +
                                              currentDate.month) -
                                          1;
                                      presentDay = (31 - int.parse(Date)) +
                                          currentDate.day;
                                    } else {
                                      presentYear =
                                          currentDate.year - int.parse(Year);
                                      presentMonth =
                                          currentDate.month - int.parse(Month);
                                      presentDay =
                                          currentDate.day - int.parse(Date);
                                    }
                                  }
                                } else {
                                  presentYear =
                                      currentDate.year - int.parse(Year);
                                  if (currentDate.day < int.parse(Date)) {
                                    presentMonth = currentDate.month -
                                        int.parse(Month) -
                                        1;
                                    presentDay = (31 - int.parse(Date)) +
                                        currentDate.day;
                                  } else {
                                    presentMonth =
                                        currentDate.month - int.parse(Month);
                                    presentDay =
                                        currentDate.day - int.parse(Date);
                                  }
                                }
                                nextMonth = (12 - presentMonth) - 1;
                                nextDay = (31 - presentDay);
                              });
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xff13547a),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "Calculate",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Present Age",
                        style: bodyText,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 150,
                      width: 500,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff13547a),
                                Color(0xff203a43),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$presentYear",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Year",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffffffff),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ), //year
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$presentMonth",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Months",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffffffff),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ), //month
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$presentDay",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Days",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffffffff),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ), //year
                        ],
                      ),
                    ),
                  ],
                ),
              ), //present age
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Next Birthday",
                        style: bodyText,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 150,
                      width: 500,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff6bbed9),
                                Color(0xff006acb),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$nextMonth",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Month",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$nextDay",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Days",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
