class GoogleTranslateConstants {
  static String mapLanguageCodeToLanguageName(String? code) {
    Map<String, String> map = {
      "Automatic": "auto",
      "Afrikaans": "af",
      "Albanian": "sq",
      "Amharic": "am",
      "Arabic": "ar",
      "Armenian": "hy",
      "Azerbaijani": "az",
      "Basque": "eu",
      "Belarusian": "be",
      "Bengali": "bn",
      "Bosnian": "bs",
      "Bulgarian": "bg",
      "Catalan": "ca",
      "Cebuano": "ceb",
      "Chichewa": "ny",
      "ChineseSimplified": "zh-cn",
      "Chinese Traditional": "zh-tw",
      "Corsican": "co",
      "Croatian": "hr",
      "Czech": "cs",
      "Danish": "da",
      "Dutch": "nl",
      "English": "en",
      "Estonian": "et",
      "Filipino": "tl",
      "Finnish": "fi",
      "French": "fr",
      "Frisian": "fy",
      "Galician": "gl",
      "German": "de",
      "Greek": "el",
      "Haitian Creole": "ht",
      "Hausa": "ha",
      "Hebrew": "iw",
      "Hindi": "hi",
      "Hmong": "hmn",
      "Hungarian": "hu",
      "Icelandic": "is",
      "Igbo": "ig",
      "Indonesian": "id",
      "Irish": "ga",
      "Italian": "it",
      "Japanese": "ja",
      "Javanese": "jw",
      "Kannada": "kn",
      "Kazakh": "kk",
      "Khmer": "km",
      "Korean": "ko",
      "Kurdish (Kurmanji)": "ku",
      "Kyrgyz": "ky",
      "Lao": "lo",
      "Latvian": "lv",
      "Lithuanian": "lt",
      "Luxembourgish": "lb",
      "Macedonian": "mk",
      "Malagasy": "mg",
      "Malay": "ms",
      "Malayalam": "ml",
      "Maltese": "mt",
      "Maori": "mi",
      "Mongolian": "mn",
      "Myanmar (Burmese)": "my",
      "Nepali": "ne",
      "Norwegian": "no",
      "Pashto": "ps",
      "Persian": "fa",
      "Polish": "pl",
      "Portuguese": "pt",
      "Punjabi": "pa",
      "Romanian": "ro",
      "Russian": "ru",
      "Samoan": "sm",
      "Scots Gaelic": "gd",
      "Serbian": "sr",
      "Sesotho": "st",
      "Shona": "sn",
      "Sindhi": "sd",
      "Sinhala": "si",
      "Slovak": "sk",
      "Slovenian": "sl",
      "Somali": "so",
      "Spanish": "es",
      "Sundanese": "su",
      "Swahili": "sw",
      "Swedish": "sv",
      "Tajik": "tg",
      "Tamil": "ta",
      "Telugu": "te",
      "Thai": "th",
      "Turkish": "tr",
      "Ukrainian": "uk",
      "Urdu": "ur",
      "Uzbek": "uz",
      "Uyghur": "ug",
      "Vietnamese": "vi",
      "Xhosa": "xh",
      "Yoruba": "yo",
      "Zulu": "zu",
    };
    return map[code] ?? '';
  }
}
