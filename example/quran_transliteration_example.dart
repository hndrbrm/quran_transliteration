import 'package:quran_transliteration/quran_transliteration.dart';

void main() {
  final Transliteration transliteration = ExtendedBuckwalterTransliteration();
  print(transliteration.forward('bisomi'));
  print(transliteration.backward('بِسْمِ'));
}
