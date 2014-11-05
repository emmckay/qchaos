function [E] = gauss(n,k,norma)
    % calculate schmidt eigenvalues of k n by n matrices from GUE
    % norma = 1 - normalised laguerre matrices
    % norma = 0 - not normalised
    
    q = sqrt(n);
    E = zeros(k,q);
    
    for ii = 1:k
        W = 0.5*randn(n) + 0.5i*rand(n);	% create GUE matrix
		for ii = 1:n
			W(ii,ii) = randn;
		end
        
        if norma == 1
            W = normalise(W);
        else
            break
        end
        
        A = TrX(W,2,[q,q]);
        E(ii,:) = eig(A);
    end
