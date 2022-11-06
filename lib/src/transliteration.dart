import 'arabic_unicode.dart';

/// Transliteration between two set of characters.
abstract class Transliteration {
  /// Transliterate from A characters to B characters.
  String forward(String value);

  /// Transliterate from B characters to A characters.
  String backward(String value);
}

/// Transliteration between ASCII and Arabic characters.
///
/// See Also:
///
/// * Extended Buckwalter <https://corpus.quran.com/java/buckwalter.jsp>
class ExtendedBuckwalterTransliteration implements Transliteration {
  static const Map<String, String> _table = {
    "'": kArabicLetterHamza,
    '>': kArabicLetterAlefWithHamzaAbove,
    '&': kArabicLetterWawWithHamzaAbove,
    '<': kArabicLetterAlefWithHamzaBelow,
    '}': kArabicLetterYehWithHamzaAbove,
    'A': kArabicLetterAlef,
    'b': kArabicLetterBeh,
    'p': kArabicLetterTehMarbuta,
    't': kArabicLetterTeh,
    'v': kArabicLetterTheh,
    'j': kArabicLetterJeem,
    'H': kArabicLetterHah,
    'x': kArabicLetterKhah,
    'd': kArabicLetterDal,
    '*': kArabicLetterThal,
    'r': kArabicLetterReh,
    'z': kArabicLetterZain,
    's': kArabicLetterSeen,
    '\$': kArabicLetterSheen,
    'S': kArabicLetterSad,
    'D': kArabicLetterDad,
    'T': kArabicLetterTah,
    'Z': kArabicLetterZah,
    'E': kArabicLetterAin,
    'g': kArabicLetterGhain,
    '_': kArabicTatweel,
    'f': kArabicLetterFeh,
    'q': kArabicLetterQaf,
    'k': kArabicLetterKaf,
    'l': kArabicLetterLam,
    'm': kArabicLetterMeem,
    'n': kArabicLetterNoon,
    'h': kArabicLetterHeh,
    'w': kArabicLetterWaw,
    'Y': kArabicLetterAlefMaksura,
    'y': kArabicLetterYeh,
    'F': kArabicFathatan,
    'N': kArabicDammatan,
    'K': kArabicKasratan,
    'a': kArabicFatha,
    'u': kArabicDamma,
    'i': kArabicKasra,
    '~': kArabicShadda,
    'o': kArabicSukun,
    '^': kArabicMaddahAbove,
    '#': kArabicHamzaAbove,
    '`': kArabicLetterSuperscriptAlef,
    '{': kArabicLetterAlefWasla,
    ':': kArabicSmallHighSeen,
    '@': kArabicSmallHighRoundedZero,
    '"': kArabicSmallHighUprightRectangularZero,
    '[': kArabicSmallHighMeemIsolatedForm,
    ';': kArabicSmallLowSeen,
    ',': kArabicSmallWaw,
    '.': kArabicSmallYeh,
    '!': kArabicSmallHighNoon,
    '-': kArabicEmptyCentreLowStop,
    '+': kArabicEmptyCentreHighStop,
    '%': kArabicRoundedHighStopWithFilledCentre,
    ']': kArabicSmallLowMeem,
  };

  static Map<String, String> get _forwardTable => _table;

  static Map<String, String> get _backwardTable => _table.map((k, v) => MapEntry(v, k));

  static String _convert(String value, Map<String, String> table) {
    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i < value.length; i++) {
      buffer.write(table[value[i]]!);
    }
    return buffer.toString();
  }

  static String _forward(String value) => _convert(value, _forwardTable);

  static String _backward(String value) => _convert(value, _backwardTable);

  @override
  String forward(String value) => _forward(value);

  @override
  String backward(String value) => _backward(value);
}
