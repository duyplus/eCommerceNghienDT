package test;

import java.util.HashSet;
import java.util.Set;

public class ClassMainMaven {

	public static void main(String[] args) {
		Set<Integer> st = new HashSet<Integer>();
		st.add(1);
		st.add(2);
		st.add(5);
		st.add(2);
		
		for (Integer item : st) {
			System.out.println("Set: " + item);
		}
	}

}
