import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:help_giver/features/userhandling/domain/entities/user.dart';

abstract class LoginEvent extends Equatable {
   LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final User user;

   LoginButtonPressed({
    @required this.user,
  });

  @override
  List<Object> get props => [user];

  @override
  String toString() =>
      'LoginButtonPressed { user: $user}';
}