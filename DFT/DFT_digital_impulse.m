clc
clear all;
close all;
K=16;
N=16;

for jj=1:K
    for ii=1:N
        expo_x(jj,ii)=exp(-1j*(2*pi/(N-1))...
            *(ii-1)*(jj-1));
    end
    
end

for jj=1:K
    if(jj==4)
        x(jj)=1;
    else
        x(jj)=0;
    end
end

    X_n=(expo_x)*(x)';
    x1=(1/N)*(expo_x)'*(X_n);

subplot(3,1,1),stem(x)
xlabel('\it{n}')
ylabel('{\itx}({\itn})')
subplot(3,1,2),stem(abs(X_n))
xlabel('\it{\omega\times\pi}')
ylabel('{\itX}({\omega})')
subplot(3,1,3),stem(x1)
xlabel('\it{n}')
ylabel('{F^-1}({\itx}({\omega}))')
