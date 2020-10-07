T = readtable('ymat.csv');
ymat = table2array(T);
%% EM algorithm
thetamat = zeros(2,15);
tic
for i = 1:15
y = ymat(:,i);
theta = [mean(y), var(y)];
        err = 10;
        while err > 1e-12
            Pi = exp(-(y-theta(1)).^2./(2*theta(2)))./...
                (exp(-(y-theta(1)).^2./(2*theta(2)))+exp(-(y+theta(1)).^2./(2*theta(2))));
            muI = mean((2*Pi-1).*y);
            sig2I = mean(y.^2)-muI^2;
            err = norm(theta-[muI,sig2I]);
            theta = [muI, sig2I];
        end 
thetamat(:,i) = theta';
end
t1 = toc; 
thetamat(2,:) = sqrt(thetamat(2,:));
csvwrite('thetamat_EM.csv',thetamat); % theta has (mu, sigma) x 15.

%% Translate  
translation  = 1.2;  %  so that mu/sigma = 1 (roughly)
ymat = abs(ymat  - translation);
csvwrite('ymat_t.csv',ymat) 
%% EM algorithm
thetamat = zeros(2,15);
tic
for i = 1:15
y = ymat(:,i);
theta = [mean(y), var(y)];
        err = 10;
        while err > 1e-12
            Pi = exp(-(y-theta(1)).^2./(2*theta(2)))./...
                (exp(-(y-theta(1)).^2./(2*theta(2)))+exp(-(y+theta(1)).^2./(2*theta(2))));
            muI = mean((2*Pi-1).*y);
            sig2I = mean(y.^2)-muI^2;
            err = norm(theta-[muI,sig2I]);
            theta = [muI, sig2I];
        end 
thetamat(:,i) = theta';
end
t2 = toc;
thetamat(2,:) = sqrt(thetamat(2,:));
csvwrite('thetamat_EMt.csv',thetamat) 


t1
t2