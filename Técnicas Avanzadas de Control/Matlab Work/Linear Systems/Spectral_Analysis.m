% Class Algorithm Spectral Factorization
classdef Spectral_Analysis
    
    methods(Static)
        
        % Method. Calculus of covariance
        function covariance = Covar(vect , num, index)         

            barx = mean(vect(1:num));
            covariance = zeros(1,index);
       
            for i = 0 : index - 1
                
                sum = 0;              
                for j = 1 : num 
                  
                   buff = (vect(j) - barx) * (vect(j + i) - barx);
                   sum =  sum + buff;
                end
                
                covariance(i + 1) = 1/(num - 1) * sum;
            end
        end
        
        % Method. Fourier Transform
        function fourier = Fourier(vector)
            
            fourier = zeros(1, length(vector));
            w = 0;
            h = pi/(length(vector) - 1);
            
            for i = 1 : length(vector);
     
                sum = 0;
                for j = 2 : length(vector)
                   
                    sum = sum + vector(j) * cos((j-1)*w);
                end
                
                fourier(i) = vector(1) + 2 * sum;     
                w = w + h;
            end
        end
            
        % Method. Matrix for the Least Square algorithm
        function A = Create_Matrix(spectral, m, n)

            A = zeros(length(spectral), m+n+1);
            w = 0;
            h = pi/(length(spectral) - 1);
            T = 1;

            for j = 1 : length(spectral)
                for i = 0 : m
                   A(j, 1 + i) = cos(i * w * T);
                end

                for i = 1 : n
                    A(j, 1 + m + i) = -spectral(j) * cos (i * w * T);                  
                end
                
                w = w + h;
            end
        end
        
        % Method. Least Square Algorithm
        function p = Least_Square(spectral, m, n)
           
            A = Spectral_Analysis.Create_Matrix(spectral, m, n);
            
            p = (A'*A)\(A'*spectral');
        end
        
        % Method. Calculus of roots from parameters
        function [num, den] = CalculateRoots(p)
           
            if length(p) == 5
                num = roots([1 p(2)/p(3) 2*p(1)/p(3) p(2)/p(3) 1]);
                den = roots([1 p(4)/p(5) 2/p(5) p(4)/p(5) 1]);
            end
            if length(p) == 3
                num = roots([1 2*p(1)/p(2) 1]);
                den = roots([1 2/p(3) 1]);
            end
        end
        
        % Method. Calculus of standard deviation and variance
        function [sigma, variance] = CalculateWNoise(p,zeros,poles)
           
           prod_zeros = 1;
           for i = 1:length(zeros)
               prod_zeros = prod_zeros*zeros(i);
           end
           
           prod_poles = 1;
           for i = 1:length(poles)
               prod_poles = prod_poles*poles(i);
           end
           
           if length(p) == 5    
               variance =  (p(3)/p(5))*prod_poles/prod_zeros;
               sigma = sqrt(variance);
           end
           if length(p) == 3    
               variance =  (p(2)/p(3))*prod_poles/prod_zeros;
               sigma = sqrt(variance);
           end
        end
    end
end
        
    