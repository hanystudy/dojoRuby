# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  ordered_strs = strs.sort_by {|str| str.size}
  test = ordered_strs[0]
  steps = 0..test.length-1
  result = ''
  steps.to_a.reverse.each do |step|
    target = test[0..step]
    if ordered_strs.all? {|str, index| str.start_with?(target)}
      result = target
      break
    end
  end  
  result
end
