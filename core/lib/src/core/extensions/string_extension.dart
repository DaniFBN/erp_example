extension StringExtensions on String {
  String capitalize() {
    final firstLetter = this[0].toUpperCase();
    final rest = substring(1);
    return '$firstLetter$rest';
  }
}
