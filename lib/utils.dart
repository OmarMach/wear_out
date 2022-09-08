import 'package:flutter/material.dart';

const verticalSeparator = SizedBox(height: 15);
const horizontalSeparator = SizedBox(width: 15);
const smallVerticalSeparator = SizedBox(height: 5);
const smallHorizontalSeparator = SizedBox(width: 5);

List<TextSpan> queryTextBold(String word, String query, TextStyle currentTextstyle) {
  // Checking if the query == word to return the whole string in bold.

  if (query.toLowerCase() == word.toLowerCase()) {
    return [
      TextSpan(
        text: word,
        style: currentTextstyle.copyWith(fontWeight: FontWeight.bold),
      )
    ];
  }

// Splitting the word and preparing textspan list.
  final List<String> splittedText = word.toLowerCase().split(query);
  final List<TextSpan> textSpans = [];

  // split() results returned only 1 result which means that the string provided doesnt contain the query string.
  if (splittedText.length == 1) {
    return [
      TextSpan(
        text: word,
        style: currentTextstyle,
      ),
    ];
  }

  for (int i = 0; i < splittedText.length; i++) {
    // adding Textspans for each string from the split()
    textSpans.add(
      TextSpan(
        text: splittedText[i],
        style: currentTextstyle,
      ),
    );
    // Adding the query text after each split() element except for the last element.
    if (i < splittedText.length - 1) {
      textSpans.add(
        TextSpan(
          text: query,
          style: currentTextstyle.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );
    }
  }

  return textSpans;
}
