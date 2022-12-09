function [c, inversions] = mergeSortInversions(arr)
    if length(arr) == 1
        c = arr;
        inversions = 0;
    else
        mitad = round(length(arr)/2);
        fin = length(arr);
        a = arr(1:mitad);
        b = arr(mitad+1:fin);
        [a, ai] = mergeSortInversions(a);
        [b, bi] = mergeSortInversions(b);
        c = [];
        i = 1;
        j = 1;
        inversions = 0 + ai + bi;
        while i <= length(a) && j <= length(b)
                if a(i) <= b(j)
                    c = [c, a(i)];
                    i = i + 1; 
                else
                    c = [c, b(j)];
                    j = j + 1;
                    inversions = inversions + (length(a)-i) + 1;
                end
        end
        c = [c, a(i:length(a))];
        c = [c, b(j:length(b))];
    end
end
