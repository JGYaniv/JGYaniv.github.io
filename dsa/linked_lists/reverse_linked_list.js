class LinkedListNode {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}


// recursive function to solve problem using a stack
function reverseLinks(node){
    // base case is that the next node is null, return node
    if (!node || !node.next) return node;

    // iterative step for returning the next node
    let returnedNode = reverseLinks(node.next)

    // set current node.next to equal returnedNode.next
    node.next = returnedNode.next

    // set returnedNode.next to equal node
    returnedNode.next = node;

    return node;
}


// test cases

let l5 = new LinkedListNode("l5")

let l4 = new LinkedListNode("l4")
l4.next = l5

let l3 = new LinkedListNode("l3")
l3.next = l4

let l2 = new LinkedListNode("l2")
l2.next = l3

let l1 = new LinkedListNode("l1")
l1.next = l2

console.log(l1, l2, l3, l4, l5)
console.log('\n\nreversing....\n\n')
reverseLinks(l1)
console.log(l1, l2, l3, l4, l5)