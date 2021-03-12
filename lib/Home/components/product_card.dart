import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabrication2/Home/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../../size_config.dart';

import 'Product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final prodcuct product;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(

        width: getProportionateScreenWidth(width),
        child: Container(

          child: GestureDetector(


            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(

                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(253, 127, 44,1).withOpacity(0.5),


                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.network(product.pic),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.name,
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${product.price} DA",
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
                            doc(product.id).set(product.map());

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
    );
  }
}
