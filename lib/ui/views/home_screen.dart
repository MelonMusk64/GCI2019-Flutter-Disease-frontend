import 'package:connectivity/connectivity.dart';
import 'package:disease_app/ui/resources/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var status = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Check connectivity'),
            onPressed: _checkInternet,
          ),
        ),
      ),
    );
  }

  _checkInternet() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showStatus("You're not connected to a network");
    } else if (result == ConnectivityResult.mobile) {
      _showStatus("You're connected over mobile data");
    } else if (result == ConnectivityResult.wifi) {
      _showStatus("You're connected over wifi");
    }

    return Text(status);
  }

  _showStatus(status) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Connection"),
          content: Text(status),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
