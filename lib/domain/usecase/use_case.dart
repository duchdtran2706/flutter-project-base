abstract class UseCase<Param, ReturnType> {
  Future<ReturnType> invoke(Param param);
}

class NoParam {}