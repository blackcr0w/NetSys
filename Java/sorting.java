import java.io.*;
import java.util.*;

/* first, read as Strings from the result.txt
 * second, split the Strings in key + value
 * convert the hexadecimal key into decimal key
 * third, store the key-value in a class: MapEntry
 * there should be a arraylist for this class
 * sort the array with decimal-key using the sorting API
 */
public class Sorting {

	public static long hex2decimal(String s) {
        String digits = "0123456789ABCDEF";
        s = s.toUpperCase();
        long val = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            int d = digits.indexOf(c);
            val = 16*val + d;
        }
        return val;
    }

    public static String keySplit(String key) {
    	String[] keys = key.split("0x");
    	return keys[1];
    }

	public static class MapEntry {
		String hexKey;
		int value;
		long decimalKey;

		public MapEntry(String key, int value) {
			key = keySplit(key);
			this.hexKey = key;
			this.value = value;
			decimalKey = hex2decimal(hexKey);
		}
	}

	static class MapEntryComp implements Comparator<MapEntry>{
	    @Override
	    public int compare(MapEntry e1, MapEntry e2) {
	        if(e1.decimalKey < e2.decimalKey) {
	            return 1;
	        } else {
	            return -1;
	        }
	    }
	}

	public static void main(String[] args) {
		ArrayList<MapEntry> list = new ArrayList<MapEntry>();
		try {
			File file = new File("result.txt");
			FileReader fileReader = new FileReader(file);
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			StringBuffer stringBuffer = new StringBuffer();
			String lines = new String();
			while ((lines = bufferedReader.readLine()) != null) {
				if (lines.equals("#eof"))
					break;
				else {
					String[] keyValue = lines.split("=");
					String key = keyValue[0];
					int value = Integer.parseInt(keyValue[1]);
					MapEntry entry = new MapEntry(key, value);
					list.add(entry);
				}
			}
		}
		catch (IOException e) {
			e.printStackTrace();
		}

		Collections.sort(list, new MapEntryComp());

		try {
			PrintWriter out = new PrintWriter(new FileWriter("sorted.txt"));
			Iterator<MapEntry> it = list.iterator();
			while(it.hasNext()) {
				MapEntry entry = (MapEntry)it.next();
				out.println(entry.decimalKey + entry.value);
			}
			out.close();
		}
		catch(IOException e1) {
		        System.out.println("Error during writing");
		}   

	}
	
}




