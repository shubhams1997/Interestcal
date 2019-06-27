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
  var _formkey = GlobalKey<FormState>();
  var _currencies = ["Rupees", "Dollor", "Pound", "Other"];
  var _displayReslut = "";
  var _currentItemSelected = "";

  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController termController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please insert Principal amount";
                      }
                      if (!isNumeric(value)) {
                        return "Must be a number";
                      }
                    },
                    controller: principalController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 13,
                      ),
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
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Time period (months)";
                      }
                      if (!isNumeric(value)) {
                        return "Must be a number";
                      }
                    },
                    controller: termController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 13,
                      ),
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
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Enter Rate of Interest";
                      }
                      if (!isNumeric(value)) {
                        return "Must be a number";
                      }
                    },
                    controller: rateController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 13,
                      ),
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
                        if (_formkey.currentState.validate()) {
                          this._displayReslut = _calculateTotalReturn();
                        }
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
          Container(
            margin: EdgeInsets.fromLTRB(30, 30, 25, 0),
            child: Text(
              _displayReslut,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
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
    double interest = (principal * rate * term / 12) / 100;
    double totalAmountPayable = principal + interest;
    return "After ${term.toStringAsFixed(0)} months,\nYour investment will be $_currentItemSelected ${totalAmountPayable.toStringAsFixed(2)} \nInterest is ${interest.toStringAsFixed(2)}";
  }

  void _reset() {
    principalController.text = "";
    rateController.text = "";
    termController.text = "";
    _displayReslut = "";
    _currentItemSelected = _currencies[0];
  }

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return double.parse(value, (e) => null) != null;
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
