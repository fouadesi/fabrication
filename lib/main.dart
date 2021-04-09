import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabrication2/Home/Home.widget.dart';
import 'package:fabrication2/push.dart';
import 'package:fabrication2/size_config.dart';
import 'package:fabrication2/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Authentication/login.widget.dart';
import 'Home/models.dart';
import 'Model/Product.widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  PushNotificationsManager push;
  FirebaseMessaging fcm ;
  @override
  void initState() {


    push = PushNotificationsManager();
    fcm = FirebaseMessaging();
    fcm.getToken().then((token) {
      if (token == null) {
        return ;
      }
      FirebaseFirestore.instance.collection("token-users").
      doc(token).set({
        "token": token  ,
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser ;
    Widget  firstWidget;
    if (user != null) {
      firstWidget = HomeScreen();
    }else {
      firstWidget = Login();
    }
    return Builder(builder: (context) {
      if (user != null) {
        return MultiProvider(
          providers: [
            StreamProvider<List<prodcuct>>.value(
                value:
            DatabaseService().streamuserproducts(user.uid),
            initialData: [],),
            StreamProvider<List<Pending_Order>>.value(
              value: DatabaseService().streampendingOrder(user.uid),
              initialData: [],
            ),
          StreamProvider<User>.value(value:
          FirebaseAuth.instance.authStateChanges()),
            StreamProvider<List<Cat1>>.value(value:
            DatabaseService().stream_cats(),
            initialData: [],),
            StreamProvider<List<Cat2>>.value(value:
            DatabaseService().stream_cats2(),initialData: [],),
            StreamProvider<List<Cat3>>.value(value:
            DatabaseService().stream_cats3(),initialData: [],)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: firstWidget,
        ),);
      }else {

        return MultiProvider(
          providers: [
          StreamProvider<User>.value(value:
          FirebaseAuth.instance.authStateChanges())
        ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme(),
            home: firstWidget,
          ),);
      }
    });

  }
}

