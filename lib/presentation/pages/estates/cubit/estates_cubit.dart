import 'package:aq_admin/core/configration/pagination.core.dart';
import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/estate/domain/entity/estate.entity.dart';
import 'package:aq_admin/features/estate/domain/estate.repository.dart';
import 'package:aq_admin/presentation/widgets/loading.widget.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'estates_state.dart';

class EstatesCubit extends Cubit<EstatesState> {
  final EstateRepository estateRepository;
  EstatesCubit(this.estateRepository) : super(EstatesInitial());
  int currentIndex = defaultPaginationStartIndex;
  bool isLoading = false;
  Future<void> query() async {
    if (isLoading) return;
    isLoading = true;
    emit(EstateLoadingState());
    final estates = await estateRepository.query(
      defaultPaginationPageSize,
      currentIndex,
    );
    estates.fold(
      (l) => emit(EstateErrorState(l)),
      (r) => emit(EstateSuccessState(r)),
    );
    currentIndex++;
    isLoading = false;
  }
}
