clear all;
close all;
clc;


X=[1 2 3];
ischar(X);
X=[1 2 3 'c' 9/0];
ischar(X);

%X(1,4)=[];
isfinite(X)
