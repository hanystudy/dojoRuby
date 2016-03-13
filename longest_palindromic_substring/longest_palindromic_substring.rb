# @param {String} s
# @return {String}
def search(s, a, b)
  maxlength = 0
  maxindex = 0
  while(a>=0 && b<s.length)
    if s[a] == s[b]
      len = b - a + 1
      if len > maxlength
        maxlength = len
        maxindex = a
      end
    else
      break
    end
    a-=1
    b+=1
  end
  return maxlength, maxindex
end

def longest_palindrome(s)
  maxindex = 0
  maxlength = 0
  steps = 0..s.length - 1
  steps.each do |step|
    maxl, maxi = search(s, step, step + 2)
    if maxl > maxlength
      maxlength = maxl
      maxindex = maxi
    end
  end
  steps.each do |step|
    maxl, maxi = search(s, step, step + 1)
    if maxl > maxlength
      maxlength = maxl
      maxindex = maxi
    end
  end
  s[maxindex..maxindex + maxlength - 1]
end
