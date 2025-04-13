import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';

enum ProgramGroupStatus { initial, loading, success, failure }
enum GroupPriceStatus { initial, loading, success, failure }

class ProgramGroupState {
  final ProgramGroupStatus programGroupStatus;
  final GroupPriceStatus groupPriceStatus;

  final List<ProgramGroup>? programGroups;
  final List<GroupPrice>? groupPrice;
  final String errorMessage;
  final bool isTermsAccepted;

  const ProgramGroupState({
    this.programGroupStatus = ProgramGroupStatus.initial,
    this.groupPriceStatus = GroupPriceStatus.initial,
    this.programGroups,
    this.groupPrice,
    this.errorMessage = '',
    this.isTermsAccepted = false,
  });

  ProgramGroupState copyWith({
    ProgramGroupStatus? programGroupStatus,
    GroupPriceStatus? groupPriceStatus,
    List<ProgramGroup>? programGroups,
    List<GroupPrice>? groupPrice,
    String? errorMessage,
    bool? isTermsAccepted,
  }) {
    return ProgramGroupState(
      programGroupStatus: programGroupStatus ?? this.programGroupStatus,
      groupPriceStatus: groupPriceStatus ?? this.groupPriceStatus,
      programGroups: programGroups ?? this.programGroups,
      groupPrice: groupPrice ?? this.groupPrice,
      errorMessage: errorMessage ?? this.errorMessage,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
    );
  }
}
