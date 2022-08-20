import 'package:clds/models/user.dart';
import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final UserModel user;

  const Authenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  const AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}
