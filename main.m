% This program is implemented by Manizheh Ghaemi (Author of article "Forest Optimization Algorithm")
% This program is distributed in the hope that it will be 
% useful, but WITHOUT ANY WARRANTY; EXPRESS OR IMPLIED.
% Questions/Comments: Please email Manizheh Ghaemi at:
% Manizheh.Ghaemi@yahoo.com.
% Proper Acknowledgements and authorship should be assured
% © Copyright Ghaemi
% 8/3/2014 University of Tabriz, Tabriz, Iran


function main(dimension, Iterations, ShowResults, area_limit, Life_time, Transfer_rate) 
clc;
disp('The output will show the whole population as well as the best member with the fitness value and the age of the tree')
disp('Please press any key to start optimizing')
pause
% Setting the default values for the parameters
if nargin < 6
   %dimension=5;        % The dimension of the problem domain
    Iterations=2000;    % Maximum number of iterations
    ShowResults=1;      % when ShowResults=1, the trees are displayed; when ShowResults=0, the trees are not displayed;
    area_limit=10;      % The limitation of the forest
    Life_time=15;       % The maximum allowed Age of a tree 
    Transfer_rate=10;   % The percentage of candidate population for global seeding 
end
 global ranges;
 Eval = @EvaluationRastrigin; % Change this name to be the name of your fitness function(m file)
 ranges =  [-5.12, 5.12;-4,4;-5.,5.1;-1.1,1.1;-2.9,2.9]; % The range of the variables where each variable has different range
 dimension=size(ranges,1); % you can spesify a fixed number 
Forest=InitializeForest(Eval,ranges,dimension,Iterations, area_limit, Life_time, Transfer_rate);
Forest=FOA(Forest,Eval,ShowResults);       
