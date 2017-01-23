%共轭梯度法
%初始化x0向量
x0=[4 -2 6 1]';
%请输入系数矩阵A
A=[16 4 8 4
    4 10 8 4
    8 8 12 10
    4 4 10 12];
n=size(A);
%请输入常数向量b
b=[32 26 38 30]';
r=[];
r(:,1)=b-A*x0
p=[];
k=1;
while r(k)>0.00001
    k=k+1;
    if(k>n)
        break;
    end
    x(:,1)=x0;
    if(k==2)
        p(:,1)=r(:,1);
    else
        R(k-1)=r(:,k-1)'*r(:,k-1);
        R(k-2)=r(:,k-2)'*r(:,k-2);
        beta(k-2)=R(k-1)/R(k-2);
        p(:,k-1)=r(:,k-1)+beta(k-2)*p(:,k-2);
    end
    R(k-1)=r(:,k-1)'*r(:,k-1);
    P(k-1)=p(:,k-1)'*A*p(:,k-1);
    alph(k-1)=R(k-1)/P(k-1);
    x(:,k)=x(:,k-1)+alph(k-1)*p(:,k-1);
    r(:,k)=r(:,k-1)-alph(k-1)*A*p(:,k-1);
end
k
if(k<=n)
    X=x(:,k)
else
    X=x(:,n)
end   