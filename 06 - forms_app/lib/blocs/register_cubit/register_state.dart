part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final UsernameInput username;
  final EmailInput email;
  final PasswordInput password;

  const RegisterState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = const UsernameInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  @override
  List<Object> get props => [
        formStatus,
        isValid,
        username,
        email,
        password,
      ];

  RegisterState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    UsernameInput? username,
    EmailInput? email,
    PasswordInput? password,
  }) =>
      RegisterState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
        username: username ?? this.username,
      );
}
