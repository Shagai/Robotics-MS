classdef Caract_ZTransform
    %CARACT_ZTRANSFORM Identify a Discrete Transfer Function
    %   Get the input vector, u, and the output vector,y , and
    % it calculates the transfer function.
    
    properties(GetAccess = private, SetAccess = private)
        u % Input vector
        y % Output vector
    end
    
    methods
        % Initialize the Caract_ZTransform class
        function obj = Caract_ZTransform(u, y)
            obj.u = u;
            obj.y = y;
        end
        
        % Build the Phi Matrix
        function Phi = PhiMatrix(obj, n, m)
            
            Phi = zeros(length(obj.y) - 1, n + m);
            
            for i = 1 : (length(obj.y) - 1)
                for j = 1: n 
                   
                    if (j <= i)
                        Phi(i,j) = -obj.y(i - j + 1);
                    end
                end
                
                for k = 1: m
                    
                    if (k <= i)
                        Phi(i,n + k) = obj.u(i - k + 1);
                    end
                end
            end
        end
        
        % Calculate the parameters of the transfer function
        function Tetha = LeastSquares(obj, n, m)
            Phi = obj.PhiMatrix(n, m);
            
            Tetha = (Phi'*Phi)\(Phi'*obj.y(2:length(obj.y)));
        end
    end  
end

