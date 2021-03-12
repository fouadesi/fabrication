import 'package:fabrication2/Home/components/Product.dart';
import 'package:fabrication2/Home/components/product_card.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../models.dart';
import 'section_title.dart';
class PopularProducts extends StatelessWidget {
  String title ;
  List<prodcuct> products ;
  PopularProducts(this.title,this.products);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: this.title, press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                products.length,
                (index) {
                    return ProductCard(product: products[index]);
                  return SizedBox.shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
