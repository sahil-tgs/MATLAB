clear all 
close all
clc

stepsize_x=0.001;
t=-5:stepsize_x:5;
f_o=5;
k=-10:1:10;

f_t=3*sin(2*pi*f_o*t);

T_o=1/f_o;
T_o_2=T_o/2;

strating_point=1;
finish_point=1;
for ii=1:length(t)
    if(t(ii)>=-T_o_2 && strating_point==1)
        index_signal(1,1)=ii;
        strating_point=0;
    elseif(t(ii)<=T_o_2 && finish_point==1)
        index_signal(1,2)=ii;
    elseif(t(ii)>T_o_2)
        break
    end
end

f_t_time_interval=f_t...
    ( index_signal(1,1):index_signal(1,2) );
time_interval= t...
    ( index_signal(1,1):index_signal(1,2));

plot(time_interval, f_t_time_interval)

for ii= 1:length(k)
    temp=f_t_time_interval.*...
        exp((-1j*2*pi*k(ii)/T_o...
        ).*time_interval);
    a_k(ii)=(1/T_o)*integration_x(temp, stepsize_x);
end
subplot(3,1,1), plot(t, f_t)
subplot(3,1,2), plot(time_interval, f_t_time_interval)
subplot(3,1,3),stem(k, abs(a_k))