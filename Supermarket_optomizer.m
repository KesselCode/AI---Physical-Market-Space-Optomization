function [high_int,low_int] = Supermarket_optomizer(steps,size_of_test,num_attract_per_test,repeats,x_low,x_high,y_low,y_high,z_low,z_high)

attractors_loc=cell2mat(cell(size_of_test,3));

low_interest_loc=cell2mat(cell(size_of_test,3));

for i=1:(size_of_test*num_attract_per_test);
    for t=1:3;
        if t==1;
            attractors_loc(i,t) = rand()*(x_high-x_low) + x_low;
            low_interest_loc(i,t) = rand()*(x_high-x_low) + x_low;
        end
        if t==2;
            attractors_loc(i,t) = rand()*(y_high-y_low) + y_low;
            low_interest_loc(i,t) = rand()*(y_high-y_low) + y_low;
        end
        if t==3;
            attractors_loc(i,t) = rand()*(z_high - z_low) + z_low;
            low_interest_loc(i,t) = rand()*(z_high - z_low) + z_low;
        end
    end
end

for h=1:repeats;

    test_results = cell2mat(cell(size_of_test,1));

    for r=1:size_of_test;
        [position,wall_hit,step_attractor_was_bought,num_low_int_atract]=walk_Box_attractor_2(steps,attractors_loc((r*num_attract_per_test):((r+1)*num_attract_per_test-1),:),low_interest_loc((r*num_attract_per_test):((r+1)*num_attract_per_test-1),:),x_low,x_high,y_low,y_high,z_low,z_high);
        test_results(r,1)= num_low_int_atract;
    end

    t=num_attract_per_test*0.05;

    
    number_down = 0;
    
    for w=1:size_of_test;
        if (test_results(w,1)>t);
        attractor_loc=attractor_loc([1:w*num_attract_per_test,(w+1)*num_attract_per_test:end],:);
        low_interest_loc=low_interest_loc([1:w*num_attract_per_test,(w+1)*num_attract_per_test:end],:);
        number_down=number_down+1;
        end
    end
    size_of_test = size_of_test - number_down;
end

high_int=attractors_loc;

low_int=low_interest_loc;

plot(attractors_loc);

plot(low_interest_loc);
    
    
end








