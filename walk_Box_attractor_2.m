function [position,wall_hit,step_attractor_was_bought]=walk_Box_attractor_2(steps,attractors_loc,low_interest_loc,x_low,x_high,y_low,y_high,z_low,z_high)
position=cell2mat(cell(steps,3));
position(1,:)=[0,0,0];
wall_hit=0;
[initial_atc,q]=size(attractors_loc);
[initial_low,op]=size(low_interest_loc);
step_attractor_was_bought=cell2mat(cell(initial_atc(1,1),1));
step_low_int_was_bought=cell2mat(cell(initial_low(1,1),1));


for r=2:steps;
    if (~(isempty(attractors_loc)));
    [a,b]=size(attractors_loc);
    distance_between_pt_atrct=cell2mat(cell(a,1));
    for j=1:a;
        distance_between_pt_atrct(j,1)=sqrt((position(r-1,1)-attractors_loc(j,1))^2+(position(r-1,2)-attractors_loc(j,2))^2+(position(r-1,3)-attractors_loc(j,3))^2);
    end
        [M,I]=min(distance_between_pt_atrct(:));
        [row,col]=ind2sub(size(distance_between_pt_atrct),I);
        w=randomSteps(1);
            position(r,:)=position(r-1,:)+(2*w+(attractors_loc(row,:)/distance_between_pt_atrct(row,1)))/norm((2*w+(attractors_loc(row,:)/distance_between_pt_atrct(row,1))));
        if ((position(r,1)<x_low) || (position(r,1)>x_high));
            position(r,1)=-(position(r,1)-position(r-1,1))+position(r-1,1);
            wall_hit=wall_hit+1;
        end
        if ((position(r,2)<y_low) || (position(r,2)>y_high));
            position(r,2)=-(position(r,2)-position(r-1,2))+position(r-1,2);
            wall_hit=wall_hit+1;
        end
        if ((position(r,3)<z_low) || (position(r,3)>z_high));
            position(r,3)=-(position(r,3)-position(r-1,3))+position(r-1,3);
            wall_hit=wall_hit+1;
        end
        [c,y]=size(position);
            for t=1:c;
                [a,b]=size(attractors_loc);
                for m=1:a;
                    [c,d]=size(attractors_loc);
                    if (a==c);
                    distance_between_pt_atrct_2(m,1)=sqrt((position(t,1)-attractors_loc(m,1))^2+(position(t,2)-attractors_loc(m,2))^2+(position(t,3)-attractors_loc(m,3))^2);
                    if (distance_between_pt_atrct_2(m,1)<2);
                        attractors_loc=attractors_loc([1:(m-1),(m+1):end],:);
                        step_attractor_was_bought(1+initial_atc-a,1)=r;
                    end
                    end
                end
                [hu,ge]=size(low_interest_loc);
                for te=1:hu;
                     [ru,lu]=size(low_interest_loc);
                    if (hu==ru);
                    distance_between_pt_low_int(te,1)=sqrt((position(t,1)-low_interest_loc(te,1))^2+(position(t,2)-low_interest_loc(te,2))^2+(position(t,3)-low_interest_loc(te,3))^2);
                    if (distance_between_pt_low_int(te,1)<2);
                        low_interest_loc=low_interest_loc([1:(te-1),(te+1):end],:);
                        step_low_int_was_bought(1+initial_low-hu,1)=r;
                    end
                    end
                end
                
            end
        clear c
        clear a
    end
    clear w
end


figure;
plot3(position(:,1),position(:,2),position(:,3));

step_low_int_was_bought

end

