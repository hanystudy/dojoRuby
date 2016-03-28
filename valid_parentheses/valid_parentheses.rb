# @param {String} s
# @return {Boolean}
def is_valid(s)
  open_status = {
    '(' => '(',
    '[' => '[',
    '{' => '{'
  }
  close_status = {
    ')' => '(',
    ']' => '[',
    '}' => '{'
  }
  current_states = []
  s.chars.each do |char|
    if open_status[char]
      current_states << char
    elsif close_status[char] && close_status[char] != current_states.pop
      return false
    end
  end
  return current_states.size == 0
end
