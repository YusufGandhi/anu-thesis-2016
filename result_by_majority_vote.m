% the assumption is that r, g, b are 2x620 array
function result = result_by_majority_vote(r, g, b)
    result = zeros(2, 620);
    for i=1:620
        label_one = r(1, i) + g(1, i) + b(1, i);
        label_two = r(2, i) + g(2, i) + b(2, i);
        
        if label_one > label_two
            result(1,i) = 1;
        else
            result(2,i) = 1;
        end
    end
end