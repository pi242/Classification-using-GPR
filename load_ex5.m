load 'ex5data1.mat';

% Xtest_norm = (Xtest - min(Xtest)) ./ (max(Xtest) - min(Xtest));
% ytest_norm = (ytest - min(ytest)) ./ (max(ytest) - min(ytest));
% X_norm = [X];%; Xval];
% y_norm = [y];%; yval];
% X_norm = (X_norm - min(X_norm)) ./ (max(X_norm) - min(X_norm));
% y_norm = (y_norm - min(y_norm)) ./ (max(y_norm) - min(y_norm));
% Xval_norm = [Xval];%; Xval];
% yval_norm = [yval];
% Xval_norm = (Xval_norm - min(Xval_norm)) ./ (max(Xval_norm) - min(Xval_norm));
% yval_norm = (yval_norm - min(yval_norm)) ./ (max(yval_norm) - min(yval_norm));
X_norm = [X];
y_norm = [y];
Xtest_norm = [Xtest];
ytest_norm = [ytest];
plot(Xtest_norm, ytest_norm, 'bx');
hold on;

% theta = [326.8833; 17.3868]%; 1000]
theta = [6.8524; 8.9178; -7.2265]

%theta = [0; 0.20311; 1000]

[m_post, cov_post, sd] = gprTrain(X_norm, y_norm, Xtest_norm, theta);
plot_interpl(Xtest_norm, m_post, 20, 'g');
% plot_interpl(Xtest_norm, m_post - 2 * sd, 20, 'g');
% plot_interpl(Xtest_norm, m_post + 2 * sd, 20, 'g');

%plot(Xtest_norm, m_post, 'g+');
%  plot(Xtest_norm, m_post - 2 * sd, 'go');
%  plot(Xtest_norm, m_post + 2 * sd, 'go');

%for measuring test error
sum((m_post - ytest_norm) .^ 2) / size(m_post, 1)


Mdl = LinearModel.fit(X_norm, y_norm, 'quadratic');
yfit = predict(Mdl, Xtest_norm);

plot_interpl(Xtest_norm, yfit, 20, 'r');
sum((yfit - ytest_norm) .^ 2) / size(yfit, 1)



