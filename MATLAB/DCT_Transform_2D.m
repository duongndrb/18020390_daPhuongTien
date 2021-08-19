function output = DCT_Transform_2D(input)

N = size(input,1);
M = size(input,2);
output = zeros(N,M);

for y=1:N
    output(y,:) = DCT_Transform_1D(input(y,:));
end

for x=1:M
    output(:,x) = DCT_Transform_1D(output(:,x)')';
end
