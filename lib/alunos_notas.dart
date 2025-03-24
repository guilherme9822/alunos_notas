import 'package:alunos_notas/models/aluno.dart';
import 'package:alunos_notas/models/console_utils.dart';

void execute() {
  print("Bem vindo ao Sistema de nota!");
  String nome = ConsoleUtils.lerStringComTexto("Digite o nome do aluno:");
  var aluno = Aluno(nome);
  double? nota;
  do {
    nota = ConsoleUtils.lerDoubleComTextoComSaida(
      "Digite a nota ou S pra sair",
      "s",
    );
    if (nota != null) {
      aluno.adicionarNota(nota);
    }
  } while (nota != null);
  print("As notas digitadas foram: ${aluno.getNotas()}");
  print("A média do Aluno foi: ${aluno.retornaMedia()}");
  if (aluno.aprovado(7)) {
    print("O Aluno ${aluno.getNome()} foi aprovado.");
  } else {
    print("O Aluno ${aluno.getNome()} foi reprovado.");
  }
}
