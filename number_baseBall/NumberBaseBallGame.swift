//
//  NumberBaseBallGame.swift
//  number_baseBall
//
//  Created by seongjun cho on 5/26/25.
//

class NumberBaseBallGame: GameProtocol {

	func start() -> Int {
		print("<게임을 시작합니다.>")
		var isEndGame = false
		var tryCount = 0
		let answerString = generateAnswerString()

		while isEndGame == false {
			print("숫자를 입력하세요")
			guard let inputNumberString = readLine(), let inputNumber = Int(inputNumberString) else {
				print("올바르지 않은 입력값입니다")
				continue
			}

			guard checkNumber(tryNum: inputNumber, tryString: inputNumberString) else {
				print("올바르지 않은 입력값입니다")
				continue
			}

			tryCount += 1
			if checkAnswer(answerString: answerString , tryString: inputNumberString) {
				isEndGame = true
				return tryCount
			}
		}
	}


	func generateAnswerString() -> String {
		var result = Int.random(in: 1...9) * 100 + Int.random(in: 0...9) * 10 + Int.random(in: 0...9)
		while checkNumber(tryNum: result, tryString: String(result)) == false {
			result = Int.random(in: 1...9) * 100 + Int.random(in: 0...9) * 10 + Int.random(in: 0...9)
		}

		return String(result)
	}

	func checkNumber(tryNum: Int, tryString: String) -> Bool {
		// 자리수 확인
		if tryNum > 999  || tryNum < 100{
			return false
		}

		// 중복확인
		var count = 0
		for i in tryString {
			for j in tryString {
				if i == j {
					count += 1
				}
			}

			if count > 1 {
				return false
			} else {
				count = 0
			}
		}

		return true
	}

	func checkAnswer(answerString: String, tryString: String) -> Bool {
		var strikeCount = 0
		var ballCount = 0
		var count = 0

		if answerString == tryString {
			print("정답입니다!")

			return true
		}

		// 같은 위치에 같은 요소면 스트라이크, 같은 위치 아닌데 같은 요소면 볼
		for c in tryString {
			for i in 0..<answerString.count {
				if answerString.getChar(at: i) == c {
					if count == i {
						strikeCount += 1
					} else {
						ballCount += 1
					}
				}
			}

			count += 1
		}

		print("\(strikeCount)스트라이크 \(ballCount)볼")

		return false
	}
}
