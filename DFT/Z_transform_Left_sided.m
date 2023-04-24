clc
clear all;
close all;

n=-50:1:50;
length_of_sqn=length(n);
x_n=zeros(1,length_of_sqn);

omega_x=-pi:.1*pi:pi;
length_of_fr=length(omega_x);
for ii=1:length_of_fr
    exp_matrix(ii,:)=exp(-1j*omega_x(ii).*n);
end
alpha=0.5;

for ii=1:length_of_sqn
    % Modified equation for left-sided exponential decay
    x_n(1,ii)=alpha^(-n(ii)); 
end

stem(n,x_n);

re_z=-3:.01:3;
im_z=-3:.01:3;

for ii=1:length(re_z)
    for jj=1:length(im_z)
        z_plane(ii,jj)=re_z(ii)+1j*im_z(jj);
        z_plane_abs(ii,jj)=abs(z_plane(ii,jj));
        X(ii,jj)=re_z(ii);
        Y(jj,ii)=im_z(ii);
    end
end

for ii=1:length(re_z)
    for jj=1:length(im_z)
        for kk=1:(length_of_fr)
            DTFT_of_sqn(1,kk)=...
                sum((z_plane_abs(ii,jj).^-n)...
                .*x_n.*exp_matrix(kk,:));
        end
        z_transform(ii,jj,:)=DTFT_of_sqn;
    end
end

for ii=1:length(re_z)
    for jj=1:length(im_z)
      z_x(ii,jj)=...
          sum(abs(z_transform(ii,jj,:)));
    end
end

surf(X,Y, 10*log10(z_x),...
    'linestyle','none')
