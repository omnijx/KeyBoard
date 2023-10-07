<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영어 키보드</title>
    <style>
        /* 전체 페이지 스타일링 */
        body {
            font-family: Arial, sans-serif;
  		    background-color: #e9e9e9;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        /* 키보드 스타일링 */
        #keyboard {
            display: flex;
            flex-wrap: wrap;
            background-color: #bab8b8;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
		
		.head {
			text-align: center;
		}
		
        .keyboard-key {
            width: 50px; 
            height: 50px;
            background-color: #f5f5f5;
            border: 1px solid #ccc;
            text-align: center;
            line-height: 40px;
            font-size: 18px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            margin: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.4);
            font-weight: 700;
        }

        .delete-key {
            background-color: #ff6666;
            color: white;
        }

        /* 입력 필드 스타일링 */
		#input-field {
		    width: 310px;
		    height: 40px;
		    font-size: 18px;
		    padding: 5px;
		    margin-top: 10px;
		    border: 2px solid #ccc;
		    border-radius: 5px;
		    margin-bottom: 15px;
		    margin-left: 25px;
		}

        /* 삭제 버튼 스타일링 */
		.delete-button {
		    width: 95px;
		    height: 50px;
		    background-color: #bab8b8;
		    color: white;
		    text-align: center;
		    line-height: 50px;
		    font-size: 16px;
		    cursor: pointer;
		    margin-top: 13px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    float: right;
		    margin-right: 20px;
		    font-weight: 600;
		}
		
		.sub {
		    width: 95px;
		    height: 50px;
		    border-radius: 5px;
		    cursor: pointer;
		    border: 1px solid #ccc;
		    color: white;
		    font-size: 15px;
		    background-color: #9b95b3;
		    font-weight: 600;
		    margin-left: 5px;
		}
    </style>
</head>
<body>
    <div id="keyboard-container">
        <h1 class="head">웹 보안 가상 키패드</h1>
        
        <!-- 입력 필드 -->
        <input type="text" id="input-field">
        
        <!-- 완료 버튼 -->
        <input type="button" class="sub" value="Complete" onclick="hashInput()"/>
        
        <!-- 삭제 버튼 -->
        <div class="delete-button">Delete</div>
        
        <div id="keyboard"></div>
    </div>
	

    <script>
        // 영어 알파벳 키 배열
        var alphabetKeys = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
        	'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')'];
		
        // 입력 필드(input값)를 가져오기
        var inputField = document.getElementById('input-field');
        
        // 입력한 값들을 저장하는 배열
        var inputValues = [];
		
        // 키보드를 섞는 함수
        function shuffleKeyboard() {
            var keyboard = document.getElementById('keyboard');
            var keys = alphabetKeys.slice(); // 키 값 복사
            var shuffledKeys = shuffleArray(keys); // 키를 무작위로 섞음

        // 배열을 무작위로 섞는 함수
        function shuffleArray(array) {
            var shuffledArray = array.slice();
            for (var i = shuffledArray.length - 1; i > 0; i--) {
                var j = Math.floor(Math.random() * (i + 1));
                var temp = shuffledArray[i];
                shuffledArray[i] = shuffledArray[j];
                shuffledArray[j] = temp;
            } 
            return shuffledArray;
        } 
            // 키를 키보드에 추가
            keyboard.innerHTML = ''; // 키보드 비우기
            var currentRow = document.createElement('div');
            currentRow.classList.add('keyboard-row');
            keyboard.appendChild(currentRow);

            shuffledKeys.forEach(function(key) {
                var keyElement = document.createElement('div');
                keyElement.classList.add('keyboard-key');
                keyElement.textContent = key;
                currentRow.appendChild(keyElement);

                // 행이 다 찼으면 다음 행으로 이동
                if (currentRow.childElementCount === 4) {
                    currentRow = document.createElement('div');
                    currentRow.classList.add('keyboard-row');
                    keyboard.appendChild(currentRow);
                }
            });
        }
        // 초기 키보드 섞기
        shuffleKeyboard();
        var inputString;
        // Delete 
        document.querySelector('.delete-button').addEventListener('click', () => {
            var currentValue = inputField.value;
            if (inputValues.length > 0) {
                inputValues.pop(); // 배열에서 마지막 값을 삭제
                currentValue = currentValue.slice(0, -1); // 마지막 문자 삭제
            }
            inputField.value = currentValue;
        });
        // 키보드를 클릭할 때 마다 값을 저장하고 웹브라우저에는 * 로 표시
        var keyboard = document.getElementById('keyboard');
        keyboard.addEventListener('click', function(event) {
            if (event.target.classList.contains('keyboard-key')) {
                var keyText = event.target.textContent;
                var currentValue = inputField.value;
                inputValues.push(keyText); // 배열에 사용자 버튼 입력값을 담음
		        inputString = inputValues.join(''); // 배열을 문자열로 변환해서  전송(구현예정)
                
                currentValue += keyText; // 클릭한 키 추가
                // 마지막 입력 값을 제외한 나머지를 *로 변환해서 화면에 표기
                inputField.value = currentValue.slice(0, -1).replace(/./g, '*')+currentValue.slice(-1);
                shuffleKeyboard(); // 입력 후 키보드를 섞음
            }
            alert("inputValues: "+inputValues);
            alert("inputString: "+inputString);
        });
        
        
        // 입력값을 암호화 하는 비동기 함수
        async function hashInput() {
            // 문자열로 바꿔둔 입력 값
			alert("입력값: "+inputString);

            // TextEncoder 객체를 생성하여 문자열을 바이너리 데이터로 변환
            const encoder = new TextEncoder();
            const data = encoder.encode(inputString);
			alert("data: "+data)
			
            // crypto.subtle.digest를 사용하여 SHA-256 해시 계산
            const hashBuffer = await crypto.subtle.digest('SHA-256', data);
			alert("buffer: "+hashBuffer);
			
            // 해시된 값을 배열로 변환
            const hashArray = Array.from(new Uint8Array(hashBuffer));
			alert("array: "+hashArray);
			
            // 바이트 배열을 16진수 문자열로 변환
            const hashHex = hashArray.map(byte => byte.toString(16).padStart(2, '0')).join('');
            
            // 최종 확인
            alert(hashHex);
        } 
    </script>
</body>
</html>
