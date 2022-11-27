// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'estates_cubit.dart';

abstract class EstatesState extends Equatable {
  final List<Estate> estates;
  const EstatesState(this.estates);

  @override
  List<Object> get props => [];
}

class EstatesInitial extends EstatesState {
  const EstatesInitial() : super(const []);
}

class EstateLoadingState extends EstatesState {
  final bool isFirstLoading;
  const EstateLoadingState(
    super.estates, {
    required this.isFirstLoading,
  });
}

class EstateSuccessState extends EstatesState {
  const EstateSuccessState(super.estates);
}

class EstateErrorState extends EstatesState {
  final Failure failure;
  const EstateErrorState(this.failure, super.estates);
}
