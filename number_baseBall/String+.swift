//
//  String+.swift
//  number_baseBall
//
//  Created by seongjun cho on 5/26/25.
//

extension String {
	func getChar(at index: Int) -> Character {
		return self[self.index(self.startIndex, offsetBy: index)]
	}
}
