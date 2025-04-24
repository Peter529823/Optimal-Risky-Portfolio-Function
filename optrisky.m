function [w,Stdev]=optrisky(targmu,mu,Sig)
%computes the optimal risky portfolio 

%Outputs
% w -- ptf
% Stdev -- standard deviation of optimal ptf

%Inputs
% targmu -- target exp return
% mu -- expected return vector
% Sig -- var/cov matrix 

if size(mu,2)>1, mu=mu'; end
N=numel(mu);
invSig=inv(Sig);
A=mu'*invSig*mu;
B=ones(1,N)*invSig*mu;
C=ones(1,N)*invSig*ones(N,1);
D=A*C-B^2;

x=(A*invSig*ones(N,1)-B*invSig*mu)/D;
y=(C*invSig*mu-B*invSig*ones(N,1))/D;

w=x+y*targmu;
Stdev=sqrt(w'*Sig*w);