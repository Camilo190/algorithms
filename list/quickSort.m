function [array, count] = quickSort(array, left, right, caso)
    if (left < right)
        [x, pi, contador1] = choosePivot(array,left,right, caso);
        array = x;
        [array, contador2] = quickSort(array,left, pi - 1, caso);
        [array, contador3] = quickSort(array, pi + 1, right, caso);
        count = contador1 + contador2 + contador3;
    else
        count = 0;
    end
end

function [array, position, count] = partition(array, left, right)
    pivot = right;
    i = left - 1;
    count = 0;
    for j = left:right-1
        count = count + 1;
        if array(j) < array(pivot)
            i = i + 1;
            swap1 = array(i);
            swap2 = array(j);
            array(i) = swap2;
            array(j) = swap1;
        end
    end

    swap3 = array(i+1);
    swap4 = array(pivot);
    array(i+1) = swap4;
    array(pivot) = swap3;
    position = i + 1;
end

function [array, position, count] = choosePivot(array, left, right, caso)
    switch caso
        case 1
            i = left;
        case 2
            i = right;
        case 3
            i = randi([left, right]);
        case 4
            i = median(randi([left, right], 3,1));
    end
    swap1 = array(i);
    swap2 = array(right);
    array(i) = swap2;
    array(right) = swap1;

    [array, position, count] = partition(array, left, right);
end
