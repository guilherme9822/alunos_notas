class NomeInvalidoException implements Exception {
  String error() => "Voce tem que digitar um nome!";

  @override
  String toString() {
    return "NomeInvalidoException: ${error()}";
  }
}
