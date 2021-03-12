import 'package:fabrication2/Home/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../size_config.dart';

import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cat_1 = Provider.of<List<Cat1>>(context);
    final Cat_2 = Provider.of<List<Cat2>>(context);
    final Cat_3 = Provider.of<List<Cat3>>(context);
    final Cat_4 = Provider.of<List<Cat2>>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
SizedBox(
  height: 30,
),
            PopularProducts("طاولات مدرسية",Cat_1),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts("طاولات مطبخ",Cat_2),
            SizedBox(height: getProportionateScreenWidth(20)),
            PopularProducts("طاولات الصالون",Cat_3),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
