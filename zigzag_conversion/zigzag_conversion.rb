# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if num_rows <= 1
  nN = s.length
  max_top_corner = (nN - 1) / (2 * (num_rows - 1))
  max_bottom_corner = ((nN - 1) / (num_rows - 1) - 1) / 2
  result = ''
  start_index = 0
  end_index = 0
  indexes = []
  (0..num_rows - 1).each do |step|
    if step == 0
      (0..max_top_corner).each do |x|
        index = 2 * x * (num_rows - 1)
        result << s[index]
        indexes << index
      end
    elsif step == num_rows - 1
      (0..max_bottom_corner).each do |x|
        index = (2 * x + 1) * (num_rows - 1)
        result << s[index]
        indexes << index
      end
    elsif step == 1
      plus = true
      (start_index..end_index-1).each do |x|
        if x == start_index
          index = indexes[x] + 1
          unless s[index].nil?
            result << s[index]
            indexes << index
            plus = true
          end
        else
          index = indexes[x] - 1
          unless s[index].nil?
            result << s[index]
            indexes << index
            plus = false
          end
          index = indexes[x] + 1
          unless s[index].nil?
            result << s[index]
            indexes << index
            plus = true
          end
        end
      end
      if plus
        last_index = indexes.last + 2 * (num_rows - 1 - step)
        unless s[last_index].nil?
          result << s[last_index]
          indexes << last_index
        end
      else
        last_index = indexes.last + 2 * step
        unless s[last_index].nil?
          result << s[last_index]
          indexes << last_index
        end
      end
    else
      plus = true
      (start_index..end_index-1).each do |x|
        if plus
          index = indexes[x] + 1
          unless s[index].nil?
            result << s[index]
            indexes << index
            plus = !plus
          end
        else
          index = indexes[x] - 1
          unless s[index].nil?
            result << s[index]
            indexes << index
            plus = !plus
          end
        end
      end
      if !plus
        last_index = indexes.last + 2 * (num_rows - 1 - step)
        unless s[last_index].nil?
          result << s[last_index]
          indexes << last_index
        end
      else
        last_index = indexes.last + 2 * step
        unless s[last_index].nil?
          result << s[last_index]
          indexes << last_index
        end
      end
    end
    start_index = end_index
    end_index = result.length
  end
  result
end
