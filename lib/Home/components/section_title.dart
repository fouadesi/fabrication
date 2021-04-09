import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabrication2/Home/components/product_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';
import '../models.dart';



class SectionTitle extends StatelessWidget {

  final List<prodcuct> products ;
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.press,
    this.products,
  }) : super(key: key);
  final String title;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OneCate(
              products: this.products,title: this.title,) ));
          },
          child: Text(
            "المزيد",
            style: GoogleFonts.tajawal(color:  Color.fromRGBO(253, 127, 44,1)),
          ),
        ),
        Text(
          title,
          style: GoogleFonts.tajawal(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),

      ],
    );
  }
}

class OneCate extends StatefulWidget {
 final  String title ;
  final List<prodcuct> products ;

  const OneCate({Key key, this.products,this.title}) : super(key: key);

  @override
  _OneCateState createState() => _OneCateState();
}

class _OneCateState extends State<OneCate> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: GoogleFonts.tajawal(color: Colors.black),),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.

        crossAxisCount: 2,


        // Generate 100 widgets that display their index in the List.
        children: widget.products.map((e) => Padding(
          padding: const EdgeInsets.symmetric(vertical : 8.0,horizontal: 20),
          child:   Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: SizedBox(

          width: getProportionateScreenWidth(140),
          child: Container(

            child: GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1.1,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(253, 127, 44,1).withOpacity(0.5),


                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(e.pic),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    e.name,
                    style: TextStyle(color: Colors.black),
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${e.price} DA",
                        style: GoogleFonts.tajawal(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Container(
                          height: getProportionateScreenWidth(28),
                          width: getProportionateScreenWidth(28),
                          decoration: BoxDecoration(
                            color:  Color.fromRGBO(253, 127, 44,1),
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                              onTap: () {
                                FirebaseFirestore.instance.collection(
                                    "ItemOrder").doc(user.uid).collection("items").
                                doc(e.id).set(e.map()).then((value) {
                                  showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (context) => AlertDialog(
                                          title: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text("تمت إضافة المنتج إلى سلة المشتريات",
                                                    style: GoogleFonts.tajawal(fontSize: 15),)
                                                ],
                                              )
                                            ],
                                          )));
                                });

                              },
                              child: Icon(Icons.add_shopping_cart,color: Colors.white,size: 18,)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
        )).toList()
      ),
    );
  }
}


