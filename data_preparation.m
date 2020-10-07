load SD.mat;
ymat = zeros(56,15);
for i = 1:15
X = SD(:,:,i);
[center, r] = getSubSphere(X,0) ;
ymat(:,i) = acos(center'*X);
end 
csvwrite('ymat.csv',ymat) 

 
