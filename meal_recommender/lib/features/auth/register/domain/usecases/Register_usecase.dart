import 'package:meal_recommender/features/auth/register/domain/repositories/registerRepo.dart';

class RegisterUsecase{
  RegisterRepo registerRepo;
  RegisterUsecase(this.registerRepo);
  Future excute(String email,String password)async{
    return await registerRepo.register(email, password);
  }
}