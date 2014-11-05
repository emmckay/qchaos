function [E] = laguerre(n,k,norma)
    % calculate schmidt eigenvalues of k n by n matrices from laguerre ensemble
    % norma = 1 - normalised laguerre matrices
    % norma = 0 - not normalised
    
    q = sqrt(n);
    E = zeros(k,q);
    
    for ii = 1:k
        G = (randn(n) + 1i*randn(n)) / sqrt(2);
        W = (G * G')/n;
        
        if norma == 1
            W = normalise(W);
        else
            break
        end
        
        A = TrX(W,2,[q,q]);
        E(ii,:) = eig(A);
    end
