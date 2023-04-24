clc
clear all
step_siz_x=0.0005;
t=-3:step_siz_x:3;
appned_zeros=length(t);
zeros_vect_for_cov=appned_zeros;


for ii=1:length(t)
    if(t(ii)<0)
        x(ii)=sin(t(ii));
        y(ii)=0;
    elseif(t(ii)>=0 && t(ii)<=1)
        x(ii)=sin(t(ii));

       y(ii)=t(ii);
    elseif(t(ii)>1 && t(ii)<=2)
        x(ii)=sin(t(ii));
        y(ii)=t(ii);
    else
        x(ii)=sin(t(ii));
        y(ii)=0;   
    end
    

end

% inversioon of the signal

length_of_sqn=length(t);
for ii=1:length_of_sqn
    fliped_y(ii)=y(length_of_sqn-ii+1);
end
prefix_x=zeros(1, 2*zeros_vect_for_cov);
post_fix_x=zeros(1, zeros_vect_for_cov);

fliped_y_with_appneded_zeros=[prefix_x,...
    fliped_y];
moving_signal_for_conv=...
    zeros(1, (length(fliped_y) +  2*appned_zeros) );

vect_zeros=moving_signal_for_conv;

t_new=[NaN*ones(1, zeros_vect_for_cov), t, ...
    NaN*ones(1, zeros_vect_for_cov)];
indexing_new=length(fliped_y_with_appneded_zeros);
x_new=[post_fix_x, x, post_fix_x];
con_output=zeros(1, (length(fliped_y) +  2*appned_zeros) );

subplot(4,1,1),plot(t(1:ii), x(1:ii));
subplot(4,1,2),plot(t(1:ii), y(1:ii));
for ii=1:indexing_new
    moving_signal_for_conv(1, 1:ii)=...
        fliped_y_with_appneded_zeros(1,...
        indexing_new-ii+1:indexing_new);
    

    subplot(4,1,3),plot(t_new, moving_signal_for_conv, 'b', t_new, x_new,'r');
    
    signal_multiplier=moving_signal_for_conv.*x_new;
    con_output(ii)=integration_x(signal_multiplier...
        ,step_siz_x );
    
    subplot(4,1,4),plot(con_output);
    pause(0.001);
end