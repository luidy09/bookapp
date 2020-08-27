String reverseNumber(String value) {
  String res = "";
  for (int i = value.length - 1; i >= 0; i--) {
    res += value[i];
  }
  return res;
}

String setDecimal(String decimal) {
  if (decimal.length == 1) {
    return decimal + "0";
  }

  if (decimal.length > 2) {
    return decimal[0] + decimal[1];
  }

  return decimal;
}

String formatNumber(double number) {
  String string = number.toString();
  String result = "";

  if (string == null) {
    throw ArgumentError("string:$string");
  }

  if (string.isEmpty) {
    return string;
  }

  var partes = string.split(".");

  if (partes[0].length > 3) {
    int count = 0;

    for (int i = partes[0].length - 1; i >= 0; i--) {
      if (count == 3) {
        result += " ";
        count = 0;
      }
      {
        count++;
        result += partes[0][i];
      }
    }

    String res = reverseNumber(result);

    return (res + "," + setDecimal(partes[1]) + " AOA");
  }

  return (partes[0] + "," + setDecimal(partes[1]) + " AOA");
}

bool isEmail(String email) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(email);
}
