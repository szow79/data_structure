class Node():
  def __init__(self, val):
    self.val = val
    self.left = None
    self.right = None

  def add(self, node):
    if self.val > node.val:
      if self.left:
        self.left.add(node)
      else:
        self.left = node
    else:
      if self.right:
        self.right.add(node)
      else:
        self.right = node

def TreeToList(node):
  if node is None:
    return []
  left = TreeToList(node.left)
  right = TreeToList(node.right)
  return left + [node.val] + right

n1 = Node(1)
n2 = Node(2)
n3 = Node(3)
n4 = Node(4)
n5 = Node(5)
n6 = Node(6)
n7 = Node(7)
n8 = Node(8)

n4.add(n1)
n4.add(n2)
n4.add(n3)
n4.add(n5)
n4.add(n6)
n4.add(n7)
n4.add(n8)
arr = TreeToList(n4)
print(arr)
