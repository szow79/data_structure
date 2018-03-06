class Node:
  def __init__(self, val):
    self.val = val
    self.next = None
    self.prev = None

class Tree:
  def __init__(self):
    self.root = None

  def push(self, node):
    currentNode = self.root
    if currentNode is None:
      self.root = node
    else:
      while currentNode.next is not None:
        currentNode = currentNode.next
      currentNode.next = node
      node.prev = currentNode

  def pop(self):
    currentNode = self.root
    if currentNode:
      poppedNode = None
      if currentNode.next:
        while not currentNode.next.next is None:
          currentNode = currentNode.next
          poppedNode = currentNode.next
        currentNode.next = None
      else:
        poppedNode = self.root
        self.root = None
      return poppedNode

  def removeFirst(self):
    if self.root:
      if self.root.next:
        self.root = self.root.next
        self.root.prev = None
      else:
        self.root = None

def printTree(tree):
  node = tree.root
  arr = []
  while node is not None:
    arr.append(node.val)
    node = node.next
  print(arr)


n1 = Node(2)
n2 = Node(3)
n3 = Node(1)

t = Tree()

t.push(n1)
t.push(n2)
t.push(n3)

printTree(t)
t.pop()
printTree(t)
t.pop()
popped = t.pop()
print(popped)
print(popped.val)
printTree(t)

t.push(n1)
t.push(n2)
t.push(n3)

t.removeFirst()
printTree(t)



