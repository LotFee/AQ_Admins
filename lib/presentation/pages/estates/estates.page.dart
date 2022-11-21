// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:aq_admin/service/navigations.service.dart';

// ignore: must_be_immutable
class EstatesPage extends StatelessWidget {
  String? ownerName;
  String? phone;
  String? status;
  String? category;
  String? plan;
  String? price;
  String? city;
  String? district;
  String? review;
  String? date;
  String? wifi;
  String? tv;

  // ignore: use_key_in_widget_constructors
  EstatesPage(
      {this.ownerName,
      this.phone,
      this.status,
      this.category,
      this.plan,
      this.price,
      this.city,
      this.district,
      this.review,
      this.wifi,
      this.tv,
      this.date});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (_, i) => ListTile(
        title: Text('Estate ${i + 1}'),
        onTap: () => context.goNamed(NavigationService.estate,
            params: {'estateId': '${i + 1}'}),
      ),
      itemCount: 20,
    ));
  }
}
