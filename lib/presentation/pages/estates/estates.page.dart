import 'package:aq_admin/core/logger.core.dart';
import 'package:aq_admin/presentation/pages/estates/cubit/estates_cubit.dart';
import 'package:aq_admin/presentation/pages/estates/widget/estate_tile.widget.dart';
import 'package:aq_admin/presentation/pages/estates/widget/loading_estate_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstatesPage extends StatefulWidget {
  const EstatesPage({super.key});

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
          bool appendOneMoreTile = false;
          if (state is EstateLoadingState) {
            if (state.isFirstLoading) {
              return ListView.builder(
                itemBuilder: (_, __) => const LoadingEstateTile(),
                itemCount: 10,
              );
            } else {
              appendOneMoreTile = true;
            }
          }
          if (state.estates.isEmpty) {
            return const Center(child: Text('There Is No Data'));
          }
          return ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index < state.estates.length) {
                return EstateTile(state.estates[index]);
              } else {
                return const LoadingEstateTile();
              }
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15.0);
            },
            itemCount: state.estates.length + (appendOneMoreTile ? 1 : 0),
          );
        },
      ),
    );
  }
}
