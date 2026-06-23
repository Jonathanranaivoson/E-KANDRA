package utils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.regex.Pattern;

public class ValidationUtils {

	private static final Pattern EMAIL = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", Pattern.CASE_INSENSITIVE); // [text]@text.text

	public static boolean isNotEmpty(String s) {
		return s != null && !s.trim().isEmpty();    // s not null
	}

	public static boolean isEmailValid(String email) {
		return email != null && EMAIL.matcher(email).matches();
	}

	public static boolean isDateValid(String date, String pattern) {
		if (date == null || pattern == null) return false;
		try {
			DateTimeFormatter fmt = DateTimeFormatter.ofPattern(pattern);
			LocalDate.parse(date, fmt);
			return true;
		} catch (DateTimeParseException ex) {
			return false;
		}
	}
}
