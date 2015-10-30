%Class Probability
classdef Probability_Homework
    
    methods(Static)
        
        %Calculate the mean of array
        function mean = mean(array)
            sum = 0;

            %%Sum all elements of array
            for i = 1:length(array)
                sum = sum + array(i);
            end

            % Divide between the number of elements of array
            mean = sum / length(array);
        end       
        
        %Calculate the biased variance
        function var = varianceBias(array)
            sum = 0;
            
            for i = 1:length(array)
                sum = sum + array(i)^2;
            end

            var = sum / length(array) - Probability_Homework.mean(array)^2;
        end
        
        %Calculate the unbiased variance
        function var = varianceUnBias(array)
                        
            var = (length(array)/(length(array) - 1)) * ...
                        Probability_Homework.varianceBias(array);
        end
        
        %Calculate the standard deviation
        function std = standardDeviation(array)            
            
            std = sqrt(Probability_Homework.varianceUnBias(array));
            
        end
        
        %Calculate the biased covariance
        function cov = covarianceBias(array1, array2)
            
            covXX = Probability_Homework.mean(array1.*array1) - Probability_Homework.mean(array1)^2;
            covXY = Probability_Homework.mean(array1.*array2) - Probability_Homework.mean(array1)*...
                        Probability_Homework.mean(array2);
            covYY = Probability_Homework.mean(array2.*array2) - Probability_Homework.mean(array2)^2;
            
            cov = [covXX covXY; covXY covYY];
        end
        
        %Calculate the unbiased covariance
        function cov = covarianceUnBias(array1, array2)
            
            covMat = Probability_Homework.covarianceBias(array1, array2);
            cov = covMat.*length(array1)/(length(array1)-1); 
        end
        
        %Calculate the correlation matrix
        function corr = correlation(array1, array2)
            
            cov = Probability_Homework.covarianceUnBias(array1, array2);
            corrXY = cov(1,2)/sqrt(cov(1,1)*cov(2,2));
            
            cov = Probability_Homework.covarianceUnBias(array1, array1);
            corrXX = cov(1,2)/sqrt(cov(1,1)*cov(2,2));
            
            cov = Probability_Homework.covarianceUnBias(array2, array2);
            corrYY = cov(1,2)/sqrt(cov(1,1)*cov(2,2));
            
            corr = [corrXX corrXY; corrXY corrYY];
        end
    end
end
