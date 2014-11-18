%%%%%%%%%%%%%%%%% do not use this file; copy the if/else structure & THAT'S IT %%%%%%%%%%%%%%%%%%%%%%%

function S = GUEentropy(aang,rep,bins)
% calculates and plots a histogram of entropy of a subsystem of
% pure Haar random states of a bipartite system
	% dim - dimension of one subsystem; for kicked top = 2*aang+1
	% rep - sets of GUE matrices to perform analysis on
	dim = 2*aang+1;
	n = dim^2;
	S = zeros(rep,1);
	A = zeros(n);
	tic
	% parpool;
	
	parfor k = 1:rep
		k
		A = 0.5*randn(n) + 0.5i*rand(n);	% create GUE matrix
		for ii = 1:n
			A(ii,ii) = rand;
		end

		[V,D,flag] = eigs(A,3);
		
		if flag == 0
    		B = V(:,2)*V(:,2)';
    		B = TrX(B,2,[dim,dim]);
    		E = eig(B);
    		S(k) = real(-E'*log(E+(E==0)));
    	else if flag != 0
    	    if A*V(:,1) - D(1,1)*V(:,1) == 0
    	        B = V(:,1)*V(:,1)';
        		B = TrX(B,2,[dim,dim]);
        		E = eig(B);
        		S(k) = real(-E'*log(E+(E==0)));
        	else if A*V(:,2) - D(2,2)*V(:,2) == 0
    	        B = V(:,2)*V(:,2)';
        		B = TrX(B,2,[dim,dim]);
        		E = eig(B);
        		S(k) = real(-E'*log(E+(E==0)));
        	else if A*V(:,3) - D(3,3)*V(:,3) == 0
    	        B = V(:,3)*V(:,3)';
        		B = TrX(B,2,[dim,dim]);
        		E = eig(B);
        		S(k) = real(-E'*log(E+(E==0)));
        	else
        	    S(k) = 0;
        	end
        end
	end
	S = sort(S);
    for ii = 1:rep
        n = ii;
        if S(ii) != 0
            break
        end
    end
    S = S(n:rep);
	toc
	
	
