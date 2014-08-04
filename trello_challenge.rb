s = "acdegilmnoprstuw"
hash_needed = 945924806726376#910897038977002

def find_string(hash_needed, restrictions, size)
  first_string = restrictions[0] * size
  size.times do |i|
    first_string = upper_bound(restrictions, first_string, hash_needed, i)
  end
  first_string
end

def upper_bound(restrictions, string, limit, i)
  restrictions.length.times do |j|
    string[i] = restrictions[j]
    if hashify(string, restrictions) > limit
      string[i] = restrictions[j-1]
      return string
    end
  end
  string
end

def hashify(string, letters)
  h = 7
  string.length.times do |i|
    h = (h * 37 + letters.index(string[i]))
  end
  h
end

puts find_string(hash_needed, s, 9)

puts hashify(find_string(hash_needed, s, 9), s) == hash_needed