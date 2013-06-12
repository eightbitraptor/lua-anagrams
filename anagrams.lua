require "table2"
require "utilities"

function explode(str)
  local string_table = {}
  for char in string.gfind(str, "%l") do
    table.insert(string_table, char)
  end

  return string_table
end

function order_string(str)
  local exploded_string = explode(str)
  table.sort(exploded_string)

  return table.concat(exploded_string, "")
end

function build_anagrams_dictionary()
  local sorted_dictionary = {}

  for word in io.lines("/usr/share/dict/words", "r") do
    local ordered_str = order_string(word:lower())
    local word_list = sorted_dictionary[ordered_str]

    if word_list then
      table.insert(word_list, word)
    else
      word_list = {}
      table.insert(word_list, word)
    end

    sorted_dictionary[ordered_str] = word_list
  end

  return sorted_dictionary
end

function lookup_anagrams(word)
  local dict = build_anagrams_dictionary()

  return table.concat(dict[order_string(word)], ", ")
end


io.write("Please enter a word to lookup:")
test_word = io.read("*line")

print(lookup_anagrams(test_word))

