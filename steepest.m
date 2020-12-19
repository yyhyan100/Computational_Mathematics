function steepest=steepest(x0)
  m=size(x0)(2);
  steepest=zeros(1,m);
  alpha=0;
  s=zeros(1,m);
  n=0;
  tol=0.00000001;
  err=1;
  phi1=(sqrt(5)-1)*0.5;
  while(err>tol)
    s=-gdfvm(x0)
      xl=0;
      xu=1;
      err1=tol+1;
      phi1d=phi1*(xu-xl);
      y1=xl+phi1d;
      y2=xu-phi1d;
      f1=-fvm(x0+s.*y1);
      f2=-fvm(x0+s.*y2);
      while (err1>tol)
        if (f1<f2)
          xu=y1;
          y1=y2;
          f1=f2;
          phi1d=phi1*(xu-xl);
          y2=xu-phi1d;
          f2=-fvm(x0+s.*y2);
        else
          xl=y2;
          y2=y1;
          f2=f1;
          phi1d=phi1*(xu-xl);
          y1=xl+phi1d;
          f1=-fvm(x0+s.*y1);
        endif
        err1=xu-xl;
      end
      alpha=(xl+xu)*0.5
     x1=x0+s.*alpha;
     err=max(abs(s.*alpha)); 
     x0=x1;
     n=n+1;
   end
  steepest=x1;
  disp(fvm(x1));
  disp(n);
endfunction