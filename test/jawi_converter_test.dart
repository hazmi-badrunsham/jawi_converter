import 'package:test/test.dart';
import 'package:jawi_converter/jawi_converter.dart';

void main() {
  group('JawiConverter.toJawi', () {
    test('Basic words', () {
      expect(JawiConverter.toJawi('saya'), equals('ساي'));
      expect(JawiConverter.toJawi('sekolah'), equals('سكوله'));
      expect(JawiConverter.toJawi('nganga'), equals('ڠاڠا'));
      expect(JawiConverter.toJawi('khidmat'), equals('خدمت'));
      expect(JawiConverter.toJawi('nyanyi'), equals('ڽانيي'));
      expect(JawiConverter.toJawi('raya'), equals('راي'));
      expect(JawiConverter.toJawi('punya'), equals('ڤونيي'));
    });

    test('Punctuation handling', () {
      expect(JawiConverter.toJawi('Saya pergi.'), equals('ساي ڤرݢي.'));
      expect(JawiConverter.toJawi('Apa khabar?'), equals('افا خبر?'));
    });

    test('Unmapped characters fallback', () {
      expect(JawiConverter.toJawi('email@example.com'), contains('@'));
    });

    test('Whitespace handling', () {
      expect(JawiConverter.toJawi('saya suka kamu'), equals('ساي سوكا كامو'));
    });
  });
}
