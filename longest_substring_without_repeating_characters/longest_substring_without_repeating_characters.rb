# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  maxlen = 0
  maxindex = 0
  steps = 0..s.length-1
  query_hash = {}
  current_length = 0
  lastindex = 0
  steps.each do |step|
    char = s[step]
    if query_hash[char].nil?
      current_length += 1
    else
      if lastindex <= query_hash[char]
        current_length = step - query_hash[char]
        lastindex = query_hash[char] + 1
      else
        current_length += 1
      end
    end
    query_hash[char] = step
    if current_length > maxlen
      maxlen = current_length
      maxindex = step - current_length + 1
    end
  end
  maxlen
end
