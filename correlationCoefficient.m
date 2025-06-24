function [hcc vcc dcc]=correlationCoefficient( A )
N=2000;
[row,col]=size(A);
r = randi([1 row],N,1);
c = randi([1 col],N,1);

for i = 1:N
    x(i)=double(A(r(i),c(i)));
    if r(i)==row
        r(i)=1;
    end
    y(i)=double(A(r(i)+1,c(i)));
end
figure;
plot(x,y,'.');
xlabel('Intensity at (x,y)');
ylabel('Intensity at (x,y+1)')
title('Correlation between horizontally adjacent pixels');
hcc=coefficient1(x,y,N);

for i = 1:N
    x(i)=double(A(r(i),c(i)));
    if c(i)==col
        c(i)=1;
    end
    y(i)=double(A(r(i),c(i)+1));
end

figure;
plot(x,y,'.');
xlabel('Intensity at (x,y)');
ylabel('Intensity at (x+1,y)')
title('Correlation between vertically adjacent pixels');
vcc=coefficient1(x,y,N);

for i = 1:N
    x(i)=double(A(r(i),c(i)));
    if r(i)==row
        r(i)=1;
    end
    if c(i)==col
        c(i)=1;
    end
    y(i)=double(A(r(i)+1,c(i)+1));
end
figure;
plot(x,y,'.');
xlabel('Intensity at (x,y)');
ylabel('Intensity at (x+1,y+1)')
title('Correlation between diagonally adjacent pixels');
dcc=coefficient1(x,y,N);

 function [ro]=coefficient1(x,y,N)
        Ex=mean(x);
        Ey=mean(y);
        
        Dx=0;
        Dy=0;
        for i = 1:N
            Dx=Dx+(x(i)-Ex)^2/N;
            Dy=Dy+(y(i)-Ey)^2/N;
        end
        convXY=0;
        for i = 1:N
            convXY=convXY+((x(i)-Ex)*(y(i)-Ey))/N;
        end
        %calculate Corelation Coefficient
        ro=convXY/((Dx^.5)*(Dy^.5));
    end

end

