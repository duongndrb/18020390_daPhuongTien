function output = zigzag(inputimg)

t=0;
l=size(inputimg);
sum=l(2)*l(1);
for d=2:sum
 c=rem(d,2);
    for i=1:l(1)
        for j=1:l(2)
            if((i+j)==d)
                t=t+1;
                if(c==0)
                output(t)=inputimg(j,d-j);
                else          
                output(t)=inputimg(d-j,j);
                end
             end    
         end
     end
end

end