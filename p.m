function [p_1,p_0] = p(beta,x_data)
for i = 1:90
    p_1(i) = 1/(1+exp(-(beta'*x_data(:,i))));
    p_0(i) = 1-p_1(i);
end 