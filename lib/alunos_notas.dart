import 'dart:io';

import 'package:alunos_notas/exception/nome_invalido_exception.dart';
import 'package:alunos_notas/models/aluno.dart';
import 'package:alunos_notas/models/console_utils.dart';

void execute() {
  print("Bem vindo ao Sistema de nota!");
  String nome = ConsoleUtils.lerStringComTexto("Digite o nome do aluno:");
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

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
  print("A média do Aluno ${aluno.getNome()} ficou: ${aluno.retornaMedia()}");
  if (aluno.aprovado(7)) {
    print("O Aluno ${aluno.getNome()} foi aprovado.");
  } else {
    print("O Aluno ${aluno.getNome()} foi reprovado.");
  }
}
