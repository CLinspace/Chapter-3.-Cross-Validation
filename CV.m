%*********fisheriris_data为matlab自带数据**********
load fisheriris
%********10折交叉验证数据划分*********
%首先学习setosa和versicolor,再学习setosa和virginica,最后学习versicolor和virginica
data_se_ve = meas(1:100,:);
attri_se_ve = zeros(100,1);
for i = 1:100
    if i <= 50
        attri_se_ve(i,:) = 1;
    else
        attri_se_ve(i,:) = 0;
    end
end
data_se_ve_attri = [data_se_ve,attri_se_ve];
indices = crossvalind('Kfold',100,10);
train_se_ve = [];
test_se_ve = [];
flag1 = 0; flag2 = 0; flag3 = 0;
for i = 1:10
    test = (indices == i); train = ~test;
    for s = 1:100
        if train(s) == 1
            train_se_ve = [train_se_ve;data_se_ve_attri(s,:)];
        else
            test_se_ve = [test_se_ve;data_se_ve_attri(s,:)];
        end
    end
    beta = [0;0;0;0;1];
    x_data_1 = (train_se_ve(:,1))';
    x_data_2 = (train_se_ve(:,2))';
    x_data_3 = (train_se_ve(:,3))';
    x_data_4 = (train_se_ve(:,4))';
    x_data_5 = ones(1,90);
    x_data = [x_data_1;x_data_2;x_data_3;x_data_4;x_data_5];
    y_data = (train_se_ve(:,5))';
    [p_1,p_0] = p(beta,x_data);
    %*********************牛顿法***********************
    done = 0;
    dL_1_sum = 0;
    dL_2_sum = 0;
    L_old = L_beta(beta,x_data,y_data);
    while (done == 0)
        for z = 1:90
            dL_1_sum = dL_1_sum-x_data(:,z)*(y_data(z)-p_1(z));
            dL_2_sum = dL_2_sum+(x_data(:,z))*((x_data(:,z))')*p_1(z)*(1-p_1(z));
        end
    beta = beta-(dL_2_sum^(-1))*dL_1_sum;
    L_new = L_beta(beta,x_data,y_data);
    if (abs(L_old-L_new)<0.01)
        done = 1;
    else done = 0;
    end
    L_old = L_new;
    end
    for g = 1:10
        y_result(g,1) = 1/(1+exp(-(beta(1:4,:)'*test_se_ve(g,1:4)'+beta(5,:))));
        if y_result(g,1)>=0.5
            y_result(g,1) = 1;
        else 
            y_result(g,1) = 0;
        end
        if y_result(g,1) == test_se_ve(g,5)
            flag1 = flag1+0;
        else flag1 = flag1+1;
        end
    end
    train_se_ve = [];
    test_se_ve = [];
end

%首先学习setosa和versicolor,再学习setosa和virginica,最后学习versicolor和virginica
data_se_ve = meas(51:150,:);
attri_se_ve = zeros(100,1);
for i = 1:100
    if i <= 50
        attri_se_ve(i,:) = 1;
    else
        attri_se_ve(i,:) = 0;
    end
end
data_se_ve_attri = [data_se_ve,attri_se_ve];
indices = crossvalind('Kfold',100,10);
train_se_ve = [];
test_se_ve = [];
for i = 1:10
    test = (indices == i); train = ~test;
    for s = 1:100
        if train(s) == 1
            train_se_ve = [train_se_ve;data_se_ve_attri(s,:)];
        else
            test_se_ve = [test_se_ve;data_se_ve_attri(s,:)];
        end
    end
    beta = [0;0;0;0;1];
    x_data_1 = (train_se_ve(:,1))';
    x_data_2 = (train_se_ve(:,2))';
    x_data_3 = (train_se_ve(:,3))';
    x_data_4 = (train_se_ve(:,4))';
    x_data_5 = ones(1,90);
    x_data = [x_data_1;x_data_2;x_data_3;x_data_4;x_data_5];
    y_data = (train_se_ve(:,5))';
    [p_1,p_0] = p(beta,x_data);
    %*********************牛顿法***********************
    done = 0;
    dL_1_sum = 0;
    dL_2_sum = 0;
    L_old = L_beta(beta,x_data,y_data);
    while (done == 0)
        for z = 1:90
            dL_1_sum = dL_1_sum-x_data(:,z)*(y_data(z)-p_1(z));
            dL_2_sum = dL_2_sum+(x_data(:,z))*((x_data(:,z))')*p_1(z)*(1-p_1(z));
        end
    beta = beta-(dL_2_sum^(-1))*dL_1_sum;
    L_new = L_beta(beta,x_data,y_data);
    if (abs(L_old-L_new)>0.01)
        done = 1;
    else done = 0;
    end
    L_old = L_new;
    end
    for g = 1:10
        y_result(g,1) = 1/(1+exp(-(beta(1:4,:)'*test_se_ve(g,1:4)'+beta(5,:))));
        if y_result(g,1)>=0.5
            y_result(g,1) = 1;
        else 
            y_result(g,1) = 0;
        end
        if y_result(g,1) == test_se_ve(g,5)
            flag2 = flag2+0;
        else flag2 = flag2+1;
        end
    end
    train_se_ve = [];
    test_se_ve = [];
end

%首先学习setosa和versicolor,再学习setosa和virginica,最后学习versicolor和virginica
data_se_ve = [meas(1:50,:);meas(101:150,:)];
attri_se_ve = zeros(100,1);
for i = 1:100
    if i <= 50
        attri_se_ve(i,:) = 1;
    else
        attri_se_ve(i,:) = 0;
    end
end
data_se_ve_attri = [data_se_ve,attri_se_ve];
indices = crossvalind('Kfold',100,10);
train_se_ve = [];
test_se_ve = [];
for i = 1:10
    test = (indices == i); train = ~test;
    for s = 1:100
        if train(s) == 1
            train_se_ve = [train_se_ve;data_se_ve_attri(s,:)];
        else
            test_se_ve = [test_se_ve;data_se_ve_attri(s,:)];
        end
    end
    beta = [0;0;0;0;1];
    x_data_1 = (train_se_ve(:,1))';
    x_data_2 = (train_se_ve(:,2))';
    x_data_3 = (train_se_ve(:,3))';
    x_data_4 = (train_se_ve(:,4))';
    x_data_5 = ones(1,90);
    x_data = [x_data_1;x_data_2;x_data_3;x_data_4;x_data_5];
    y_data = (train_se_ve(:,5))';
    [p_1,p_0] = p(beta,x_data);
    %*********************牛顿法***********************
    done = 0;
    dL_1_sum = 0;
    dL_2_sum = 0;
    L_old = L_beta(beta,x_data,y_data);
    while (done == 0)
        for z = 1:90
            dL_1_sum = dL_1_sum-x_data(:,z)*(y_data(z)-p_1(z));
            dL_2_sum = dL_2_sum+(x_data(:,z))*((x_data(:,z))')*p_1(z)*(1-p_1(z));
        end
    beta = beta-(dL_2_sum^(-1))*dL_1_sum;
    L_new = L_beta(beta,x_data,y_data);
    if (abs(L_old-L_new)<0.01)
        done = 1;
    else done = 0;
    end
    L_old = L_new;
    end
    for g = 1:10
        y_result(g,1) = 1/(1+exp(-(beta(1:4,:)'*test_se_ve(g,1:4)'+beta(5,:))));
        if y_result(g,1)>=0.5
            y_result(g,1) = 1;
        else 
            y_result(g,1) = 0;
        end
        if y_result(g,1) == test_se_ve(g,5)
            flag3 = flag3+0;
        else flag3 = flag3+1;
        end
    end
    train_se_ve = [];
    test_se_ve = [];
end
flag = flag1+flag2+flag3;
