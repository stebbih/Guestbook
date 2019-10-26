
import 'package:flutter/material.dart';


class GESTABOK1Widget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Positioned(
              left: 0,
              top: -8,
              right: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 132,
                    margin: EdgeInsets.only(left: 20, right: 19),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 55, 144, 191),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 14, top: 8, right: 228),
                          child: Text(
                            "Vöfflukaffi!",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 14, top: 6, right: 2),
                          child: Text(
                            "Kíktum til afa og ömmu með ís og bökuðum vöfflur. \n\nTakk fyrir okkur! \nAnna Kristín og Hafsteinn",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 14,
                              fontFamily: "Helvetica",
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 114,
                    margin: EdgeInsets.only(left: 20, top: 6, right: 169),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 107,
                            height: 107,
                            child: Image.asset(
                              "assets/images/group.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 41, top: 100),
                              child: Text(
                                "Í GÆR",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 166, 166, 166),
                                  fontSize: 12,
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 301,
                      height: 71,
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Herdís",
                              style: TextStyle(
                                color: Color.fromARGB(255, 166, 166, 166),
                                fontSize: 12,
                                fontFamily: "Helvetica",
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            height: 56,
                            margin: EdgeInsets.only(top: 1),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 50,
                                  child: Container(
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 215, 242, 255),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Container(),
                                  ),
                                ),
                                Positioned(
                                  left: 14,
                                  top: 9,
                                  right: 0,
                                  child: Text(
                                    "Það væri gott að fá hálsmola ef einhver á leið til okkar.",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 68, 67, 67),
                                      fontSize: 14,
                                      fontFamily: "Helvetica",
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 78,
                    margin: EdgeInsets.only(left: 20, top: 37, right: 19),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 55, 144, 191),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 14, top: 8, right: 282),
                          child: Text(
                            "Kaffi",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 14, top: 6, right: 79),
                          child: Text(
                            "Fór í búð og stoppaði í kaffi hjá gömlu. \n-Anna Kristín",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 14,
                              fontFamily: "Helvetica",
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 3),
                      child: Text(
                        "Í DAG",
                        style: TextStyle(
                          color: Color.fromARGB(255, 166, 166, 166),
                          fontSize: 12,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 97,
                      height: 71,
                      margin: EdgeInsets.only(left: 20, top: 3),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 97,
                              height: 71,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Herdís",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 166, 166, 166),
                                        fontSize: 12,
                                        fontFamily: "Helvetica",
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    height: 56,
                                    margin: EdgeInsets.only(top: 1),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 215, 242, 255),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 25,
                            child: Container(
                              width: 79,
                              height: 39,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 39,
                                      height: 39,
                                      child: Image.asset(
                                        "assets/images/play-circle-solid.png",
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 16, top: 7),
                                      child: Text(
                                        "0:17",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 166, 166, 166),
                                          fontSize: 12,
                                          fontFamily: "Helvetica",
                                          fontWeight: FontWeight.w300,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
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
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 167,
                      height: 48,
                      margin: EdgeInsets.only(left: 20, bottom: 11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Stefán",
                              style: TextStyle(
                                color: Color.fromARGB(255, 166, 166, 166),
                                fontSize: 12,
                                fontFamily: "Helvetica",
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            height: 33,
                            margin: EdgeInsets.only(top: 1),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 33,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 215, 242, 255),
                                      borderRadius: BorderRadius.all(Radius.circular(16.5)),
                                    ),
                                    child: Container(),
                                  ),
                                ),
                                Positioned(
                                  left: 14,
                                  top: 9,
                                  right: 24,
                                  child: Text(
                                    "Já ég kem við á eftir.",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 68, 67, 67),
                                      fontSize: 14,
                                      fontFamily: "Helvetica",
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    margin: EdgeInsets.only(left: 14, right: 13, bottom: 9),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 273,
                            height: 25,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 0,
                                  child: Container(
                                    width: 273,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromARGB(255, 192, 192, 192),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(12.5)),
                                    ),
                                    child: Container(),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  top: 0,
                                  child: Text(
                                    "Skilaboð…",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 166, 166, 166),
                                      fontSize: 12,
                                      fontFamily: "Helvetica",
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 17,
                          height: 25,
                          margin: EdgeInsets.only(right: 14),
                          child: Image.asset(
                            "assets/images/microphone-solid.png",
                            fit: BoxFit.none,
                          ),
                        ),
                        Container(
                          width: 26,
                          height: 25,
                          child: Image.asset(
                            "assets/images/image-regular.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(
                        color: Color.fromARGB(255, 151, 151, 151),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 60,
                          margin: EdgeInsets.only(left: 11, top: 5, bottom: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 25,
                                  height: 28,
                                  margin: EdgeInsets.only(left: 17),
                                  child: Image.asset(
                                    "assets/images/book-solid-1-2.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "GESTABÓK",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 36, 94, 125),
                                    fontSize: 11,
                                    fontFamily: "Helvetica",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 40,
                          margin: EdgeInsets.only(left: 45, top: 5, bottom: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 36,
                                  height: 28,
                                  margin: EdgeInsets.only(left: 2),
                                  child: Image.asset(
                                    "assets/images/comments-solid.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "SPJALL",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 95, 95, 95),
                                    fontSize: 11,
                                    fontFamily: "Helvetica",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 64,
                          margin: EdgeInsets.only(top: 5, right: 43, bottom: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 27,
                                  height: 28,
                                  margin: EdgeInsets.only(right: 19),
                                  child: Image.asset(
                                    "assets/images/calendar-alt-regular.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Á DÖFNINNI",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 95, 95, 95),
                                    fontSize: 11,
                                    fontFamily: "Helvetica",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 43,
                          margin: EdgeInsets.only(top: 7, right: 24, bottom: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 33,
                                  height: 26,
                                  margin: EdgeInsets.only(right: 7),
                                  child: Image.asset(
                                    "assets/images/tasks-solid.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "VANTAR",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 95, 95, 95),
                                    fontSize: 11,
                                    fontFamily: "Helvetica",
                                  ),
                                  textAlign: TextAlign.center,
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
            Positioned(
              right: 19,
              child: Container(
                width: 247,
                height: 31,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 244, 244),
                  borderRadius: BorderRadius.all(Radius.circular(15.5)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 11, right: 10),
                      child: Text(
                        "Ég kem á eftir, skal koma með mola.",
                        style: TextStyle(
                          color: Color.fromARGB(255, 68, 67, 67),
                          fontSize: 14,
                          fontFamily: "Helvetica",
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}