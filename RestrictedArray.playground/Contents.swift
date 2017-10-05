import Foundation

// special value indicates that the index is empty
let specialValue = 9999

class RestrictedArray {
    // no size argument passed, assume 20
    var size: Int
    var internalArray: [Int]?
    
    init() {
        size = Int(arc4random_uniform(20))
        internalArray = []
        for _ in 0 ..< size {
            internalArray!.append(Int(arc4random_uniform(200)))
        }
    }
    
    init?(_ size: Int) {
        self.size = size
        self.internalArray =  Array(repeating: specialValue, count: size)
    }
    
    subscript(index: Int) -> Int? {
        get {
            if index >= 0 && index < self.size {
                return internalArray![index]
            } else {
                return nil
            }
        }
        
        set(newValue) {
            if index >= 0 && index < self.size {
                if let newValue = newValue {
                    internalArray![index] = newValue
                }
            }
        }
    }
    
    // Calculates the length of the restricted integer array_size
    func length() -> Int {
        var i = 0
        for _ in internalArray! {
            i += 1
        }
        return i
    }
    
    // Prints each integer values in the array
    func printArray() {
        var stringPrint = ""
        var i = 0
        for value in internalArray! {
            i += 1
            stringPrint.append("\(value)")
            i == size ? stringPrint.append(("")) : stringPrint.append(", ")
        }
        print(stringPrint)
    }
    
    // Reverses the values in the integer array
    func reverse() {
        if size < 2 {
            return
        }
        
        var i = 0
        var j = size - 1
        
        while i < j {
            let temp = internalArray![i]
            internalArray![i] = internalArray![j]
            internalArray![j] = temp
            i += 1
            j -= 1
        }
    }
    
    // For an unsorted array, searches for 'value_to_find'.
    // Returns true if found, false otherwise.
    func search(_ valueToFind: Int) -> Bool {
        var i = 0
        while i < size {
            if internalArray![i] == valueToFind {
                return true
            }
            i += 1
        }
        return false
    }
    
    
    // Sorts the array in ascending order.
    func sort() -> [Int] {
        if size < 2 {
            return internalArray!
        }
        
        for i in 0 ..< (size - 1) {
            var min_index = i
            var j = i + 1
            for _ in 0 ..< (size - j) {
                if internalArray![j] < internalArray![min_index] {
                    min_index = j
                }
                j += 1
            }
            let temp = internalArray![i]
            internalArray![i] = internalArray![min_index]
            internalArray![min_index] = temp
        }
        return internalArray!
    }
    
    // Restricted arrays cannot be resized. So, we follow a convention.
    // Convention: change the value to be deleted with 'SPECIAL_VALUE'
    // Deletes 'value_to_delete' if found in the array. To keep the array size
    // constant, adds an element with 'SPECIAL_VALUE' in the end. Assumes the array
    // to be sorted in ascending order.
    func delete(_ valueToDelete: Int) {
        sort()
        var i = 0
        while i < size {
            if internalArray![i] == valueToDelete {
                internalArray![i] = specialValue
            }
            i += 1
        }
    }
    
    // Restricted array cannot be resized. So, we workaround by having a convention
    // Convention: replace all values with 'SPECIAL_VALUE'
    // Empties the restricted array by making all values = specialValue
    func empty() {
        var i = 0
        while i < size {
            internalArray![i] = specialValue
            i += 1
        }
    }
    
    
    // Finds and returns the largest value element in the array which is not 'SPECIAL_VALUE'
    // Assumes that the array is not sorted.
    func findLargest() -> Int {
        var i = 0
        var max = 0
        while i < size {
            if max < internalArray![i] && internalArray![i] != specialValue {
                max = internalArray![i] }
            i += 1
        }
        return max
    }
    
    // Insert value to insert at the correct index into the array assuming the array
    // is sorted in ascending manner.
    // Restricted arrays cannot be resized. Insert only if there is space in the array.
    // (Hint: if there are elements with 'SPECIAL_VALUE', there is no room to insert)
    // All subsequent elements will need to be moved forward by one index.
    func insertAscending(_ valueToFind: Int) -> [Int] {
        if size == 0 || internalArray![size - 1] != specialValue {
            return internalArray!
        } else {
            sort()
            var i = 0
            while  internalArray![i] != specialValue {
                i += 1
            }
            internalArray![i] = valueToFind
            return internalArray!
        }
    }
}

// --- END OF METHODS ---

// A restricted array could be constructed of a given size like so
let size = 5
var myIntegerArray = RestrictedArray(size)

var myIntegerArrayLength = myIntegerArray!.length()
myIntegerArrayLength == size ? print("The length of my integer array is \(myIntegerArrayLength), which should be the same as \(size).") : print("BUG!")

// A restricted array could be constructed of a random size (1 to 20) like so
var anotherArray = RestrictedArray()
var anotherArraylength = anotherArray.length()
print("The length of my random length integer array is \(anotherArraylength).")


// print the current array
print("Printing values in the array: ")
anotherArray.printArray()

// reverse the values in the current array
anotherArray.reverse()

// prints the reversed array
print("Reversed array: ")
anotherArray.printArray()

// search for value_to_find in the array
let valueToFind = 120
anotherArray.search(valueToFind) ? print("\(valueToFind) found in the array!") : print("\(valueToFind) not found in the array!")

// search for value_to_find in the array - find the last value
let anotherValueToFind = anotherArray[anotherArraylength - 1]
anotherArray.search(anotherValueToFind!) ? print("\(anotherValueToFind!) found in the array!") : print("\(anotherValueToFind!) found in the array!: BUG! \(anotherValueToFind!) should be at index ")


// print the largest value in the array
var largest = anotherArray.findLargest()
print("The largest value in the array is \(largest)")


// sort the array
anotherArray.sort()
print("Array sorted in ascending order: ")
anotherArray.printArray()

// delete the first entry with the value_to_delete
var valueToDelete = anotherArray[anotherArraylength/2]
anotherArray.delete(valueToDelete!)
print("\(valueToDelete!) deleted from array: ")
anotherArray.printArray()


// delete the first entry with the value_to_delete
valueToDelete = anotherArray[anotherArraylength/2]
anotherArray.delete(valueToDelete!)
print("\(valueToDelete!) deleted from array: ")
anotherArray.printArray()

// print the largest value in the array
largest = anotherArray.findLargest()
print("The largest value in the array is \(largest)")

// sort the array
anotherArray.sort()
print("Array sorted in ascending order: ")
anotherArray.printArray()

// insert 123 in to the array sorted in ascending order
var valueToInsert = 123
anotherArray.insertAscending(valueToInsert)
print("\(valueToInsert) inserted into the array: ")
anotherArray.printArray()

// empty array
anotherArray.empty()
print("Emptied array looks like: ")
anotherArray.printArray()

// insert 123 in to the array sorted in ascending order
valueToInsert = 123
anotherArray.insertAscending(valueToInsert)
print("\(valueToInsert) inserted into the array: ")
anotherArray.printArray()
