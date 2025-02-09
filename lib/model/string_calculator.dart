class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    if (numbers.startsWith('//')) {
      final delimiterEnd = numbers.indexOf('\n');
      delimiter = numbers.substring(2, delimiterEnd);
      numbers = numbers.substring(delimiterEnd + 1);
    }

    numbers = numbers.replaceAll('\n', delimiter);
    List<int> parsedNumbers = numbers
        .split(delimiter)
        .map(int.parse)
        .where((n) => n <= 1000)
        .toList();

    List<int> negatives = parsedNumbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("negative numbers not allowed: ${negatives.join(', ')}");
    }

    return parsedNumbers.fold(0, (sum, num) => sum + num);
  }
}