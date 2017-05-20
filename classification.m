% load 'ex6data1.mat';
% plotData_class(X, y);
%figure;
X = [0; 1; 3; 4];
y = [0; 0; 1; 1];
plot(X, y);
%plotData_class(X, y);
hold on;

% theta = [ 1.1672; 1.0132; 0.3594; 0.9236];
theta = [ -0.5615; 1.6975; 2.1073; -0.4488];

[m_post, cov_post, sd] = gprTrain(X, y,[5], theta);
%[m_post, cov_post, sd] = gprTrain(X(1:end, :), y(1:end, :), X, theta);
%y(1:end)
m_post
%figure;
%plotData_class(X, m_post)
plot([5], m_post, 'g');
%plot(X(201:end, :), m_post, 'go')