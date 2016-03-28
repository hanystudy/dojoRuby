# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end
#
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  list = head
  list_array = []
  while head != nil
    list_array << head
    head = head.next
  end
  if n == list_array.size
    return list.next
  else
    list_array[list_array.size - n - 1].next = list_array[list_array.size - n + 1]
    return list
  end
end
