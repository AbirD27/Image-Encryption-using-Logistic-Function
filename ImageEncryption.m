function ImageEncryption(a ,x0, inputImage) 
  
    transformed1= logisticmap(a,x0, inputImage);

     transformed2= logisticmap(3.9978263534,0.5437, inputImage); 
     
     transformed3= logisticmap(3.999976666,0.8232, inputImage);

    Ienc1 =bitxor(inputImage,transformed1);  % Ienc is the encrypted Image
    Ienc2 =bitxor(Ienc1,transformed2);  % Ienc is the encrypted Image
    Ienc3 =bitxor(Ienc2,transformed3);  % Ienc is the encrypted Image

     figure,imshow(Ienc3),title('Encrypted Image');
    
    
  [hcc vcc dcc]=correlationCoefficient(inputImage);
  [hcc vcc dcc]=correlationCoefficient(Ienc3);
  
  [e,p,r1,r2]=correlations(inputImage);
fprintf('\n\n\nOrg image entropy=%f corV=%f corH=%f corD=%f\n',e,p,r1,r2);

 [e,p,r1,r2]=correlations(Ienc3);
fprintf('\n\n\nEncrypted image entropy=%f corV=%f corH=%f corD=%f\n',e,p,r1,r2);

[npcr , uaci] = npcr_uaci (Ienc3,inputImage);
npcr
uaci
[npcr , uaci] = npcr_uaci (Ienc3,Ienc2);
npcr
uaci

figure, imhist(Ienc3);
figure, imhist(inputImage);

 Idec3 =bitxor(Ienc3,transformed3);  % Idec is the decrypted Image
 Idec2 =bitxor(Idec3,transformed2);  % Idec is the decrypted Image
 Idec1 =bitxor(Idec2,transformed1);  % Idec is the decrypted Image
 
 
 figure,imshow(Idec1), title('Decrypted Image');
end
function [e, pv, ph, pd]=correlations(im)
e=entropy(uint8(im));
a=im(1:size(im,1)-1,:);
b=im(2:size(im,1),:);
pv = corr2(a,b);

a=im(:,1:size(im,2)-1);
b=im(:,2:size(im,2));
ph = corr2(a,b);

a=im(1:size(im,1)-1,1:size(im,2)-1);
b=im(2:size(im,1),2:size(im,2));
pd = corr2(a,b);
end

