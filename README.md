# 웹 보안 가상 키패드 (Virtual Secure Keypad)

![Java](https://img.shields.io/badge/Java-JSP-orange)  
![HTML](https://img.shields.io/badge/HTML5-blue)  
![CSS](https://img.shields.io/badge/CSS3-blueviolet)

---

## 🚀 프로젝트 개요

이 프로젝트는 **JSP** 기반의 웹페이지에서 입력값 탈취나 스니핑을 방지하기 위해 구현한 “가상 키패드” 컴포넌트입니다.  
사용자가 화면상의 키패드를 클릭하여 문자(알파벳·특수문자)를 입력하면, 키 배열이 매 입력마다 섞여 재배치되며 실제 입력값은 SHA-256 해시 함수로 암호화까지 가능합니다.  
이를 통해:

- 화면 캡처나 키로깅(Keylogging) 공격에 대비  
- 일관된 입력 흐름 대신 무작위 키 재배치를 통한 보안 강화  
- 입력값 해시화로 전송 시 평문 노출 방지  

를 학습·실습할 수 있습니다.
<br>
<img width="1158" height="401" alt="image" src="https://github.com/user-attachments/assets/c03472ce-eb80-426c-81af-9f25bc14689a" />

---

## 🛠️ 주요 기능

1. **무작위 키 배치**  
   - 알파벳 A–Z 및 특수문자(!@#$%…()) 36개 키를 페이지 로드/클릭 후마다 섞어서 표시  
2. **입력 마스킹**  
   - 입력 필드에는 마지막 입력 문자만 평문으로, 나머지는 ‘*’로 표시  
3. **삭제(Delete) 기능**  
   - 클릭 한 번으로 가장 최근 입력 문자 제거  
4. **완료(Complete) 버튼**  
   - 입력된 문자열을 **SHA-256** 해시로 변환하여 콘솔 또는 서버로 전송(예시: `hashInput()` 함수)  
5. **반응형 레이아웃**  
   - Flexbox 기반 중앙 정렬, 모바일·데스크톱에서 모두 사용 가능  



---
