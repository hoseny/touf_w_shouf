import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/data/models/services_model.dart';

enum ProgramGroupStatus { initial, loading, success, failure }
enum GroupPriceStatus { initial, loading, success, failure }

class ProgramGroupState {
  final ProgramGroupStatus programGroupStatus;
  final GroupPriceStatus groupPriceStatus;

  final List<ProgramGroup>? programGroups;
  final ServicesModel? services;
  final String errorMessage;
  final bool isTermsAccepted;

  const ProgramGroupState({
    this.programGroupStatus = ProgramGroupStatus.initial,
    this.groupPriceStatus = GroupPriceStatus.initial,
    this.programGroups,
    this.services,
    this.errorMessage = '',
    this.isTermsAccepted = false,
  });

  ProgramGroupState copyWith({
    ProgramGroupStatus? programGroupStatus,
    GroupPriceStatus? groupPriceStatus,
    List<ProgramGroup>? programGroups,
    ServicesModel? services,
    String? errorMessage,
    bool? isTermsAccepted,
  }) {
    return ProgramGroupState(
      programGroupStatus: programGroupStatus ?? this.programGroupStatus,
      groupPriceStatus: groupPriceStatus ?? this.groupPriceStatus,
      programGroups: programGroups ?? this.programGroups,
      services: services ?? this.services,
      errorMessage: errorMessage ?? this.errorMessage,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
    );
  }
}
