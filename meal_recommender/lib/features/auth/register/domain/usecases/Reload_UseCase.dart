import 'package:meal_recommender/features/auth/register/domain/repositories/registerRepo.dart';

class ReloadUsecase{
  RegisterRepo registerRepo;
  ReloadUsecase(this.registerRepo);
  Future excute()async{
    return await registerRepo.reload();
  }
}