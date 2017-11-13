function MI = hs_mut_inf(A,B)
A=double(A);
B=double(B);
[N,M] = size(A);
% 
mua = mean(A(:));
mub = mean(B(:));
% 
sa = std(A(:));
sb = std(B(:));
% 
S=64;
 

A = round((A-mua)*(S/2)/(3*sa))+(S/2);
A = (A<1).*1+(A>S).*S+((A>=1)&(A<=S)).*A;
B = round((B-mub)*(S/2)/(3*sb))+(S/2);
B = (B<1).*1+(B>S).*S+((B>=1)&(B<=S)).*B;

p = zeros(S,S);
for i = 1:N
    for j = 1:M
        p(A(i,j),B(i,j)) = p(A(i,j),B(i,j))+1;
    end
end

% save p.mat p;

p = p./(N*M);

% figure(2)
% imagesc(log(p+1e-40))
% colormap(gray(256))

[n,m] = size(p);

MI = 0;

for i = 1:n
    for j = 1:m
       MI = MI+p(i,j)*log((p(i,j)+1e-40)./(sum(p(:,j)).*sum(p(i,:))+1e-40));
    end   
end
end