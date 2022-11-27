import 'package:aq_admin/core/configuration/pagination.core.dart';
import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/estate/domain/entity/estate.entity.dart';
import 'package:aq_admin/features/estate/domain/estate.repository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'estates_state.dart';

class EstatesCubit extends Cubit<EstatesState> {
  final EstateRepository estateRepository;
  EstatesCubit(this.estateRepository) : super(const EstatesInitial());
  int currentIndex = defaultPaginationStartIndex;
  bool isLoading = false;

  final _estates = <Estate>[];
  Future<void> query() async {
    if (isLoading) return;
    isLoading = true;
    emit(
      EstateLoadingState(
        _estates,
        isFirstLoading: currentIndex == defaultPaginationStartIndex,
      ),
    );
    final estates = await estateRepository.query(
      defaultPaginationPageSize,
      currentIndex,
    );
    estates.fold(
      (l) => emit(EstateErrorState(l, _estates)),
      (r) {
        _estates.addAll(r);
        emit(EstateSuccessState(_estates));
      },
    );
    currentIndex++;
    isLoading = false;
  }
}
