// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aq_admin/core/logger.core.dart';
import 'package:aq_admin/presentation/pages/estates/cubit/estates_cubit.dart';
import 'package:aq_admin/presentation/pages/estates/widget/estate_tile.widget.dart';
import 'package:aq_admin/presentation/pages/estates/widget/loading_estate_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class EstatesPage extends StatefulWidget {
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
  State<EstatesPage> createState() => _EstatesPageState();
}

class _EstatesPageState extends State<EstatesPage> {
  final scrollController = ScrollController();
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        scrollController.addListener(() {
          if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent / 2) {
            context.read<EstatesCubit>().query();
          }
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EstatesCubit, EstatesState>(
        listener: (context, state) {
          if (state is EstateErrorState) {
            logger.error(state.failure.error);
          }
        },
        builder: (context, state) {
          if (state is EstateLoadingState) {
            return ListView.builder(
              itemBuilder: (_, __) {
                return const LoadingEstateTile();
              },
              itemCount: 10,
            );
          }
          if (state is EstateSuccessState) {
            return Center(
              child: ListView.separated(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return EstateTile(state.estates[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15.0,
                  );
                },
                itemCount: state.estates.length,
              ),
            );
          }
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<EstatesCubit>().query();
              },
              child: Text('get estates'),
            ),
          );
          // return ListView.builder(
          //   itemBuilder: (_, i) => ListTile(
          //     title: Text('Estate ${i + 1}'),
          //     onTap: () => context.goNamed(NavigationService.estate,
          //         params: {'estateId': '${i + 1}'}),
          //   ),
          //   itemCount: 20,
          // );
        },
      ),
    );
  }
}
