import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sob7a/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int radValue = 1, count = 0, times = 0, gool = 0;
  Color mainColor = firColor;
  TextDirection textDirection = TextDirection.rtl;
  bool showColor = false;

  setCount(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("counter", value);
  }

  getCount() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      count = pref.getInt("counter") ?? 0;
    });
  }

  setTimes(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("Times", value);
  }

  getTimes() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      times = pref.getInt("Times") ?? 0;
    });
  }

  setRadValue(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("RadValue", value);
  }

  getRadValue() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      radValue = pref.getInt("RadValue") ?? 0;
    });
  }

  setGools(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("Gools", value);
  }

  getGools() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      gool = pref.getInt("Gools") ?? 0;
    });
  }

  resetToZero() {
    count = 0;
    times = 0;
    setCount(count);
    setTimes(times);
  }

  @override
  void initState() {
    getCount();
    getTimes();
    getRadValue();
    getGools();
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
      textDirection: textDirection,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  showColor = !showColor;
                });
              },
              icon: Icon(
                showColor ? Icons.color_lens : Icons.color_lens_outlined,
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "الهدف",
                        style: TextStyle(
                          color: white,
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (gool > 0) {
                                  gool--;
                                  setGools(gool);
                                  resetToZero();
                                }
                              });
                            },
                            icon: Icon(
                              Icons.remove_circle,
                              color: white,
                            ),
                          ),
                          Text(
                            "$gool",
                            style: TextStyle(
                              color: white,
                              fontSize: MediaQuery.of(context).size.width * 0.1,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                gool++;
                                setGools(gool);
                                resetToZero();
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
                            flex: 5,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 3,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  gool = 0;
                                  setGools(gool);
                                  resetToZero();
                                });
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: white,
                                ),
                                child: const Center(
                                  child: Text("0"),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 4,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  gool = 33;
                                  setGools(gool);
                                  resetToZero();
                                });
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: white,
                                ),
                                child: const Center(
                                  child: Text("33"),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 5,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  gool = 100;
                                  setGools(gool);
                                  resetToZero();
                                });
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: white,
                                ),
                                child: const Center(
                                  child: Text("100"),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 6,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  gool += 100;
                                  setGools(gool);
                                  resetToZero();
                                });
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: white,
                                ),
                                child: const Center(
                                  child: Text("+100"),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 7,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  gool += 1000;
                                  setGools(gool);
                                  resetToZero();
                                });
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: white,
                                ),
                                child: const Center(
                                  child: Text("+1000"),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 5,
                            child: SizedBox(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "تسبحة",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "$count",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 16,
                        child: CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.width * 0.2,
                          lineWidth: 6,
                          percent: (gool != 0) ? count / gool : 0,
                          center: InkWell(
                            splashColor: white.withOpacity(0),
                            highlightColor: white.withOpacity(0),
                            onTap: () {
                              setState(() {
                                if (count == gool) {
                                  times++;
                                  setTimes(times);
                                  count = 1;
                                  setCount(count);
                                } else {
                                  count++;
                                  setCount(count);
                                }
                              });
                            },
                            child: Icon(
                              Icons.touch_app,
                              color: mainColor,
                              size: MediaQuery.of(context).size.width * 0.2,
                            ),
                          ),
                          backgroundColor: mainColor.withOpacity(0.2),
                          progressColor: mainColor,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "مرات التكرار : $times",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "المجموع : ${times * gool + count}",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
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
            Expanded(
              child: Row(
                children: [
                  Visibility(
                    visible: showColor,
                    child: Row(
                      children: [
                        Radio(
                          activeColor: firColor,
                          fillColor: WidgetStateColor.resolveWith(
                              (state) => mainColor),
                          value: 1,
                          groupValue: radValue,
                          onChanged: (value) {
                            setState(() {
                              radValue = 1;
                              mainColor = firColor;
                              setRadValue(radValue);
                            });
                          },
                        ),
                        Radio(
                          activeColor: secColor,
                          fillColor:
                              WidgetStateColor.resolveWith((state) => secColor),
                          value: 2,
                          groupValue: radValue,
                          onChanged: (value) {
                            setState(() {
                              radValue = 2;
                              mainColor = secColor;
                              setRadValue(radValue);
                            });
                          },
                        ),
                        Radio(
                          activeColor: theColor,
                          fillColor:
                              WidgetStateColor.resolveWith((state) => theColor),
                          value: 3,
                          groupValue: radValue,
                          onChanged: (value) {
                            setState(() {
                              radValue = 3;
                              mainColor = theColor;
                              setRadValue(radValue);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              resetToZero();
            });
          },
          backgroundColor: mainColor,
          foregroundColor: white,
          child: const Icon(
            Icons.refresh,
          ),
        ),
      ),
    );
  }
}
