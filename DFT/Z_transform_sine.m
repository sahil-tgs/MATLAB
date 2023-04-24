clc
clear all;
close all;

n=0:100;
length_of_sqn=length(n);
x_n=sin(0.1*pi*n);

omega_x=-pi:.1*pi:pi;
length_of_fr=length(omega_x);
for ii=1:length_of_fr
    exp_matrix(ii,:)=exp(-1j*omega_x(ii).*n);
end

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
        z_x(ii,jj)=abs(z_transform(ii,jj,length_of_fr/2+1));
    end
end

mesh(X,Y, z_x)
xlabel('Re(z)')
ylabel('Im(z)')
zlabel('|X(e^{j\omega})|')
