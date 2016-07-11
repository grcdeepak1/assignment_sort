#Insertion sort
#Maintain cursor for unsorted portion and keep moving it.
#Iterate nodes and insert node from the beginning in sorted order
require 'pry'
def insertion_sort(array)
  (0..(array.size-2)).each do |i|
    insert(array, i , array[i+1])
  end
  array
end

def insert(array, right_index, value)
    # value is the value of array[right_index + 1]
    # right_index is the furthest right sorted element

    # Step through sorted elements right to left.
    # As long as your value is less than the element
    # at array[i] and you still have elements
    i = right_index
    while(i >= 0 && array[i] > value)
        # copy the element
        array[i+1] = array[i]
        i -= 1
    end

    # insert the actual element
    array[i+1] = value;
end
# p insertion_sort( [1,3,7,2,5] )
# p insertion_sort( [7,2,5,3,1] )

def bubble_sort(array)

  (0..array.size-1).each do |i|
    (i..(array.size-1)).each do |j|
      if array[i] > array[j]
        temp = array[i]
        array[i] = array[j]
        array[j] = temp
      end
    end
  end
  array
end
# p bubble_sort( [1,3,7,2,5] )
# p bubble_sort( [7,2,5,3,1] )


def merge_sort(array)
  return array if array.size == 1
  left_array,right_array = array.each_slice( (array.size/2.0).round ).to_a
  arr1 = merge_sort(left_array)
  arr2 = merge_sort(right_array)
  arr  = merge(arr1, arr2)
  arr
end

def merge(arr1, arr2)
  arr = []
  loop do
    arr1[0] < arr2[0] ? arr << arr1.shift : arr << arr2.shift
    break if arr1.empty? || arr2.empty?
  end
  arr1.empty? ? arr << arr2 : arr << arr1
  arr.flatten
end
# p merge_sort( [1,3,7,2,5] )
# p merge_sort( [7,2,5,3,1] )
