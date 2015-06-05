
function out=sample(a,b)
fprintf('In Sample:a=%f,b=%f\n',a,b);
a=b(1)+2*a;
b=a.*b;
out=a+b(1);
fprintf('In Sample:a=%f,b=%f%f\n',a,b);
