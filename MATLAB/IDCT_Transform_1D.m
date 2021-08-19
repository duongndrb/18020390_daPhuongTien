function output = IDCT_Transform_1D(input)

N = size(input,2);
output = zeros(1,N);

for k=1:N
    sum = 0;
    for n=1:N
        if n==1
            sum = sum + (1/sqrt(N)) * input(n) * cos(pi*(2*k-1)*(n-1)/(2*N));
        else
            sum = sum + sqrt(2/N) * input(n) * cos(pi*(2*k-1)*(n-1)/(2*N));
        end
    end
    output(1,k) = sum;
end
