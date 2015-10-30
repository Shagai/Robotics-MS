classdef Stochastic_Homework
    
    methods(Static)
       
        function s = Spectral(array, steps)
            
            s = zeros(1,length(steps));
            middle = floor(length(array)/2);
            c0 = array(middle);
                
            for j = 1:length(steps)
                
                sum = 0;
                for h = (middle + 1):length(array)
                    sum = sum + array(h)*cos(2*pi*h/(length(array) - (middle +1))*j);
                end

                s(j) = c0 + 2*sum;
            end
        end
    end
end