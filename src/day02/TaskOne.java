package day02;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;

public class TaskOne {

	public static void main(String[] args) throws Exception {
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				new FileInputStream("bin/day02/input")));

		int count = 0;
		int sum = 0;
		String line;
		while ((line = reader.readLine()) != null) {
			count++;
			if (0 == line.length()) {
				continue;
			}
			String dim[] = line.split("x");
			if (null==dim) {
				throw new RuntimeException("no dimension");
			}
			if (3!=dim.length) {
				throw new RuntimeException("missing dimension "+dim.length);
			}
			
			int len = Integer.parseInt(dim[0]);
			int wid = Integer.parseInt(dim[1]);
			int hei = Integer.parseInt(dim[2]);
			
			int side1 = len*wid;
			int side2 = wid*hei;
			int side3 = hei*len;
			
			int wrap = 2*(side1 + side2 + side3);
			int extra = Math.min(side1, Math.min(side2, side3));
			
			System.out.println(line + " : " + wrap + " + " + extra);
			sum += wrap;
			sum += extra;
		}
		reader.close();
		System.out.println(String.format("sums up to %d.", sum));
		System.out.println(String.format("%d lines read.", count));
	}

}
