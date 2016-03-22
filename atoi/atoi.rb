# @param {String} str
# @return {Integer}
def my_atoi(str)
  result = str.to_i
  if result < -2147483648
    -2147483648
  elsif result > 2147483647
    2147483647
  else
    result
  end
end
