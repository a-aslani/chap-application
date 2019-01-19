bool isEmpty(String value) {
  value = value.trim();
  if(value.isEmpty) {
    return true;
  }

  return false;
}

bool isNumeric(String s) {
  s = s.trim();

  if (s == null) {
    return false;
  }

  try {
    return double.parse(s) != null;
  } catch (e) {
    return false;
  }
}

bool minLength(String value, int min) {
  value = value.trim();

  if(value.length < min) {
    return false;
  }

  return true;
}

bool maxLength(String value, int max) {
  value = value.trim();

  if(value.length > max) {
    return false;
  }

  return true;
}

bool startedWith(String value, String checked) {
  value = value.trim();

  if(value.startsWith(checked)) {
    return true;
  }

  return false;
}