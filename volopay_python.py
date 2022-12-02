arr = [[3, 2], [4, 3], [2, 3], [3, 4]]
n = len(arr)
count = 1
k = 30
p = 0
q = -1
aisle =  []
aisle.append(arr[0][0] - 1)
sum = arr[0][0] - 1
i = 1
while (i < n - 1) :
    if (arr[i][0] != 2) :
        sum += 1
        aisle.append(sum)
        sum += arr[i][0] - 1
        aisle.append(sum)
    else :
        sum += 1
        aisle.append(sum)
        sum += 1
        aisle.append(sum)
    i += 1
aisle.append(sum + 1)
i = 0
while (i < n) :
    p += arr[i][0]
    if (arr[i][1] > q) :
        q = arr[i][1]
    i += 1
window =  []
window.append(0)
window.append(p - 1)
center =  []
i = 0
while (i < p) :
    if (not i  in aisle and not i  in window) :
        center.append(i)
    i += 1
arr2 = [[0] * (p) for _ in range(q)]
i = 0
while (i < q) :
    j = 0
    while (j < p) :
        arr2[i][j] = 0
        j += 1
    i += 1
sum2 = -1
limit =  []
limit.append(0)
i = 0
while (i < n) :
    sum2 += arr[i][0]
    limit.append(sum2)
    i += 1
map =  dict()
map[0] = arr[0][1]
i = 0
while (i < n) :
    j = limit[i] + 1
    while (j <= limit[i + 1]) :
        map[j] = arr[i][1]
        j += 1
    i += 1

i = 0
while (i < q) :
    j = 0
    while (j < p) :
        if (j  in aisle and i < map.get(j)) :
            arr2[i][j] = count
            count += 1
        j += 1
    i += 1
i = 0
while (i < q) :
    j = 0
    while (j < p) :
        if (j  in window and i < map.get(j)) :
            arr2[i][j] = count
            count += 1
        j += 1
    i += 1
i = 0
while (i < q) :
    j = 0
    while (j < p) :
        if (j  in center and i < map.get(j)) :
            arr2[i][j] = count
            count += 1
        j += 1
    i += 1
i = 0
while (i < q) :
    j = 0
    while (j < p) :
        if (arr2[i][j] != 0 and arr2[i][j] <= 30) :
            print(str(arr2[i][j]) + " ", end ="")
        elif(arr2[i][j]>30):
            print("XX ", end ="")
        else:
            print("   ",end="")
        j += 1
    print(" ")
    i += 1
