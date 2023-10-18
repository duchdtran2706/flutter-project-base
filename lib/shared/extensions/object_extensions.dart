extension ObjectExt on Object {
  T? as<T>({T? defaultValue}) {
    if (this is T) {
      return this as T;
    }

    return defaultValue;
  }
}