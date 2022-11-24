part of 'estates_cubit.dart';

abstract class EstatesState extends Equatable {
  const EstatesState();

  @override
  List<Object> get props => [];
}

class EstatesInitial extends EstatesState {}

class EstateLoadingState extends EstatesState {}

class EstateSuccessState extends EstatesState {
  final List<Estate> estates;

  const EstateSuccessState(this.estates);
}

class EstateErrorState extends EstatesState {
  final Failure failure;

  const EstateErrorState(this.failure);
}
