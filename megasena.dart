import 'dart:math' show Random;
import 'dart:io';

void main() {
  final random = Random();
  final megaSenaNumbers = Set<int>();

  while (megaSenaNumbers.length < 6) {
    final randomNumber = random.nextInt(60) + 1; // Gera números de 1 a 60
    megaSenaNumbers.add(randomNumber);
  }

  print("Bem-vindo ao Jogo da Mega-Sena!");
  print("Aqui estão os números sorteados:");

  for (final number in megaSenaNumbers) {
    print(number);
  }

  final playerNumbers = Set<int>();
  for (var i = 0; i < 6; i++) {
    int userNumber;
    do {
      print("Digite o número ${i + 1} (1-60): ");
      userNumber = int.tryParse(stdin.readLineSync() ?? '')!;
    } while (userNumber == null || userNumber < 1 || userNumber > 60);

    playerNumbers.add(userNumber);
  }

  final matchedNumbers = playerNumbers.intersection(megaSenaNumbers);
  final numberOfMatches = matchedNumbers.length;

  print("Seus números escolhidos: $playerNumbers");
  print("Números sorteados: $megaSenaNumbers");
  print("Você acertou $numberOfMatches números!");

  if (numberOfMatches >= 4) {
    print("Parabéns, você ganhou um prêmio!");
  } else {
    print("Não foi dessa vez. Tente novamente!");
  }
}
