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
  var _displayReslut = "";
  var _currentItemSelected = "";
  
  void initState(){
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController termController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        children: <Widget>[
          
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: TextField(
                    controller: principalController,
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
                    controller: termController,
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
                    controller: rateController,
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
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Color.fromRGBO(123, 131, 137, 1),
                      ),
                      child: DropdownButton<String>(
                        iconDisabledColor: Colors.blue,
                        items: _currencies.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(
                              dropDownStringItem,
                              style: TextStyle(
                                color: Colors.white,
                                // backgroundColor: Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentItemSelected = newValueSelected;
                          });
                        },
                        value: _currentItemSelected,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(63, 71, 77, 1),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.green,
                        width: 3.0,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(10, 30, 5, 10),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 5, left: 25, top: 15),
                  child: RaisedButton(
                    color: Colors.black38,
                    onPressed: () {
                      setState(() {
                        _displayReslut = _calculateTotalReturn();
                      });
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
                  margin: EdgeInsets.only(right: 25, left: 5, top: 15),
                  child: RaisedButton(
                    color: Colors.black38,
                    onPressed: () {
                      setState(() {
                        _reset();
                      });
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

          Text(_displayReslut,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  String _calculateTotalReturn() {
    double principal = double.parse(principalController.text);
    double rate = double.parse(rateController.text);
    double term = double.parse(termController.text);

    double interest = (principal * rate * term/12 )/100;
    double totalAmountPayable = principal + interest;
    return "After $term months, your investment will be $_currentItemSelected $totalAmountPayable where the interest is $interest";
  }

  void _reset(){
   principalController.text ="";
   rateController.text = "";
   termController.text ="";
   _displayReslut = "";
   _currentItemSelected = _currencies[0];

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
