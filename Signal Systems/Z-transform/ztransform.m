clc
clear all
close all

n=-100:1:100;
Length_of_sqn=length(n);
x_n=zeros(1,Length_of_sqn);

omega_x=-pi:0.1*pi:pi;
Length_of_fr=length(omega_x);
for ii=1:Length_of_fr
    exp_matrix(ii,:)=exp(-1j*omega_x(ii).*n);
end
alpha=0.5;

for ii=1:Length_of_sqn
    
   
        x_n(ii)=sin(ii);
        
end
subplot(2,2,1),stem(n, x_n);

re_z=-3:0.01:3;
im_z=-3:0.01:3;

for ii=1:length(re_z)
    for jj=1:length(im_z)
        z_plan(ii,jj)=re_z(ii)+1j*im_z(jj);
        z_plan_abs(ii,jj)=abs(z_plan(ii,jj));
        X(ii,jj)=re_z(ii);
        Y(jj,ii)=im_z(ii);
    end
end

for ii=1:length(re_z)
    for jj=1:length(im_z)
        for iii=1:(Length_of_fr)
            DTFT_of_sqn(1,iii)=...
                sum((z_plan_abs(ii,jj).^-n)...
                .*x_n.*exp_matrix(iii,:));
        end
        z_transfrom(ii,jj,:)=DTFT_of_sqn;
    end
end

for ii=1:length(re_z)
    for jj=1:length(im_z)
        z_x(ii,jj)=...
            sum(abs(z_transfrom(ii,jj,:)));
    end
end
subplot(2,2,2),surf(X, Y, 10*log10(z_x),...
    'linestyle','none')






