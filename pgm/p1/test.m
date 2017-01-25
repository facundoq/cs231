% FACTORS.INPUT(1) contains P(X_1)
FACTORS.INPUT(1) = struct('var', [1], 'card', [2], 'val', [0.11, 0.89]);

% FACTORS.INPUT(2) contains P(X_2 | X_1)
FACTORS.INPUT(2) = struct('var', [2, 1], 'card', [2, 2], 'val', [0.59, 0.41, 0.22, 0.78]);

% FACTORS.INPUT(3) contains P(X_3 | X_2)
FACTORS.INPUT(3) = struct('var', [3, 2], 'card', [2, 2], 'val', [0.39, 0.61, 0.06, 0.94]);

%print_factor(FACTORS.INPUT(3))

% Factor Product
FACTORS.PRODUCT = FactorProduct(FACTORS.INPUT(1), FACTORS.INPUT(2));
% The factor defined here is correct to 4 decimal places.
FACTORS.PRODUCT = struct('var', [1, 2], 'card', [2, 2], 'val', [0.0649, 0.1958, 0.0451, 0.6942]);


% Factor Marginalization
%print_factor(FACTORS.INPUT(2))
FACTORS.MARGINALIZATION = FactorMarginalization(FACTORS.INPUT(2), [2]);
%print_factor(FACTORS.MARGINALIZATION)
FACTORS.MARGINALIZATION = struct('var', [1], 'card', [2], 'val', [1 1]); 
%print_factor(FACTORS.MARGINALIZATION)

% Observe Evidence
FACTORS.EVIDENCE = ObserveEvidence(FACTORS.INPUT, [2 1; 3 2]);
for i=1:length(FACTORS.EVIDENCE)
    print_factor(FACTORS.EVIDENCE(i));
end
FACTORS.EVIDENCE(1) = struct('var', [1], 'card', [2], 'val', [0.11, 0.89]);
FACTORS.EVIDENCE(2) = struct('var', [2, 1], 'card', [2, 2], 'val', [0.59, 0, 0.22, 0]);
FACTORS.EVIDENCE(3) = struct('var', [3, 2], 'card', [2, 2], 'val', [0, 0.61, 0, 0]);

for i=1:length(FACTORS.EVIDENCE)
    print_factor(FACTORS.EVIDENCE(i));
end

% Compute Joint Distribution
FACTORS.JOINT = ComputeJointDistribution(FACTORS.INPUT);
%print_factor(FACTORS.JOINT)
FACTORS.JOINT = struct('var', [1, 2, 3], 'card', [2, 2, 2], 'val', [0.025311, 0.076362, 0.002706, 0.041652, 0.039589, 0.119438, 0.042394, 0.652548]);
%print_factor(FACTORS.JOINT)

% Compute Marginal
FACTORS.MARGINAL = ComputeMarginal([2, 3], FACTORS.INPUT, [1, 2]);
print_factor(FACTORS.MARGINAL)
FACTORS.MARGINAL = struct('var', [2, 3], 'card', [2, 2], 'val', [0.0858, 0.0468, 0.1342, 0.7332]);
print_factor(FACTORS.MARGINAL)