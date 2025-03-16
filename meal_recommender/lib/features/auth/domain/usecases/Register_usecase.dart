import '../repositories/login_repo.dart';

class RegisterUsecase{
  AuthRepo registerRepo;
  RegisterUsecase(this.registerRepo);
  Future excute(String UserName,String email,String password)async{
    return await registerRepo.register(UserName,email, password);
  }
}