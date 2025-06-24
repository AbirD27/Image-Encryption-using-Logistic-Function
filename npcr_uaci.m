function [ npcr, uaci ] = npcr_uaci( C1,C2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[r,c]=size(C1);
C1=double(C1);
C2=double(C2);
D=zeros(r,c);
for i=1:r
    for j=1:c
        if C1(i,j)~=C2(i,j)
            D(i,j)=1;
        end
    end
end
res=sum(sum(D));
npcr=(res*100)/(r*c);
e=0;
for i=1:r
    for j=1:c
        e=e+abs(C1(i,j)-C2(i,j));
    end
end
uaci=(e*100)/(255*r*c);
end