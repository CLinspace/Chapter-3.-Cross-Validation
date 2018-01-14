function L_sum = L_beta(beta,x_data,y_data)
L_sum = 0;
for i = 1:90
%     if (beta)'*x_data(:,i)>10
%         L(i) = -y_data(i)*((beta)'*x_data(:,i))+(beta'*x_data(:,i));
%     else
    L(i) = -y_data(i)*((beta)'*x_data(:,i))+log(1+exp(beta'*x_data(:,i)));
    end
    L_sum = L_sum+L(i);
end