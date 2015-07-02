import java.io.*;
import java.util.*;

public class DistCnt{
	

	public static void main(String[] args) {
		Map<String, Integer> map = new HashMap<String, Integer>();

		try {
			File file = new File("pinatrace.out");
			FileReader fileReader = new FileReader(file);
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			StringBuffer stringBuffer = new StringBuffer();
			String line = new String();
			line = "0x7fd54a74e2d3: W 0x7fff7b4b1f18";
			while ((line = bufferedReader.readLine()) != null) {
				if (line.equals("#eof"))
					
				String[] addrs = line.split(": W ");
				String ip = addrs[0]; 
				String mem = addrs[2];
				if (map.containsKey(mem)) {
					Integer cnt = map.get(mem);
					map.put(mem, cnt + 1);
				}
				else
					map.put(mem, 1);
			}
			fileReader.close();
		}
		
		catch (IOException e) {
			e.printStackTrace();
		}
	}
}