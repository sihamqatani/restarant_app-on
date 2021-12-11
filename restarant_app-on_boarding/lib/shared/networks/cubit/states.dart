abstract class RestaurantStates {}

class RestaurantInitialState extends RestaurantStates {}

class RestaurantBottomNavState extends RestaurantStates {}

class RestarantGetcatogriesLoadingState extends RestaurantStates {}

class RestarantGetcatogriesSucessState extends RestaurantStates {}

class RestarantGetcatogriesErrorState extends RestaurantStates {
  final String error;
  RestarantGetcatogriesErrorState({required this.error});
}

class RestarantMealsLoadingState extends RestaurantStates {}

class RestarantMealsSucessState extends RestaurantStates {}

class RestarantMealsErrorState extends RestaurantStates {
  final String error;

  RestarantMealsErrorState({required this.error});
}
