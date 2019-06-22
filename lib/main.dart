import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Calculate Simple Interest",
    home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: <Widget>[
            topBar(),
            SIForm(),
          ],
        ),
        color: Color.fromRGBO(49, 55, 60, 1),
      ),
    ),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ["Rupees", "Dollor", "Pound", "Other"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Total loan amount",
                      labelStyle: TextStyle(color: Colors.white54),
                      fillColor: Color.fromRGBO(63, 71, 77, 1),
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 3.0,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(10, 30, 5, 10),
                ),
              ),
              Expanded(
                child: Container(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Term (months)",
                      labelStyle: TextStyle(color: Colors.white54),
                      fillColor: Color.fromRGBO(63, 71, 77, 1),
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 3.0,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(5, 30, 10, 10),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Interest rate(%)",
                      labelStyle: TextStyle(color: Colors.white54),
                      fillColor: Color.fromRGBO(63, 71, 77, 1),
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 3.0,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(10, 30, 5, 10),
                ),
              ),
              Expanded(
                child: Container(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Estimated credit rating",
                      labelStyle: TextStyle(color: Colors.white54),
                      fillColor: Color.fromRGBO(63, 71, 77, 1),
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 3.0,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(5, 30, 10, 10),
                ),
              )
            ],
          ),


          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 5, left: 25),
                  child: RaisedButton(
                    onPressed: (){

                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 25, left: 5),
                  child: RaisedButton(
                    onPressed: (){
                      
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),



        ],
      ),
    );
  }
}

Widget topBar() {
  return Container(
    child: Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 70, 0, 30),
        child: Column(
          children: <Widget>[
            Text(
              "Auto Loan Calculator",
              style: TextStyle(
                color: Color.fromRGBO(0, 255, 163, 1),
                fontSize: 26,
              ),
            ),
            Text(
              "Get estimated rates and monthly payments",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
        color: Color.fromRGBO(63, 71, 77, 1),
      ),
    ),
    decoration: BoxDecoration(color: Color.fromRGBO(63, 71, 77, 1), boxShadow: [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(0.0, 1),
        blurRadius: 10.0,
      )
    ]),
  );
}
