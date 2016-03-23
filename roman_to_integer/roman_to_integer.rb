# @param {String} s
# @return {Integer}
def definition(input)
  {'I'=>1, 'V'=>5, 'X'=>10, 'L'=>50, 'C'=>100, 'D'=>500, 'M'=>1000}[input].to_i
end

def roman_to_int(s)
  result = 0
  prev = ''
  s.upcase.chars.each do |num|
    cur = definition(num)
    if (prev == 'I' && (num == 'V' || num == 'X') || prev == 'X' && (num == 'L' || num == 'C') || prev == 'C' && (num == 'D' || num == 'M'))
       result = result + cur - definition(prev)
       prev = ''
       next
    else
       result = result + definition(prev)
    end 
    prev = num
  end
  result = result + definition(prev)
  result
end
