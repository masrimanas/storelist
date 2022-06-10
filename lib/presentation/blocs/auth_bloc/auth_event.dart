part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogInPressed extends AuthEvent {
  const AuthLogInPressed(
    this.username,
    this.password,
  );

  final String username;
  final String password;

  @override
  List<Object> get props => [
        username,
        password,
      ];
}

class AuthLogOutPressed extends AuthEvent {
  const AuthLogOutPressed();

  @override
  List<Object> get props => [];
}
