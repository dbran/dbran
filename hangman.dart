import 'dart:io';

void main() {
  int i = 0;
  int vidas = 10;
  late String auxPalavra = '-';
  late String? letra;
  var letters = [for (var i = 65; i <= 90; i++) String.fromCharCode(i)];
  List<String> listaPalavras = [
    'BANANA',
    'PINAPLE',
    'WATERMELON',
    'STRAWBERRY',
    'PEACH',
    'CRAMBERRY',
    'COCONUT',
    'RASPEBERRY',
    'TANGERINE',
    'PINEAPLLE'
  ];

  listaPalavras.shuffle();
  String palavra = listaPalavras.first;
  print(palavra);
  int tamanhoPalavra = palavra.length;
  var aux = '-';
  auxPalavra = aux * tamanhoPalavra;

  print('----HANGMAN-----');
  print('Letras Erradas: ');
  print('The word to guess has $tamanhoPalavra letters');
  do {
    if (palavra != auxPalavra) {
      i = 0;
      letra = '';
      print('type a letter');
      letra = stdin.readLineSync();
      letra = letra?.toUpperCase();

      if (letters.contains(letra)) {
        if (palavra.contains(letra!)) {
          do {
            if (palavra[i] == letra) {
              var posicao = i;
              if (posicao == 0) {
                auxPalavra = letra + auxPalavra.substring(1, tamanhoPalavra);
              } else if (posicao == tamanhoPalavra - 1) {
                auxPalavra =
                    auxPalavra.substring(0, tamanhoPalavra - 1) + letra;
              } else {
                auxPalavra = auxPalavra.substring(0, posicao) +
                    letra +
                    auxPalavra.substring(posicao + 1, tamanhoPalavra);
              }
            }

            i++;
          } while (i < palavra.length);
          print('forca $auxPalavra');
          vidas--;
        } else {
          vidas--;
          print('The word dont contain $letra');
          print('You have $vidas more lives.');
        }
      } else {
        print('You already use $letra');
        vidas--;
      }
    } else {
      print('You guess the word $palavra !');
      vidas = 0;
    }
  } while (vidas > 0);
  if (auxPalavra != palavra && vidas == 0) {
    print('You loose! Word  was $palavra !');
  }
}
