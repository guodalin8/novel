package org.common;

import java.util.regex.Pattern;



/**
 * @author dalin
 *
 */
public class DataValidator {
	/**
	 * 
	 * @param input
	 * @return
	 */
	public static boolean isNullOrEmpty(String input){
		return "".equals(input)||input==null;
	}
	/**
	 * 
	 * @param input
	 * @param pattern
	 * @return
	 */
	public static boolean regexMatch(String input,String pattern){
		if(isNullOrEmpty(input)){
			return false;
		}
		return Pattern.compile(pattern).matcher(input).matches();
	}
	
}
