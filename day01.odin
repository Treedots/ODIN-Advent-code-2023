package Advent

import "core:fmt"
import "core:strings"
import "core:unicode"
import "core:testing"

replace :: struct {
	old_string: string,
	new_string: string,
}

main_day01 :: proc() {
    // Part 01
    result := day01_part01("inputs/day01.txt")
    fmt.print("Day01 Part 01: ",result,"\n")
	// Part 02
    result_02 := day01_part02("inputs/day01.txt")
    fmt.print("Day01 Part 02: ",result_02,"\n")
}

@(test)
day01_testing :: proc(t: ^testing.T) {
    result := day01_part01("test/day01.txt")
    fmt.print("Part 01: ",result,"\n")
    testing.expect_value(t, result, 142)
    result_02 := day01_part02("test/day01-part02.txt")
    fmt.print("Part 02: ",result_02,"\n")
    testing.expect_value(t,result_02, 281)
}

day01_part01 :: proc(file_name: string) -> int {
	fmt.print("Day01\n")
	file := read_file(file_name)
	total: int = 0
	for i in file {
		if i == "" {
			break
		}
		first: rune
		last: rune
		for j in i {
			if unicode.is_digit(j) {
				if first == 0 {
					first = j
					last = j
				}
				last = j
			}
		}
		pretotal := (int(first) - 48) * 10 + int(last) - 48
		total += pretotal

	}
	return total
}

day01_part02 :: proc(file_name: string) -> int {
    file := read_file(file_name)
	replace_array := [9]replace {
		replace{"one", "one1one"},
		replace{"two", "two2two"},
		replace{"three", "three3three"},
		replace{"four", "four4four"},
		replace{"five", "five5five"},
		replace{"six", "six6six"},
		replace{"seven", "seven7seven"},
		replace{"eight", "eight8eight"},
		replace{"nine", "nine9nine"},
	}
	total := 0
	for i in file {
		if i == "" {
			break
		}
		first: rune
		last: rune
		current := i
		for r in replace_array {
			rt, sucess := strings.replace_all(current, r.old_string, r.new_string)
			if sucess {
				current = rt
			}
		}
		for j in current {
			if unicode.is_digit(j) {
				if first == 0 {
					first = j
					last = j
				}
				last = j
			}
		}
		pretotal := (int(first) - 48) * 10 + int(last) - 48
		total += pretotal

	}
    return total
}
