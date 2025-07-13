# jawi_converter

A Dart package to convert Bahasa Melayu (Rumi) into **Jawi script**.  

---

## ✨ Features

- ✅ Converts standard Malay words to Jawi  
- 🔧 Simple logic, easy to extend with your own dictionary  
- 🔍 Falls back to per-letter transliteration when word not found  

---

## 🚀 Usage

```dart
import 'package:jawi_converter/jawi_converter.dart';

void main() {
  print(JawiConverter.toJawi('Saya ke sekolah.'));
  // Output: ساي ك سكوله.
}
```
## ⚠️ Disclaimer

This package uses a hybrid dictionary + rule-based approach.  
Some Jawi results may not be 100% accurate in complex or ambiguous cases (homographs).

Please verify spellings with:  
👉 [PRPM DBP Online Dictionary](https://prpm.dbp.gov.my/)

Contributions for word improvements are welcome via pull requests or issues.

---

## 🖋 Recommended Fonts for Jawi

To properly render Jawi script (Arabic-based), use Unicode-compliant fonts:

### ✅ Web Fonts

- **Noto Nastaliq Urdu** – Elegant, Google-supported  
- **Scheherazade** – Classic Arabic font, good for readability  
- **Amiri** – Book-style Arabic font

### ✅ TTF Fonts for Apps or Flutter

- `NotoNastaliqUrdu-Regular.ttf`  
- `Amiri-Regular.ttf`  
- `Lateef.ttf` (good for flowing scripts)  
- `TraditionalArabic.ttf` (common fallback on Windows)

> 💡 You can bundle these fonts in your `pubspec.yaml` for use in Flutter projects.

---

## 📦 TODO & Roadmap

- [ ] Add more verified Malay-Jawi dictionary entries  
- [ ] Support reverse transliteration (Jawi → Rumi)  
- [ ] Word context disambiguation (homograph handling)  
- [ ] Export as CLI or Web API for integrations  

---

## 🤝 Contributing

Pull requests are welcome!  
If you know better Jawi forms or want to help expand the dictionary, open an issue or PR.
