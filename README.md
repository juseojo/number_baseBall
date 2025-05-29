## 숫자야구게임

---

크게 구분하여 class GameObject, NumberBaseBallGame으로 구성하였다. 

GameObject를 GameProtocol에 의존하고 생성자로 해당 객체를 받게하였고,

NumberBaseBallGame이 GameProtocol을 따르게하여 의존성 주입을 구현하였다.

GameObject에서 게임시작, 기록 보기, 종료하기로 입력을 받게끔 했고,

게임시작 입력시 NumberBaseBallGame에서 게임을 진행하도록 구현하였다.

NumberBaseBallGame에서 게임 종료시 게임 결과인 시도 횟수 tryCount를 리턴하게 구현하여,

이를 GameObject의 gameHistory 정수 배열 변수에 추가하여 기록을 남기도록 했다.
