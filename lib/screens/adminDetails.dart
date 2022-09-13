import 'package:basic_bank_app/model/customer.dart';
import 'package:basic_bank_app/widgets/customcard.dart';
import 'package:flutter/material.dart';

class AdminDetailsScreen extends StatefulWidget {
  static const routeNamed = '/AdminDetails';

  @override
  _AdminDetailsScreenState createState() => _AdminDetailsScreenState();
}

class _AdminDetailsScreenState extends State<AdminDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var query = ModalRoute.of(context).settings.arguments as Customer;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(query.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profilepic.jpg"),
            ),
            Text(
              query.name,
              style: TextStyle(
                fontSize: 25,
                color: Colors.lightBlue[700],
              ),
            ),
            const Divider(
              color: Colors.lightBlue,
              height: 20,
              thickness: 8,
              endIndent: 0,
            ),
            CustomCard(
              icon: Icons.account_balance_sharp,
              title: 'Account No: ${query.id}',
            ),
            CustomCard(
              icon: Icons.account_balance_wallet,
              title: 'Balance: Rs.${query.balance}',
            ),
          ],
        ),
      ),
    );
  }
}
