/*
  Validation 処理専用
*/

class Validations {
  // 必須チェック
  static String? required(String fieldName, String? value) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldNameを入力してください';
    }
    return null; // 問題なし
  }

  // 文字数チェック
  static String? characterCount(
      String fieldName, String? value, int? lowerLimit, int? upperLimit) {
    final int _inputCnt;

    if (value == null) {
      return null;
    }
    _inputCnt = value.length;
    // チェック
    if (!(lowerLimit == null) && _inputCnt < lowerLimit) {
      return '$fieldName は $lowerLimit 文字以上で入力してください';
    } else if (!(upperLimit == null) && _inputCnt > upperLimit) {
      return '$fieldName は $lowerLimit 文字以下で入力してください';
    }
    return null;
  }
}
