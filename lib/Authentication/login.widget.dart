import 'package:email_validator/email_validator.dart';import 'package:fabrication2/Authentication/Component.dart';import 'package:fabrication2/Authentication/const/const.dart';import 'package:fabrication2/Authentication/signup.widget.dart';import 'package:fabrication2/main.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'package:google_fonts/google_fonts.dart';import 'forgot.widget.dart';class Login extends StatefulWidget {  @override  _LoginState createState() => _LoginState();}class _LoginState extends State<Login> {  final _formKey = GlobalKey<FormState>();  TextEditingController email_controller = TextEditingController();  TextEditingController password_controller = TextEditingController();  bool click = false;  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();  @override  Widget build(BuildContext context) {    return Scaffold(      key: _scaffoldKey,        body: AnnotatedRegion<SystemUiOverlayStyle>(      value: SystemUiOverlayStyle.light,      child: GestureDetector(        child: Stack(          children: [            Container(              height: double.infinity,              width: double.infinity,              decoration: BoxDecoration(                gradient: LinearGradient(                    begin: Alignment.topCenter,                    end: Alignment.bottomCenter,                    colors: [                      Color.fromRGBO(253, 183, 119, 1),                      Color.fromRGBO(253, 167, 102, 1),                      Color.fromRGBO(253, 147, 70, 1),                      Color.fromRGBO(253, 127, 44, 1)                    ]),              ),              child: Padding(                padding: EdgeInsets.symmetric(horizontal: 20),                child: Column(                  mainAxisAlignment: MainAxisAlignment.center,                  children: [                    Center(                        child: Text(                      "تسجيل الدخول",                      style: GoogleFonts.tajawal(                        color: Colors.white,                        fontSize: 40,                        fontWeight: FontWeight.w400,                      ),                    )),                    SizedBox(                      height: 50,                    ),                    Column(                      crossAxisAlignment: CrossAxisAlignment.end,                      children: [                        Container(                            alignment: Alignment.centerRight,                            child: Text("البريد الإلكتروني : ",                                textDirection: TextDirection.rtl,                                style: GoogleFonts.tajawal(                                    color: Colors.white,                                    fontSize: 16,                                    fontWeight: FontWeight.bold))),                        SizedBox(                          height: 10,                        ),                        Container(                          alignment: Alignment.centerLeft,                          decoration: BoxDecoration(                              color: Colors.white,                              borderRadius: BorderRadius.circular(10),                              boxShadow: [                                BoxShadow(                                  color: Colors.black26,                                  blurRadius: 6,                                  offset: Offset(0, 3),                                )                              ]),                          height: 60,                          child: Theme(                              data: new ThemeData(                                primaryColor: Colors.white,                                primaryColorDark: Colors.white,                              ),                              child: TextField(                                controller: email_controller,                                keyboardType: TextInputType.emailAddress,                                style: TextStyle(                                  color: Colors.black87,                                ),                                decoration: InputDecoration(                                    border: InputBorder.none,                                    contentPadding: EdgeInsets.only(top: 14),                                    prefixIcon: Icon(Icons.email,                                        color: Color.fromRGBO(253, 127, 44, 1)),                                    hintText: "البريد الإلكتروني",                                    hintStyle: GoogleFonts.tajawal(                                        color: Colors.black87)),                              )),                        ),                        SizedBox(                          height: 10,                        ),                        Container(                            alignment: Alignment.centerRight,                            child: Text("كلمة السر :",                                textDirection: TextDirection.rtl,                                style: GoogleFonts.tajawal(                                    color: Colors.white,                                    fontSize: 16,                                    fontWeight: FontWeight.bold))),                        SizedBox(                          height: 10,                        ),                        Container(                          alignment: Alignment.centerLeft,                          decoration: BoxDecoration(                              color: Colors.white,                              borderRadius: BorderRadius.circular(10),                              boxShadow: [                                BoxShadow(                                  color: Colors.black26,                                  blurRadius: 6,                                  offset: Offset(0, 3),                                )                              ]),                          height: 60,                          child: Theme(                              data: new ThemeData(                                primaryColor: Colors.white,                                primaryColorDark: Colors.white,                              ),                              child: TextField(                                obscureText: true,                                keyboardType: TextInputType.visiblePassword,                                style: GoogleFonts.tajawal(                                  color: Colors.black87,                                ),                                controller: password_controller,                                decoration: InputDecoration(                                  border: InputBorder.none,                                  contentPadding: EdgeInsets.only(top: 14),                                  prefixIcon: Icon(Icons.vpn_key,                                      color: Color.fromRGBO(253, 127, 44, 1)),                                  hintText: "كلمة السر",                                  hintStyle: TextStyle(color: Colors.black87),                                ),                              )),                        ),                        Container(                          alignment: Alignment.centerRight,                          child: FlatButton(                            onPressed: (){                              Navigator.push(context, MaterialPageRoute(builder:                              (context) => Forgot()));                            },                            padding: EdgeInsets.only(right: 0),                            child: Text(                              "نسيت كلمة السر ؟",                              style: GoogleFonts.tajawal(                                  color: Colors.white,                                  fontWeight: FontWeight.bold),                            ),                          ),                        ),                        Container(                          padding: EdgeInsets.symmetric(vertical: 25),                          width: double.infinity,                          child: RaisedButton(                            onPressed: () {                              if (EmailValidator.validate(                                  email_controller.text)) {                                print(password_controller.text);                                if (password_controller.text.length >= 8) {                                  setState(() {                                    click = true;                                  });                                  showDialog(                                    barrierDismissible: false,                                      context: context,                                      builder: (context) => AlertDialog(                                              title: Column(                                            children: [                                              Container(                                                  height: 20,                                                  width: 20,                                                  child:                                                  CircularProgressIndicator()),                                            ],                                          )));                                  signInWithEmailAndPassword(email_controller.text,                                      password_controller.text);                                } else {                                  afficher("يرجى إدخال كلمة سر صحيحة");                                }                              } else {                                afficher("يرجى إدخل بريد إلكتروني صحيح");                              }                            },                            elevation: 5,                            padding: EdgeInsets.all(15),                            shape: RoundedRectangleBorder(                              borderRadius: BorderRadius.circular(15),                            ),                            color: Colors.white,                            child: Text(                              "تسجيل الدخول",                              style: GoogleFonts.tajawal(                                  color: Color.fromRGBO(253, 127, 44, 1),                                  fontWeight: FontWeight.bold),                            ),                          ),                        ),                        SizedBox(                          height: 10,                        ),                        Center(                            child: GestureDetector(                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>                                    SignUp())),                                child: RichText(                                  text: TextSpan(children: [                                    TextSpan(                                        text: "ليس لديك حساب  ? ",                                        style: GoogleFonts.tajawal(                                            color: Colors.white,                                            fontSize: 10,                                            fontWeight: FontWeight.bold)),                                    TextSpan(                                        text: "إنشاء حساب جديد",                                        style: GoogleFonts.tajawal(                                            color: Colors.white,                                            fontWeight: FontWeight.bold,                                            fontSize: 12))                                  ]),                                )))                      ],                    ),                  ],                ),              ),            )          ],        ),      ),    )    );  }  void signInWithEmailAndPassword(String email,      String password) {    FirebaseAuth.instance.signInWithEmailAndPassword(email:    email, password: password).then((result) {      if (result.user != null) {        Navigator.of(context).pushAndRemoveUntil(          MaterialPageRoute(builder: (context)=> MyApp()),            (Route<dynamic> route) => false        );// navigate to home page      }else {        Navigator.pop(context);        afficher("يرجى التحقق من المعلومات المدخلة");      }    }).timeout(Duration(seconds: 10), onTimeout: () {      Navigator.pop(context);afficher("يرجى التحقق من المعلومات المدخلة و وجود الإنترنت");    }).catchError((error) {      Navigator.pop(context);      afficher("يرجى التحقق من المعلومات المدخلة و وجود الإنترنت");    });  }  void afficher(String text) {    _scaffoldKey.currentState.showSnackBar(SnackBar(        content: Text(          text,style: GoogleFonts.tajawal          (),textDirection:        TextDirection.rtl,))) ;  }}