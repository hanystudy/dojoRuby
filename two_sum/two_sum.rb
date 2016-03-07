# nums: Array
# target: Integer
def two_sum(nums, target)
  query_hash = {}

  steps = 0..nums.length-1
  steps.each do |step|
    num = nums[step]
    query_hash[num] = [] if query_hash[num].nil?
    query_hash[num] << step
  end

  nums.each do |num|
    target_num = target - num
    if target_num == num
      return query_hash[num] if query_hash[target_num].count > 1
    elsif !query_hash[target_num].nil?
      return [query_hash[num].first, query_hash[target_num].first]
    end
  end
  []
end
