import 'package:cloud_firestore/cloud_firestore.dart';import 'package:fabrication2/Home/models.dart';import 'package:fabrication2/size_config.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:flutter/material.dart';import 'package:google_fonts/google_fonts.dart';import 'package:provider/provider.dart';class ShoppingCard extends StatefulWidget {  @override  _ShoppingCardState createState() => _ShoppingCardState();}class _ShoppingCardState extends State<ShoppingCard> {  @override  Widget build(BuildContext context) {    final prod = Provider.of<List<prodcuct>>(context);    return Scaffold(      bottomNavigationBar: ConfirmOrder(),      appBar: AppBar(        centerTitle: true,        title: Text("سلة المشتريات",style: GoogleFonts.tajawal(          color: Colors.black87        ),),      ),      body: ListView.builder(          itemCount: prod.length ?? 0 ,        itemBuilder: (context,index) {            return Padding(              padding: EdgeInsets.only(top: 10),              child: ItemInShoppingCard(prod[index]),            );        }      )    );  }}class ItemInShoppingCard extends StatelessWidget {  prodcuct pro ;  ItemInShoppingCard(this.pro);  @override  Widget build(BuildContext context) {    final user = Provider.of<User>(context);    return Row(      mainAxisAlignment: MainAxisAlignment.spaceAround ,      children: [      SizedBox(width: 100,      child: AspectRatio(        aspectRatio: 0.88,        child: Container(          decoration:  BoxDecoration(            color: Color.fromRGBO(253, 127, 44,1).withOpacity(0.7),            borderRadius: BorderRadius.circular(15),          ),          child: Image.network(this.pro.pic),        ),      ),),        SizedBox(width: 140,),        SizedBox(          width: 100,          child: Row(            children: [              Column(                crossAxisAlignment: CrossAxisAlignment.start,                children: [                  Text(                      "${pro.name}"                  ),                  SizedBox(                    height: 10,                  ),                  Text.rich(TextSpan(                text: "DA ${pro.price}"  ,                style: GoogleFonts.tajawal(                  fontWeight: FontWeight.w600,                  color: Color.fromRGBO(253, 127, 44,1),                ) ,                children: [                ]                  )),              ],),              SizedBox(                width: 20,              ),              InkWell(                onTap: () {                  FirebaseFirestore.instance.collection("ItemOrder").doc(user.uid).                  collection("items").doc(pro.id).delete();                },                child: Icon(Icons.delete),              ),            ],          ),        ),       SizedBox(width: 10,)    ],);  }}class ConfirmOrder extends StatelessWidget {  @override  Widget build(BuildContext context) {    double total = 0 ;    final products =  Provider.of<List<prodcuct>>(context);    for(int i = 0 ; i < products.length ; i++) {      total+= (double.parse(products[i].price));    }    return Container(      padding: EdgeInsets.symmetric(        vertical: getProportionateScreenWidth(15),        horizontal: getProportionateScreenWidth(30),      ),      // height: 174,      decoration: BoxDecoration(        color: Colors.white,        borderRadius: BorderRadius.only(          topLeft: Radius.circular(30),          topRight: Radius.circular(30),        ),        boxShadow: [          BoxShadow(            offset: Offset(0, -15),            blurRadius: 20,            color: Color(0xFFDADADA).withOpacity(0.15),          )        ],      ),      child: SafeArea(        child: Column(          mainAxisSize: MainAxisSize.min,          crossAxisAlignment: CrossAxisAlignment.start,          children: [            Row(              children: [                Container(                  padding: EdgeInsets.all(10),                  height: getProportionateScreenWidth(40),                  width: getProportionateScreenWidth(40),                  decoration: BoxDecoration(                    color: Color(0xFFF5F6F9),                    borderRadius: BorderRadius.circular(10),                  ),                  child: Icon(                   Icons.arrow_forward                  ),                ),                Spacer(),                const SizedBox(width: 5),              ],            ),            SizedBox(height: getProportionateScreenHeight(20)),            Row(              mainAxisAlignment: MainAxisAlignment.spaceBetween,              children: [                Text.rich(                  TextSpan(                    text: "المجموع\n",                    style: GoogleFonts.tajawal(fontSize: 16, color: Colors.black),                    children: [                      TextSpan(                        text: "$total DA",                        style: GoogleFonts.tajawal(                            fontSize: 16, color: Colors.black),                      ),                    ],                  ),                ),                SizedBox(                  width: 200,                  child: FlatButton(                    shape: new RoundedRectangleBorder(                      borderRadius: new BorderRadius.circular(30.0),                    ),                    color: Color.fromRGBO(253, 127, 44,1),                    child: Text("إرسال الطلب",style: GoogleFonts.tajawal(color: Colors.white),),                    onPressed: () {                      if (products.length > 0) {                      } else {                      }                    },                  ),                ),              ],            ),          ],        ),      ),    );  }}