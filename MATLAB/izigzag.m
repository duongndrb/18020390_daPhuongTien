function output = izigzag(inputimg)

im = zeros(8,8);
t=0;
l=size(im);
sum=l(2)*l(1);
for d=2:sum
 c=rem(d,2);
    for i=1:l(1)
        for j=1:l(2)
            if((i+j)==d)
                t=t+1;
                if(c==0)
                    im(j,d-j) = inputimg(t);
                else          
                    im(d-j,j) = inputimg(t);
                end
             end    
         end
     end
end
output = im;
end