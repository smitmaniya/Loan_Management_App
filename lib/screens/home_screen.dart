import 'package:basic_bank_app/model/customer.dart';
import 'package:basic_bank_app/screens/adminDetails.dart';
import 'package:basic_bank_app/screens/customers_list.dart';
import 'package:basic_bank_app/screens/insertCustomer.dart';
import 'package:basic_bank_app/widgets/customcard.dart';
import 'package:flutter/material.dart';
import '../dbHelper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Customer> query = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Bank'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () async {
                DBHelper db = DBHelper();
                query = await db.getCustomer();
                Navigator.of(context).pushNamed(AdminDetailsScreen.routeNamed,
                    arguments: query[0]);
              })
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 10,
                margin: EdgeInsets.all(3),
                color: Colors.lightBlue[100],
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                    child: Image(
                      image: AssetImage("assets/images/logo.png"),
                      height: 250,
                      width: 250,
                      fit: BoxFit.fill,
                    )),
              ),
              const Divider(
                color: Colors.lightBlue,
                height: 20,
                thickness: 8,
                endIndent: 0,
              ),
              Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Divider(
                color: Colors.lightBlue,
                height: 20,
                thickness: 8,
                endIndent: 0,
              ),
              SizedBox(height: 50),
              CustomCard(
                icon: Icons.account_circle,
                title: 'View All Customers',
                navpage: () async {
                  DBHelper db = DBHelper();
                  query = await db.getCustomer();
                  Navigator.of(context)
                      .pushNamed(CustomersList.routeNamed, arguments: query);
                },
              ),
              CustomCard(
                icon: Icons.account_balance,
                title: 'Insert Customer',
                navpage: () {
                  Navigator.of(context).pushNamed(
                    InsertCustomer.routeNamed,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
