package com.kh.common;

import java.util.ArrayList;
import java.util.Random;

import org.springframework.stereotype.Component;

@Component("RandomVal")
public class RandomVal {
	public String getRandomStr() {		
		//Random rn = new Random();
		//int answer = rn.nextInt(10) + 1; //1~10까지 입력할때
		Random r = new Random();
		ArrayList<String> list = new ArrayList<String>();
		list.add("공기를 찾는 중인가요?");
		list.add("검색어 입력 안하면 전 아무것도 못해줍니다");
		list.add("캠핑 가기 싫으셔요?");
		list.add("검색어 입력 안하면 구글도 못찾아요");
		list.add("장난하지 말구 검색어 입력 좀");
		list.add("검색어가 없네요...ㅠㅠ");
		list.add("꿈도 희망도 내용도 없는 검색어...");
		int index = r.nextInt(list.size());		
		String result = list.get(index);
		return result;
	}
	public String getRandomStrInput() {		
		//Random rn = new Random();
		//int answer = rn.nextInt(10) + 1; //1~10까지 입력할때
		Random r = new Random();
		ArrayList<String> list = new ArrayList<String>();
		list.add("<input type='text' id='resultRandom' value='공기를 찾는 중인가요?'>");
		list.add("<input type='text' id='resultRandom' value='검색어 입력 안하면 전 아무것도 못해줍니다'>");
		list.add("<input type='text' id='resultRandom' value='검색어 입력 안하면 전 아무것도 못해줍니다'>");
		list.add("<input type='text' id='resultRandom' value='캠핑 가기 싫으셔요?'>");
		list.add("<input type='text' id='resultRandom' value='검색어 입력 안하면 구글도 못찾아요'>");
		list.add("<input type='text' id='resultRandom' value='장난하지 말구 검색어 입력 좀'>");
		list.add("<input type='text' id='resultRandom' value='검색어가 없네요...ㅠㅠ'>");
		list.add("<input type='text' id='resultRandom' value='꿈도 희망도 내용도 없는 검색어...'>");
		int index = r.nextInt(list.size());		
		String result = list.get(index);
		System.out.println("result="+result);
		return result;
	}
}
