package com.example.auction.util;

public class CutString {
	public String strCutBytes(String str, int length, int sizePerLetter) {
		
		int returnLength = 0;
		int tempSize = 0;
		int asc = 0;
		
		if( str == null || str.equals("") || str.equals("null") ) {
			str = "";
			
		} else {
			str = str.replaceAll("(&nbsp|\n|\r|\t)", " ");
			str = str.replaceAll("&amp;", "&");
			
			for (int i = 0; i < str.length(); i++) {
				asc = (int) str.charAt(i);
				
				if( asc > 127 ) {
					
					if( length >= tempSize + sizePerLetter ) {
						tempSize += sizePerLetter;
						returnLength++;
					} else {
						return str.substring(0, returnLength) + "...";
					}
				} else {
					if( length > tempSize ) {
						tempSize++;
						returnLength++;
					}
				}
			} 
		}
		
		return str.substring(0, returnLength);
	}
}
