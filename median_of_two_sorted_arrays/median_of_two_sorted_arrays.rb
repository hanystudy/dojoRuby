# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def binary_search(nums, left, right, target)
  median = 0
  while ( left <= right )
    median = (left + right) / 2
    if nums[median] > target
      right = median - 1
    else
      median += 1
      left = median
    end
  end
  return median
end

def find_target(nums1, nums2, nums1_length, nums2_length, median_index)
  nums1_index = 0
  nums2_index = 0
  current_index = 0
  left1 = 0
  left2 = 0
  right1 = nums1_length - 1
  right2 = nums2_length - 1
  while (left1 <= right1)
    nums1_index = (left1 + right1) / 2
    nums2_index = binary_search(nums2, left2, right2, nums1[nums1_index])
    current_index = nums2_index + nums1_index
    break if current_index == median_index
    if current_index > median_index
      right1 = nums1_index - 1
      right2 = nums2_index > right2 ? right2 : nums2_index
    else
      left1 = nums1_index + 1
      left2 = nums2_index > right2 ? right2 : nums2_index
      nums2_index -= 1
    end
  end
  gap = median_index - current_index
  if gap == 0
    nums1[nums1_index].to_f
  else
    if left1 < right1
      nums1[nums1_index+gap].to_f
    else
      nums2[nums2_index+gap].to_f
    end
  end
end

def find_median_sorted_arrays(nums1, nums2)
  nums1_length = nums1.length
  nums2_length = nums2.length
  total_length = nums1_length + nums2_length
  test = total_length % 2
  if test == 1
    median_index = total_length / 2
    return nums2[median_index].to_f if nums1_length == 0
    return nums1[median_index].to_f if nums2_length == 0
    find_target(nums1, nums2, nums1_length, nums2_length, median_index)
  else
    median_a_index = total_length / 2
    median_b_index = median_a_index - 1
    return (nums2[median_a_index].to_f + nums2[median_b_index].to_f) / 2 if nums1_length == 0
    return (nums1[median_a_index].to_f + nums1[median_b_index].to_f) / 2 if nums2_length == 0
    median_a_index = find_target(nums1, nums2, nums1_length, nums2_length, median_a_index)
    median_b_index = find_target(nums1, nums2, nums1_length, nums2_length, median_b_index)
    (median_a_index + median_b_index) / 2
  end
end
