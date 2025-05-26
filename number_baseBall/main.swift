//
//  main.swift
//  number_baseBall
//
//  Created by seongjun cho on 5/26/25.
//

import Foundation

func main() {
	var isEndProgram: Bool = false

	while isEndProgram == false {
		print("환영합니다! 원하시는 번호를 입력해주세요")
		print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
		guard let inputChoiceString = readLine() else {
			print("올바르지 않은 입력값입니다")
			continue
		}

		switch inputChoiceString {
		case "1":
			startGame()
		case "2":
			print("< 게임 기록 보기 >")
		case "3":
			isEndProgram = true
		default:
			print("올바르지 않은 입력값입니다")
			continue
		}
	}
}

func startGame() {
	var isEndGame: Bool = false
	var answerNum = {
		var result = Int.random(in: 1...9) * 100 + Int.random(in: 0...9) * 10 + Int.random(in: 0...9)
		while checkNumber(tryNum: result, tryString: String(result)) == false {
			result = Int.random(in: 1...9) * 100 + Int.random(in: 0...9) * 10 + Int.random(in: 0...9)
		}
		return result
	}()
	var answerString = String(answerNum)

	print("<게임을 시작합니다.>")
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

		if checkAnswer(answerString: answerString, tryString: inputNumberString) {
			isEndGame = true
		}
	}
}
func checkNumber(tryNum: Int, tryString: String) -> Bool{
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

extension String {
	func getChar(at index: Int) -> Character {
		return self[self.index(self.startIndex, offsetBy: index)]
	}
}

main()
