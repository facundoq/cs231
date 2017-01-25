function factors = ComputeTripletFactors (images, tripletList, K)
% This function computes the triplet factor values for one word.
%
% Input:
%   images: An array of structs containing the 'img' value for each
%     character in the word.
%   tripletList: An array of the character triplets we will consider (other
%     factor values should be 1). tripletList(i).chars gives character
%     assignment, and triplistList(i).factorVal gives the value for that
%     entry in the factor table.
%   K: The alphabet size (accessible in imageModel.K for the provided
%     imageModel).
%
% Hint: Every character triple in the word will use the same 'val' table.
%   Consider computing that array once and then resusing for each factor.
%
% Copyright (C) Daphne Koller, Stanford University, 2012


n = length(images);

% If the word has fewer than three characters, then return an empty list.
if (n < 3)
    factors = [];
    return
end

% Your code here:
new_val = ones(prod([K,K,K]), 1);
assignments = [tripletList.chars];
assignments = reshape(assignments, 3, length(tripletList))';
indexes = AssignmentToIndex(assignments, [K,K,K]);

new_val(indexes) = [tripletList.factorVal];
vars = repmat((1:n-2)', 1, 3) + repmat([0 1 2], n-2, 1);
vars = num2cell(vars, 2);

factors = repmat(struct('var', [], 'card', [K,K,K], 'val', new_val), n - 2, 1);
[factors.var] = vars{:};

end
