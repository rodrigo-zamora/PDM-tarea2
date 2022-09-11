// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final billAmountController = TextEditingController();

  double tipPercentage = 0.2;
  double tipAmount = 0;
  double billAmount = 0;
  bool roundUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service, color: Colors.green),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Bill amount',
                ),
                controller: billAmountController,
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining, color: Colors.green),
            title: Text("How was the service?"),
          ),
          Column(
            children: [
              ListTile(
                leading: Radio(
                  value: 0.2,
                  groupValue: tipPercentage,
                  onChanged: (value) {
                    setState(() {
                      tipPercentage = value as double;
                    });
                  },
                ),
                title: Text('Amazing (20%)'),
              ),
              ListTile(
                leading: Radio(
                  value: 0.18,
                  groupValue: tipPercentage,
                  onChanged: (value) {
                    setState(() {
                      tipPercentage = value as double;
                    });
                  },
                ),
                title: Text('Good (18%)'),
              ),
              ListTile(
                leading: Radio(
                  value: 0.15,
                  groupValue: tipPercentage,
                  onChanged: (value) {
                    setState(() {
                      tipPercentage = value as double;
                    });
                  },
                ),
                title: Text('Okay (15%)'),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.green),
            title: Text('Round up tip?'),
            trailing: Switch(
              value: roundUp,
              onChanged: (value) {
                setState(() {
                  roundUp = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: MaterialButton(
              child: Text("CALCULATE"),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  if (billAmountController.text.isNotEmpty) {
                    billAmount = double.parse(billAmountController.text);
                    _tipCalculation();
                  } else if (billAmountController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Please enter a bill amount'),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
            ),
          ),
          SizedBox(height: 16),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(right: 16),
            child: Text(
              'Tip amount: \$${tipAmount.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  void _tipCalculation() {
    tipAmount = billAmount * tipPercentage;
    if (roundUp) {
      tipAmount = tipAmount.ceilToDouble();
    }
  }
}
