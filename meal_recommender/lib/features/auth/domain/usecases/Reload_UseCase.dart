import '../repositories/login_repo.dart';

class ReloadUsecase{
  AuthRepo registerRepo;
  ReloadUsecase(this.registerRepo);
  Future excute()async{
    return await registerRepo.reload();
  }
}