import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sob7a/color/colors.dart';
import 'package:sob7a/data/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = firColor;

  setData() async {
    final SharedPreferences pre = await SharedPreferences.getInstance();
    setState(() {
      pre.setInt("counter", counter);
      pre.setInt("gools", gools);
      pre.setInt("times", times);
      pre.setInt("radValue", radValue);
    });
  }

  getData() async {
    final SharedPreferences pre = await SharedPreferences.getInstance();
    setState(() {
      counter = pre.getInt("counter") ?? 0;
      gools = pre.getInt("gools") ?? 0;
      times = pre.getInt("times") ?? 0;
      radValue = pre.getInt("radValue") ?? 0;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (radValue) {
      case 1:
        mainColor = firColor;
        break;
      case 2:
        mainColor = secColor;
        break;
      case 3:
        mainColor = theColor;
        break;
      default:
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: mainColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  showColor = !showColor;
                });
              },
              icon: Icon(
                showColor ? Icons.color_lens_outlined : Icons.color_lens,
                color: white,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: mainColor,
                child: Column(
                  children: [
                    Text(
                      "الهدف",
                      style: TextStyle(
                        color: white,
                        fontSize: MediaQuery.of(context).size.width * 0.13,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (gools > 0) gools--;
                              resetZero();
                            });
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            color: white,
                          ),
                        ),
                        Text(
                          "$gools",
                          style: TextStyle(
                            color: white,
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              gools++;
                              resetZero();
                            });
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 6,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                gools = 0;
                                resetZero();
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 4,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                gools = 33;
                                resetZero();
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "33",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 5,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                gools = 100;
                                resetZero();
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "100",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 6,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                gools += 100;
                                resetZero();
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "+100",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 7,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                gools += 1000;
                                resetZero();
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "+1000",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 6,
                          child: SizedBox(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 16,
              child: Container(
                color: white,
                child: Column(
                  children: [
                    Expanded(
                      flex: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                  "تسبحة",
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "$counter",
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (gools > 0) {
                                        if (counter == gools) {
                                          times++;
                                          counter = 1;
                                          setData();
                                        } else {
                                          counter++;
                                          setData();
                                        }
                                      }
                                    });
                                  },
                                  highlightColor: white.withOpacity(0),
                                  splashColor: white.withOpacity(0),
                                  child: CircularPercentIndicator(
                                    radius:
                                        MediaQuery.of(context).size.width * 0.2,
                                    progressColor: mainColor,
                                    percent: gools != 0 ? counter / gools : 0,
                                    backgroundColor: mainColor.withOpacity(0.2),
                                    lineWidth: 5,
                                    center: Icon(
                                      Icons.touch_app,
                                      color: mainColor,
                                      size: MediaQuery.of(context).size.width *
                                          0.25,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "مرات التكرار : $times",
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "المجموع : ${gools * times + counter}",
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                  ),
                                ),
                              ),
                              const Expanded(
                                flex: 4,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Visibility(
                        visible: showColor,
                        child: Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: radValue,
                              onChanged: (value) {
                                setState(() {
                                  radValue = value!;
                                  mainColor = firColor;
                                  setData();
                                });
                              },
                              activeColor: firColor,
                              fillColor: WidgetStateColor.resolveWith(
                                (states) => firColor,
                              ),
                            ),
                            Radio(
                              value: 2,
                              groupValue: radValue,
                              onChanged: (value) {
                                setState(() {
                                  radValue = value!;
                                  mainColor = secColor;
                                  setData();
                                });
                              },
                              activeColor: secColor,
                              fillColor: WidgetStateColor.resolveWith(
                                (states) => secColor,
                              ),
                            ),
                            Radio(
                              value: 3,
                              groupValue: radValue,
                              onChanged: (value) {
                                setState(() {
                                  radValue = value!;
                                  mainColor = theColor;
                                  setData();
                                });
                              },
                              activeColor: theColor,
                              fillColor: WidgetStateColor.resolveWith(
                                (states) => theColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              resetZero();
            });
          },
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000000),
          ),
          child: Icon(
            Icons.refresh,
            color: white,
          ),
        ),
      ),
    );
  }
}
