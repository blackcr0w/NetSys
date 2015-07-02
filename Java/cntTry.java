import java.io.*;
import java.util.*;

public class cntTry {
	public static void main(String[] args) {
		Map<String, Integer> addrMap = new HashMap<String, Integer>();
		// addrMap.put("wocoa", 1);
		// addrMap.put("nima", 1);
		// System.out.println(addrMap);
		// String[] lines = {"0x7fd53731b292: R 0x7fff7b4b1d10", "0x7fd5372db216: W 0x7fff7b4b1d18", }
		// String line1 = "0x7fd53731b292: R 0x7fff7b4b1d10";
		// String line2 
		String[] lines = new String[10];
		lines[0] = "0x7fd53731b292: R 0x7fff7b4b1d10";
		lines[1] = "0x7fd5372db216: W 0x7fff7b4b1d18";
		lines[2] = "0x402380: R 0x6167b0";
		lines[3] = "#eof";
		for (int i = 0; lines[i] != null; i += 1) {
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
		
		System.out.println(addrMap);
	}
}