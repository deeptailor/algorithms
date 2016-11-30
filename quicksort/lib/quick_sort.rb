class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.empty?

    pivot = array.first

    left = array.select{|e| pivot > e}
    middle = array.select{|e| pivot == e}
    right = array.select{|e| pivot < e}

    sort1(left) + middle + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc = Proc.new{|a,b| a <=> b}

    return array if length < 2

    pivot_idx = partition(array, start, length, &prc)

    left_length = pivot_idx - start
    right_length = length - (left_length + 1)
    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot_idx + 1, right_length, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    pivot_idx, pivot = start, array[start]
    ((start + 1)...(start + length)).each do |idx|
      val = array[idx]
      if prc.call(pivot, val) < 1

      else

        array[idx] = array[pivot_idx + 1]

        array[pivot_idx + 1] = pivot

        array[pivot_idx] = val

        pivot_idx += 1
      end
    end

    pivot_idx
  end
end
