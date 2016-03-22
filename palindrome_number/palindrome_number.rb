# @param {Integer} x
# @return {Boolean}
def recursive_compare(x, y, i)
  y = y / i
  return i if y == 0
  i = recursive_compare(x, y, 10)
  if i != -1
    if y % 10 == (x % i / (i / 10))
      return i * 10
    else
      return -1
    end
  else
    return -1
  end
end

def is_palindrome(x)
  return false if x < 0
  recursive_compare(x, x, 10) != -1
end
