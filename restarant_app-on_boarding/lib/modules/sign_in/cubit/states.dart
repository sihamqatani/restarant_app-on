abstract class RestarantSignInStates {}

class RestarantSignInIntialState extends RestarantSignInStates {}

class RestarantSignInLoadingState extends RestarantSignInStates {}

class RestarantSignInSuccessState extends RestarantSignInStates {
  final String uId;
  RestarantSignInSuccessState({
    required this.uId,
  });
}

class RestarantSignInErrorState extends RestarantSignInStates {
  final String error;
  RestarantSignInErrorState({
    required this.error,
  });
}

class ChangePasswordSuess extends RestarantSignInStates {}

class ChangrPasswordError extends RestarantSignInStates {
  final String error;
  ChangrPasswordError({
    required this.error,
  });
}

class SignOutState extends RestarantSignInStates {}
