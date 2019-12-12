package fproject.app.fproject.Util;

import java.util.Random;

public class RandomString {
	public String create(int length) {
		String charPool = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghigklmnopqrstuvwxyz0123456789!@#$%+-^&*()[]";
		char[] randomStringArray = new char[length];
		Random rnd = new Random();
		for(int i=0; i<length; i++) {
			randomStringArray[i] = charPool.charAt(rnd.nextInt(charPool.length()-1));
		}
		return new String(randomStringArray, 0, randomStringArray.length);
	}
}
 