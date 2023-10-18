extension StringExt on String? {
  bool isEmpty() => (this ?? '').isEmpty;

  bool isNotEmpty() => (this ?? '').isNotEmpty;
}
