function output = IDCT_Transform_2D(input)

N = size(input,1);
M = size(input,2);
output = zeros(N,M);

for y=1:N
    output(y,:) = IDCT_Transform_1D(input(y,:));
end

for x=1:M
    output(:,x) = IDCT_Transform_1D(output(:,x)')';
end
