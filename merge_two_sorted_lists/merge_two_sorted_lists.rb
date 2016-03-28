# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end
#
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  head = nil
  rear = nil
  cur = nil
  while l1 != nil && l2 != nil
    if l1.val <= l2.val
      cur = l1
      l1 = l1.next
    else
      cur = l2
      l2 = l2.next
    end
    if head.nil?
      head = cur
      rear = head
    else
      rear.next = cur
      rear = cur
    end
  end
  if l1 != nil
    if rear.nil? 
      head = l1
    else
      rear.next = l1
    end
  else
    if rear.nil?
      head = l2
    else
      rear.next = l2
    end
  end
  head
end
