import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:help_giver/features/userhandling/domain/entities/user.dart';

abstract class RegisterEvent extends Equatable {
   RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final User user;

   RegisterButtonPressed({
    @required this.user,
  });

  @override
  List<Object> get props => [user];

  @override
  String toString() =>
      'LoginButtonPressed { user: $user}';
}