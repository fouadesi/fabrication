import 'package:cloud_firestore/cloud_firestore.dart';import 'package:email_validator/email_validator.dart';import 'package:fabrication2/Authentication/Component.dart';import 'package:fabrication2/main.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'package:google_fonts/google_fonts.dart';import 'login.widget.dart';class SignUp extends StatefulWidget {  @override  _SignUpState createState() => _SignUpState();}class _SignUpState extends State<SignUp> {  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();  TextEditingController name_controller = TextEditingController();  TextEditingController phone_controller = TextEditingController();  TextEditingController email_controller = TextEditingController();  TextEditingController password_controller = TextEditingController();  TextEditingController password_controller2 = TextEditingController();  @override  Widget build(BuildContext context) { return Scaffold(        key: _scaffoldKey,        body: AnnotatedRegion<SystemUiOverlayStyle>(          value: SystemUiOverlayStyle.light,          child: GestureDetector(            child: Stack(              children: [                Container(                  height: double.infinity,                  width: double.infinity,                  decoration: BoxDecoration(                    gradient: LinearGradient(                        begin: Alignment.topCenter,                        end: Alignment.bottomCenter,                        colors: [                          Color.fromRGBO(253, 183, 119, 1),                          Color.fromRGBO(253, 167, 102, 1),                          Color.fromRGBO(253, 147, 70, 1),                          Color.fromRGBO(253, 127, 44, 1)                        ]),                  ),                  child: Padding(                    padding: EdgeInsets.symmetric(horizontal: 20),                    child: SingleChildScrollView(child: Column(                      mainAxisAlignment: MainAxisAlignment.center,                      children: [                        SizedBox(                          height: 60,                        ),                        Center(                            child: Text(                              "انشاء حساب",                              style: GoogleFonts.tajawal(                                color: Colors.white,                                fontSize: 40,                                fontWeight: FontWeight.w400,                              ),                            )),                        SizedBox(                          height:05,                        ),                        Column(                          crossAxisAlignment: CrossAxisAlignment.end,                          children: [                            SizedBox(                              height: 10,                            ),                            Container(                                alignment: Alignment.centerRight,                                child: Text("الإسم الكامل : ",                                    textDirection: TextDirection.rtl,                                    style: GoogleFonts.tajawal(                                        color: Colors.white,                                        fontSize: 16,                                        fontWeight: FontWeight.bold))),                            SizedBox(                              height: 10,                            ),                            Container(                              alignment: Alignment.centerLeft,                              decoration: BoxDecoration(                                  color: Colors.white,                                  borderRadius: BorderRadius.circular(10),                                  boxShadow: [                                    BoxShadow(                                      color: Colors.black26,                                      blurRadius: 6,                                      offset: Offset(0, 3),                                    )                                  ]),                              height: 60,                              child: Theme(                                  data: new ThemeData(                                    primaryColor: Colors.white,                                    primaryColorDark: Colors.white,                                  ),                                  child: TextField(                                    controller: name_controller,                                    keyboardType: TextInputType.name,                                    style: TextStyle(                                      color: Colors.black87,                                    ),                                    decoration: InputDecoration(                                        border: InputBorder.none,                                        contentPadding: EdgeInsets.only(top: 14),                                        prefixIcon: Icon(Icons.person,                                            color: Color.fromRGBO(253, 127, 44, 1)),                                        hintText: "الإسم الكامل",                                        hintStyle: GoogleFonts.tajawal(                                            color: Colors.black87)),                                  )),                            ),                            SizedBox(                              height: 10,                            ),                            Container(                                alignment: Alignment.centerRight,                                child: Text("رقم الهاتف : ",                                    textDirection: TextDirection.rtl,                                    style: GoogleFonts.tajawal(                                        color: Colors.white,                                        fontSize: 16,                                        fontWeight: FontWeight.bold))),                            SizedBox(                              height: 10,                            ),                            Container(                              alignment: Alignment.centerLeft,                              decoration: BoxDecoration(                                  color: Colors.white,                                  borderRadius: BorderRadius.circular(10),                                  boxShadow: [                                    BoxShadow(                                      color: Colors.black26,                                      blurRadius: 6,                                      offset: Offset(0, 3),                                    )                                  ]),                              height: 60,                              child: Theme(                                  data: new ThemeData(                                    primaryColor: Colors.white,                                    primaryColorDark: Colors.white,                                  ),                                  child: TextField(                                    controller: phone_controller,                                    keyboardType: TextInputType.phone,                                    style: TextStyle(                                      color: Colors.black87,                                    ),                                    decoration: InputDecoration(                                        border: InputBorder.none,                                        contentPadding: EdgeInsets.only(top: 14),                                        prefixIcon: Icon(Icons.phone,                                            color: Color.fromRGBO(253, 127, 44, 1)),                                        hintText: "رقم الهاتف",                                        hintStyle: GoogleFonts.tajawal(                                            color: Colors.black87)),                                  )),                            ),                            SizedBox(                              height: 10,                            ),                            Container(                                alignment: Alignment.centerRight,                                child: Text("البريد الإلكتروني : ",                                    textDirection: TextDirection.rtl,                                    style: GoogleFonts.tajawal(                                        color: Colors.white,                                        fontSize: 16,                                        fontWeight: FontWeight.bold))),                            SizedBox(                              height: 10,                            ),                            Container(                              alignment: Alignment.centerLeft,                              decoration: BoxDecoration(                                  color: Colors.white,                                  borderRadius: BorderRadius.circular(10),                                  boxShadow: [                                    BoxShadow(                                      color: Colors.black26,                                      blurRadius: 6,                                      offset: Offset(0, 3),                                    )                                  ]),                              height: 60,                              child: Theme(                                  data: new ThemeData(                                    primaryColor: Colors.white,                                    primaryColorDark: Colors.white,                                  ),                                  child: TextField(                                    controller: email_controller,                                    keyboardType: TextInputType.emailAddress,                                    style: TextStyle(                                      color: Colors.black87,                                    ),                                    decoration: InputDecoration(                                        border: InputBorder.none,                                        contentPadding: EdgeInsets.only(top: 14),                                        prefixIcon: Icon(Icons.email,                                            color: Color.fromRGBO(253, 127, 44, 1)),                                        hintText: "البريد الإلكتروني",                                        hintStyle: GoogleFonts.tajawal(                                            color: Colors.black87)),                                  )),                            ),                            SizedBox(                              height: 10,                            ),                            Container(                                alignment: Alignment.centerRight,                                child: Text("كلمة السر :",                                    textDirection: TextDirection.rtl,                                    style: GoogleFonts.tajawal(                                        color: Colors.white,                                        fontSize: 16,                                        fontWeight: FontWeight.bold))),                            SizedBox(                              height: 10,                            ),                            Container(                              alignment: Alignment.centerLeft,                              decoration: BoxDecoration(                                  color: Colors.white,                                  borderRadius: BorderRadius.circular(10),                                  boxShadow: [                                    BoxShadow(                                      color: Colors.black26,                                      blurRadius: 6,                                      offset: Offset(0, 3),                                    )                                  ]),                              height: 60,                              child: Theme(                                  data: new ThemeData(                                    primaryColor: Colors.white,                                    primaryColorDark: Colors.white,                                  ),                                  child: TextField(                                    obscureText: true,                                    keyboardType: TextInputType.visiblePassword,                                    style: GoogleFonts.tajawal(                                      color: Colors.black87,                                    ),                                    controller: password_controller,                                    decoration: InputDecoration(                                      border: InputBorder.none,                                      contentPadding: EdgeInsets.only(top: 14),                                      prefixIcon: Icon(Icons.vpn_key,                                          color: Color.fromRGBO(253, 127, 44, 1)),                                      hintText: "كلمة السر",                                      hintStyle: TextStyle(color: Colors.black87),                                    ),                                  )),                            ),                            SizedBox(                              height: 10,                            ),                            Container(                                alignment: Alignment.centerRight,                                child: Text("تأكيد كلمة السر  :",                                    textDirection: TextDirection.rtl,                                    style: GoogleFonts.tajawal(                                        color: Colors.white,                                        fontSize: 16,                                        fontWeight: FontWeight.bold))),                            SizedBox(                              height: 10,                            ),                            Container(                              alignment: Alignment.centerLeft,                              decoration: BoxDecoration(                                  color: Colors.white,                                  borderRadius: BorderRadius.circular(10),                                  boxShadow: [                                    BoxShadow(                                      color: Colors.black26,                                      blurRadius: 6,                                      offset: Offset(0, 3),                                    )                                  ]),                              height: 60,                              child: Theme(                                  data: new ThemeData(                                    primaryColor: Colors.white,                                    primaryColorDark: Colors.white,                                  ),                                  child: TextField(                                    obscureText: true,                                    keyboardType: TextInputType.visiblePassword,                                    style: GoogleFonts.tajawal(                                      color: Colors.black87,                                    ),                                    controller: password_controller2,                                    decoration: InputDecoration(                                      border: InputBorder.none,                                      contentPadding: EdgeInsets.only(top: 14),                                      prefixIcon: Icon(Icons.vpn_key,                                          color: Color.fromRGBO(253, 127, 44, 1)),                                      hintText: "تأكيد كلمة السر ",                                      hintStyle: TextStyle(color: Colors.black87),                                    ),                                  ),                              ),                            ),                            Container(                              padding: EdgeInsets.symmetric(vertical: 25),                              width: double.infinity,                              child: RaisedButton(                                onPressed: () {                                  if (name_controller.text.length  == 0) {                                    afficher("يرجى إدخال إسم صحيح");                                    return ;                                  }                                  if (phone_controller.text.length  != 10) {                                    afficher("يرجى ادخال رقم هاتف صحيح");                                    return ;                                  }                                  if (EmailValidator.validate(                                      email_controller.text)) {                                    print(password_controller.text);                                    if (password_controller.text.length >= 8) {                                      if(password_controller.text == password_controller2.text) {                                        showDialog(                                            barrierDismissible: false,                                            context: context,                                            builder: (context) => AlertDialog(                                                title: Column(                                                  children: [                                                    Container(                                                        height: 20,                                                        width: 20,                                                        child:                                                        CircularProgressIndicator()),                                                  ],                                                )));                                        CreateUserWithEmailAndPassword(                                            email_controller.text,                                            password_controller.text,                                            name_controller.text,                                            phone_controller.text                                        );                                      }else {                                        afficher("يرجى إدخال نفس كلمة السر");                                      }                                      setState(() {                                      });                                    } else {                                      afficher("يرجى إدخال كلمة سر صحيحة");                                    }                                  } else {                                    afficher("يرجى إدخل بريد إلكتروني صحيح");                                  }                                },                                elevation: 5,                                padding: EdgeInsets.all(15),                                shape: RoundedRectangleBorder(                                  borderRadius: BorderRadius.circular(15),                                ),                                color: Colors.white,                                child: Text(                                  "تسجيل حساب جديد ",                                  style: GoogleFonts.tajawal(                                      color: Color.fromRGBO(253, 127, 44, 1),                                      fontWeight: FontWeight.bold),                                ),                              ),                            ),                            SizedBox(                              height: 10,                            ),                            Center(                                child: GestureDetector(                                    onTap: () => Navigator.push(context,                                        MaterialPageRoute(builder: (context)=> Login())),                                    child: RichText(                                      text: TextSpan(children: [                                        TextSpan(                                            text: " لدي حساب ؟",                                            style: GoogleFonts.tajawal(                                                color: Colors.white,                                                fontSize: 10,                                                fontWeight: FontWeight.bold)),                                        TextSpan(                                            text: "تسجيل الدخول",                                            style: GoogleFonts.tajawal(                                                color: Colors.white,                                                fontWeight: FontWeight.bold,                                                fontSize: 12))                                      ]),                                    )))                          ],                        ),                      ],                    )),                  ),                )              ],            ),          ),        )    );  }  void afficher(String text) {    _scaffoldKey.currentState.showSnackBar(SnackBar(        content: Text(          text,style: GoogleFonts.tajawal          (),textDirection:        TextDirection.rtl,))) ;  }  void CreateUserWithEmailAndPassword(String email, String password,String name,String phone) {    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,        password: password).then((result) {          Navigator.pop(context);      FirebaseFirestore.instance.collection("users").doc(result.user.uid).      set({        "id" : result.user.uid,        "email": email ,        "name" : name ,        "phone" : phone ,      }).then((value) {        afficher("تم إنشاء حساب جديد ");        Navigator.of(context).pushAndRemoveUntil(            MaterialPageRoute(builder: (context)=> MyApp()),(            Route<dynamic> route) => false);      }).catchError((error) {        print("we are here");        afficher("يرجى التحق من الانترنت و المعلومات المدخلة");      }).timeout(        Duration(seconds: 10),        onTimeout: () {          afficher("يرجى التحق من الانترنت و المعلومات المدخلة");        }      );    }).catchError((onError) {      Navigator.pop(context);      print("we are here");      afficher("يرجى التحق من الانترنت و المعلومات المدخلة");    }).timeout(Duration(seconds: 10), onTimeout: (){      Navigator.pop(context);      print("we are here");      afficher("يرجى التحق من الانترنت و المعلومات المدخلة");    });  }}