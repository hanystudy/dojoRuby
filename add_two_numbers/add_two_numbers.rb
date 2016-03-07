# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initializer(val)
#     @val = val
#     @next = nil
#   end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  prev = nil
  head = nil
  carry = 0
  l1_val = 0
  l2_val = 0
  while !(l1.nil? && l2.nil? && carry == 0)
    node = ListNode.new(0)
    if l1.nil?
      l1_val = 0
    else
      l1_val = l1.val
      l1 = l1.next
    end
    if l2.nil?
      l2_val = 0
    else
      l2_val = l2.val
      l2 = l2.next
    end
    sum = l1_val + l2_val + carry
    node.val = sum % 10
    if prev.nil?
      prev = node
      head = prev
    else
      prev.next = node
    end
    prev = node
    carry = sum >= 10 ? 1 : 0
  end
  head
end
