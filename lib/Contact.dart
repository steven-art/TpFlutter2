import 'dart:math';
import 'package:english_words/src/word_pair.dart';
import 'package:validators/validators.dart';

class Contact {
  WordPair pair;
  int randomInt ;
  String Lettres =  "";
  Contact(int randomInt, WordPair pair) {
    this.randomInt = randomInt;
    this.pair = pair;
    String transition = pair.asPascalCase;
    for(int i=0;i<transition.length;i++){
      if(isUppercase(transition[i])){
        Lettres += transition[i];
      }
    }
  }
}
