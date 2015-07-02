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

				if (lines[i].equals("#eof"))
				break;

			if (lines[i].contains(": R ")) {
				String[] addrs = lines[i].split(": R ");
				String ip = addrs[0]; 
				String mem = addrs[1];

				if (addrMap.containsKey(mem)) {
					Integer cnt = addrMap.get(mem);
					addrMap.put(mem, cnt + 1);
				}
				else
					addrMap.put(mem, 1);
			}

			if (lines[i].contains(": W ")) {
				String[] addrs = lines[i].split(": W ");
				String ip = addrs[0]; 
				String mem = addrs[1];

				if (addrMap.containsKey(mem)) {
					Integer cnt = addrMap.get(mem);
					addrMap.put(mem, cnt + 1);
				}
				else
					addrMap.put(mem, 1);
			}
		}
			fileReader.close();
		}
		
		catch (IOException e) {
			e.printStackTrace();
		}
	}
}