clc
clear all
close all


step_size_x=0.01;
t=-4:step_size_x:4;
appned_zeros=length(t);
shift_x_for_plot=round(appned_zeros/2)+1;

for ii=1:1:appned_zeros
    if(t(ii)<0)
        x(ii)=0; % x(t)
    elseif(t(ii)>=0 && t(ii)<=1)
        x(ii)=1;
    else
        x(ii)=0;
    end
end

for ii=1:1:appned_zeros
    if(t(ii)<0)
        y(ii)=0; % y(t)
    elseif(t(ii)>=0 && t(ii)<=2)
        y(ii)=t(ii);
    else
        y(ii)=0;
    end
end


for ii=1:1:appned_zeros
    fliped_y(ii)=y(appned_zeros-ii+1);
end
% fliped_expo_t=fliplr( expo_t);

prefix_x=zeros(1, 2*appned_zeros);
post_fix_x=zeros(1, appned_zeros);

fliped_y_with_appneded_zeros...
    =[prefix_x, fliped_y];

moving_signal_for_conv=...
    zeros(1, 3*appned_zeros );

for ii=1:1:appned_zeros
    pre_fix_t(1, appned_zeros-ii+1)=t(1,1)-(ii*step_size_x);
    post_fix(1, ii)=t(1,end)-step_size_x+(ii*step_size_x);
end
t_new=[NaN*ones(1, appned_zeros), t,...
    NaN*ones(1, appned_zeros)];%

t_new_2=[zeros(1, 3*appned_zeros)];%


indexing_new=length...
    (fliped_y_with_appneded_zeros);

x_new=[post_fix_x, x, post_fix_x];

con_output=zeros...
    (1, (3*appned_zeros) );

subplot(4,1,1),plot(t, x, 'r')

subplot(4,1,2),plot(t, y, 'k')


for ii=1:indexing_new
    moving_signal_for_conv(1, 1:ii)...
        =fliped_y_with_appneded_zeros(1,...
        indexing_new-ii+1:indexing_new);
    subplot(4,1,3),plot...
        (t_new, moving_signal_for_conv,...
        'b', t_new, x_new,'r');
    signal_multiplier=moving_signal_for_conv...
        .*x_new;
    con_output(ii)=integration_x...
        (signal_multiplier,step_size_x );
    
    if((ii-shift_x_for_plot)<0)
        t_new_2(1, ii)=t_new(1,ii-...
            shift_x_for_plot+shift_x_for_plot);
    else
        t_new_2(1, ii)=t_new(1,ii-shift_x_for_plot+1);
    end
    subplot(4,1,4),plot(t_new_2, con_output,'k');
%     plot(con_output,'k');
    pause(0.001);
end


for ii=1:1:indexing_new
    if(t_new_2(ii)<0)
        y_theoritical(ii)=0; % y(t)
    elseif(t_new_2(ii)>=0 && t_new_2(ii)<=1)
        y_theoritical(ii)=(1/2)*(t_new_2(ii)^2);
    elseif(t_new_2(ii)>1 && t_new_2(ii)<=2)
        y_theoritical(ii)=t_new_2(ii)-(1/2);
    elseif(t_new_2(ii)>2 && t_new_2(ii)<=3)
        y_theoritical(ii)=(-(1/2)*(t_new_2(ii)^2))...
            +(t_new_2(ii)*1)+((3/2)*1);
    else
        y_theoritical(ii)=0;
    end
end

figure, plot(t_new_2, y_theoritical, '--k',...
    t_new_2, con_output, 'r')
