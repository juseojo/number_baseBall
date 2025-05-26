//
//  GameObject.swift
//  number_baseBall
//
//  Created by seongjun cho on 5/26/25.
//

class GameObject {
	var gameHistory: [Int] = []
	let numberBaseBallGame = NumberBaseBallGame()

	func run() {
		var isEndProgram = false

		while isEndProgram == false {
			print("환영합니다! 원하시는 번호를 입력해주세요")
			print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
			guard let inputChoiceString = readLine() else {
				print("올바른 숫자를 입력해주세요!")
				continue
			}

			switch inputChoiceString {
			case "1":
				let result = numberBaseBallGame.start() // return tryCount
				gameHistory.append(result)
			case "2":
				printHisoty()
			case "3":
				isEndProgram = true
			default:
				print("올바르지 않은 입력값입니다")
				continue
			}
		}
	}

	func printHisoty() {
		print("< 게임 기록 보기 >")

		if gameHistory.isEmpty {
			print("기록이 없습니다")
		} else {
			for i in 0..<gameHistory.count {
				print("\(i + 1)번째 게임 : 시도 횟수 - \(gameHistory[i])")
			}
		}
	}
}
