package day01;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class TaskOne {

	public static void main(String[] args) throws IOException {
		InputStream is = new FileInputStream("bin/day01/input");
		int ch;
		int level = 0;
		int count = 0;
		while ((ch = is.read()) != -1) {
			// System.out.print(ch);
			switch (ch) {
			case 40:
				level++;
				break;
			case 41:
				level--;
			}
			count++;
		}
		is.close();
		System.out.println();
		System.out.println(String.format("read %d bytes", count));
		System.out.println(String.format("now on level %d ", level));
	}

}
