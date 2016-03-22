# @param {Integer} x
# @return {Integer}
def reverse(x)
  result = 0
  if x >= 0
    result = x.to_s.reverse.to_i
  else
    result = "-#{x.to_s.reverse.chop}".to_i
  end	 
  result.between?(-2147483648, 2147483647) ? result : 0
end
