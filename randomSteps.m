%An array of random steps all of radius 1
function allstepdir = randomSteps(p);
stepDirectionsArray=cell(p,3);
for i=1:p
    phi = 2*pi*rand();
    theta = 2*pi*rand();
    X_new = sin(theta)*cos(phi);
    Y_new = sin(theta)*sin(phi);
    Z_new = cos(theta);
    for j=1:3
        if j==1
            stepDirectionsArray{i,j}=X_new;
        elseif j==2
            stepDirectionsArray{i,j}=Y_new;
        else
            stepDirectionsArray{i,j}=Z_new;
        end
    end
    clear X_new; 
    clear Y_new; 
    clear Z_new; 
    clear phi; 
    clear theta;
end
clear X_new; 
clear Y_new; 
clear Z_new; 
clear phi; 
clear theta;
allstepdir=cell2mat(stepDirectionsArray);
end


