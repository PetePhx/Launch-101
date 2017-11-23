def count_occurrences veh_arr
  veh_hash = {}
  veh_arr.each do |str|
    if veh_hash[str].nil?
      veh_hash[str] = 1
    else
      veh_hash[str] += 1
    end
  end
  veh_hash.each do |k,v|
    puts "#{k} => #{v}"
  end
end


vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
            'motorcycle', 'motorcycle', 'car', 'truck']
count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
