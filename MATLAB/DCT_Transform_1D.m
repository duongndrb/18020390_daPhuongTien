function output = DCT_Transform_1D(input)

N = size(input,2);
output = zeros(1,N);

for k=1:N
    sum = 0;
    for n=1:N
        sum = sum + input(n) * cos((pi/(2*N))*(2*n-1)*(k-1));
    end
    if k==1
        sum = sum * (1/sqrt(N));
    else
        sum = sum * sqrt(2/N);
    end
    output(1,k) = sum;
end
