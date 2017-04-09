def mergesort(a)
    # if the array size is 0|1 then the list is considered sorted, return sorted array
    return a if a.size <= 1
    # split the list into two halves
    left, right = split_array(a)
    # merge sort each half
    left = mergesort(left)
    right = mergesort(right)
    # combine the sorted halves
    return combine(left,right)
end

def split_array(a)
    midway = a.length/2
    return a[0...midway], a[midway..-1]
end

# precondition: a and b are sorted
def combine(a, b)
    # create a results array
    result = []
    # check that we have elements to compare (neither array can be empty)
    while !a.empty? && !b.empty?
        # push the smaller element onto the result array
        if a.first < b.first
          result << a.shift
        else
          result << b.shift
        end
    end
    # if there are elements left over in a, move them to result
    while !a.empty?
      result << a.shift
    end
    # if there are elements left over in b, move them to result
    while !b.empty?
      result << b.shift
    end
    # return the results array
    return result
end

# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
