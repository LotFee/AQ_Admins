import 'dart:convert';

import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/auth/data/auth.repository.impl.dart';
import 'package:aq_admin/features/auth/data/datasource/remote_auth.datasource.dart';
import 'package:aq_admin/features/auth/domain/auth.repository.dart';
import 'package:aq_admin/features/auth/domain/entity/user.entity.dart';
import 'package:aq_admin/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:egycoder_faker/egycoder_faker.dart';
import 'package:flutter/material.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Image.network(faker.image.network(keywords: ['smile'])),
          const Text('Hello, this is GetStart page'),
        ],
      ),
    );
  }
}
