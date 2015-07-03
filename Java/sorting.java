import java.io.*;
import java.util.*;

/* first, read as Strings from the result.txt
 * second, split the Strings in key + value
 * convert the hexadecimal key into decimal key
 * third, store the key-value in a class: MapEntry
 * there should be a array for this class
 * sort the array with decimal-key using the sorting API
 */
public class Sorting {

	public static int hex2decimal(String s) {
        String digits = "0123456789ABCDEF";
        s = s.toUpperCase();
        int val = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            int d = digits.indexOf(c);
            val = 16*val + d;
        }
        return val;
    }

	public class MapEntry {
		String hexKey;
		int value;
		int decimalKey;

		public MapEntry(key, value) {
			this.hexKey = key;
			this.value = value;
			decimalKey = hex2decimal(hexKey);
		}

	}
	public static void main(String[] args) {


	}
	
}