arr = [[3, 2], [4, 3], [2, 3], [3, 4]]
n = arr.length
count = 1
k = 30
p = 0
q = -1
aisle =  []
aisle.append(arr[0][0] - 1)
sum = arr[0][0] - 1
i = 1
while (i < n - 1) 
    if (arr[i][0] != 2) 
        sum += 1
        aisle.append(sum)
        sum += arr[i][0] - 1
        aisle.append(sum)
    
    
    else 
        sum += 1
        aisle.append(sum)
        sum += 1
        aisle.append(sum)
    end
    
    i += 1
end
aisle.append(sum + 1)
i = 0
while (i < n) 
    p += arr[i][0]
    if (arr[i][1] > q) 
        q = arr[i][1]
    end
    i += 1
end

window =  []
window.append(0)
window.append(p - 1)
center =  []
i = 0

while (i < p) 
    if (!aisle.include?(i) and !window.include?(i)) 
        center.append(i)
    end
    i += 1
end
arr2= Array.new(q) { Array.new(p) { 0 } }
i = 0
while (i < q) 
    j = 0
    while (j < p) 
        arr2[i][j] = 0
        j += 1
    end
    i += 1
end
sum2 = -1
limit =  []
limit.append(0)
i = 0
while (i < n) 
    sum2 += arr[i][0]
    limit.append(sum2)
    i += 1
end
i=0
map = Hash.new
map[0] = arr[0][1]

while (i < n) 
    j = limit[i] + 1
    while (j <= limit[i + 1]) 
        map[j] = arr[i][1]
        j += 1
    end
    i += 1
end
i = 0
while (i < q) 
    j = 0
    while (j < p) 
        if (aisle.include?(j) and i < map[j]) 
            arr2[i][j] = count
            count += 1
        end
        j += 1
    end
    i += 1
end
i = 0

while (i < q) 
    j = 0
    while (j < p) 
        if (window.include?(j) and i < map[j]) 
            arr2[i][j] = count
            count += 1
        end  
        j += 1
    end     
    i += 1
end
i = 0

while (i < q) 
    j = 0
    while (j < p) 
        if (center.include?(j) and i < map[j]) 
            arr2[i][j] = count
            count += 1
        end
        j += 1
    end
    i += 1
end
i = 0

while (i < q) 
    j = 0
    while (j < p) 
        if (arr2[i][j] != 0 and arr2[i][j] <= 30) 
            print((arr2[i][j]))
            print(" ")
        
        elsif(arr2[i][j]>30)
            print("XX ")
        
        else
            print("   ")
        end
        j += 1
    end
    puts(" ")
    i += 1
end