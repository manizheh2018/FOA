function Forest = FOA(Forest, Eval, ShowResults)
% FOA gets the Forest of trees and runs FOA Optimization on the selected test function
%
% Input:
%     Forest:       Initialized random Forest consists of trees
%                   which is a matrix of length: n_Trees * (n_variables +2) 
%                   n_Trees: number of the trees in the Forest
%                   n_variables: number of the variables  of each tree
%                   (dimension)
%                   The last column indicates the "Age" of each tree 
%     Eval:         Evaluation function handler
%     ShowResults:  when ShowResults=1, the trees are displayed; 
%                   when ShowResults=0, the trees are not displayed;
%
% Output:
%     Forest:       Optimized trees after the stop condition is satisfied
%
% © Copyright Ghaemi
% 8/3/2014 University of Tabriz, Tabriz, Iran
bestTree=Forest.T(randi([1 size(Forest.T,1)]),:);
tic;
% stop condition is the predefined number of iterations
for i=1:Forest.P.MaxIterations
    Forest=LocalSeeding(Forest,Eval);% local seeding
    [Forest,candidate]=PopulationLimiting(Forest);% population limiting
    Forest=GlobalSeeding(candidate,Forest,Eval);% global seeding
    [Forest,bestTree]=UpdateBestTree(Forest,bestTree); % Update the best tree
    disp('Population ')
    Forest.T
    bestTree
    pause;
end
Forest.Elapsed=toc;
disp('Forest Optimization Algorithm completed.');
disp(['Elapsed time: ' num2str(Forest.Elapsed) ' seconds.']);
if ShowResults  
    disp(['The trees of the Forest after the ' num2str(Forest.P.MaxIterations) ' number of iterations are:']);
    disp('(The first tree indicates the best tree.');
    disp([' The ' num2str(Forest.P.Dimension+1) 'th column is the fitness of the related tree']);
    disp([' The ' num2str(Forest.P.Dimension+2) 'th column is the "Age" of the related tree)']);
    for i=1:size(Forest.T(:,:),1)
        formatSpec = '%2.2e\t';
        disp(['(' num2str(i) '): ' num2str(Forest.T(i,:),formatSpec)]);
    end
end
save('..\FOA', 'Forest')
end %function


