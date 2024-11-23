
abstract class UseCase<Type,Pram>{
  Future<Type> call({Pram param});
}