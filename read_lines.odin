package Advent

import "core:os"
import "core:strings"
import "core:fmt"

read_file :: proc(file_path: string) -> (lines: []string) {
	file_line, read_success := os.read_entire_file_from_filename(file_path,context.allocator)
	if read_success!= true {
        fmt.print(file_line)
        return nil
	}
    parse_string := string(file_line)
    return strings.split_lines(parse_string)
}
