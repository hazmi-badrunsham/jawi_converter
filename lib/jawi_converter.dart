library jawi_converter;

/// Converts Malay Rumi text into Jawi script.
class JawiConverter {
  /// Dictionary of known Rumi → Jawi word conversions
  static final Map<String, String> _wordDictionary = {
    'saya': 'ساي',
    'sekolah': 'سكوله',
    'nyanyi': 'ڽانيي',
    'nganga': 'ڠاڠا',
    'khidmat': 'خدمت',
    'punya': 'ڤونيي',
    'raya': 'راي',
    'pergi': 'ڤرݢي',
    'makan': 'ماکن',
    'minum': 'مينوم',
    'kerja': 'کرجا',
    'buku': 'بوکو',
    'apa': 'افا',
    'khabar': 'خبر',
    'dan': 'دان',
    'ke': 'ك',

    // Add more dictionary words here
  };

  /// Composite 2-letter digraphs that map to a single Jawi character
  static final Map<String, String> _composite = {
    'ng': 'ڠ',
    'ny': 'ڽ',
    'sy': 'ش',
    'kh': 'خ',
  };

  /// Fallback single-character transliteration map
  static final Map<String, String> _rumiToJawi = {
    'a': 'ا',
    'b': 'ب',
    'c': 'چ',
    'd': 'د',
    'e': '', // Silent/neutral, handled in rules
    'f': 'ف',
    'g': 'ݢ',
    'h': 'ه',
    'i': 'ي',
    'j': 'ج',
    'k': 'ك',
    'l': 'ل',
    'm': 'م',
    'n': 'ن',
    'o': 'و',
    'p': 'ڤ',
    'q': 'ق',
    'r': 'ر',
    's': 'س',
    't': 'ت',
    'u': 'و',
    'v': 'ۏ',
    'w': 'و',
    'x': 'کس',
    'y': 'ي',
    'z': 'ز',
    ' ': ' ',
    '.': '.',
    ',': ',',
    '?': '?',
    '!': '!',
  };

  /// Converts a full Rumi string into Jawi script.
  static String toJawi(String input) {
    // Tokenize into words, punctuation, and spaces
    final tokens = RegExp(r'[\w]+|[^\w\s]+|\s+')
        .allMatches(input.toLowerCase())
        .map((m) => m.group(0)!)
        .toList();

    final buffer = StringBuffer();

    for (final token in tokens) {
      if (token.trim().isEmpty) {
        buffer.write(token); // Preserve space
      } else if (_wordDictionary.containsKey(token)) {
        buffer.write(_wordDictionary[token]);
      } else {
        buffer.write(_transliterateFallback(token));
      }
    }

    return buffer.toString();
  }

  /// Fallback transliteration for unknown words
  static String _transliterateFallback(String word) {
    final buffer = StringBuffer();
    int i = 0;

    while (i < word.length) {
      bool matched = false;

      // Check for composite digraphs (ny, sy, etc.)
      for (final entry in _composite.entries) {
        final key = entry.key;
        if (i + key.length <= word.length &&
            word.substring(i, i + key.length) == key) {
          buffer.write(entry.value);
          i += key.length;
          matched = true;
          break;
        }
      }
      if (matched) continue;

      final char = word[i];

      // Handle final "ya" → "ي" (e.g., saya, raya)
      if (i + 1 < word.length &&
          word[i] == 'y' &&
          word[i + 1] == 'a' &&
          i + 2 == word.length) {
        buffer.write('ي');
        break;
      }

      // Skip "a" before final "h" (e.g., sekolah)
      if (char == 'a' &&
          i + 1 < word.length &&
          word[i + 1] == 'h' &&
          i + 2 == word.length) {
        i++;
        continue;
      }

      // Skip neutral 'e'
      if (char == 'e') {
        i++;
        continue;
      }

      buffer.write(_rumiToJawi[char] ?? char);
      i++;
    }

    return buffer.toString();
  }
}
