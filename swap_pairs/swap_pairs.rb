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
# @return {ListNode}
def swap_pairs(head)
  cur_node = head
  return head if cur_node.nil?
  next_node = head.next
  prev_node = nil
  mid = nil
  while !next_node.nil?
    mid = next_node.next
    next_node.next = cur_node
    head = next_node if cur_node == head
    cur_node.next = mid
    prev_node.next = next_node if !prev_node.nil?
    prev_node = cur_node
    cur_node = mid
    if cur_node.nil?
      return head
    else
      next_node = cur_node.next
    end
  end
  head
end
