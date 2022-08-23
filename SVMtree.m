function Label = SVMtree(Pattern,...
                            rootBinary,...
                            lvl2LeftNhla,...
                            lvl2LeftNh,...
                            lvl2LeftNl,...
                            lvl2LeftNa,...
                            lvl2RightAhla,...
                            lvl2RightAh,...
                            lvl2RightAl,...
                            lvl2RightAa...
                            )




if(rootBinary.predictFcn(Pattern)==1)
    %Normal
    if(lvl2LeftNhla.predictFcn(Pattern)==24)
        %Hand
            if(lvl2LeftNh.predictFcn(Pattern)==2)
                %2  - 
                Label = 2;return;
            elseif(lvl2LeftNh.predictFcn(Pattern)==3)
                %3  - 
                Label = 3;return;
            elseif(lvl2LeftNh.predictFcn(Pattern)==4)
                %4  -
                Label = 4;return;
            else
                %10 - 
                Label = 10;return;

            end
            
    elseif(lvl2LeftNhla.predictFcn(Pattern)==25)
        %Leg
        
            if(lvl2LeftNl.predictFcn(Pattern)==5)
                %5- 
                Label = 5;return;
            elseif(lvl2LeftNl.predictFcn(Pattern)==6)
                %6-
                Label = 6;return;
            else
                %9-
                Label = 9;return;
            end
    else
        %Ambi
            if(lvl2LeftNa.predictFcn(Pattern)==1)
                %1-
                Label = 1;return;
            elseif(lvl2LeftNa.predictFcn(Pattern)==7)
                %7-
                Label = 7;return;
            else
                %8-
                Label = 8;return;
            end
    end
elseif(rootBinary.predictFcn(Pattern)==-1)
    %Aggressive
    if(lvl2RightAhla.predictFcn(Pattern)==21)
        %Hand
        if(lvl2RightAh.predictFcn(Pattern)==11)
            %11-
            Label = 11;return;
        elseif(lvl2RightAh.predictFcn(Pattern)==16)
            %16-
            Label = 16;return;
        elseif(lvl2RightAh.predictFcn(Pattern)==17)
            %17-
            Label = 17;return;
        elseif(lvl2RightAh.predictFcn(Pattern)==18)
            %18-
            Label = 18;return;
        else
            %20
            Label = 20;return;
            
        end
        
    elseif(lvl2RightAhla.predictFcn(Pattern)==22)
        %Leg
        
        if(lvl2RightAl.predictFcn(Pattern)==12)
            %12-
            Label = 12;return;
        elseif(lvl2RightAl.predictFcn(Pattern)==15)
            %15-
            Label = 15;return;
        else
            %19
            Label = 19;return;
        end
    else
        %Ambi
        if(lvl2RightAa.predictFcn(Pattern)==13)
            %13-
            Label = 13;return;
        elseif(lvl2RightAa.predictFcn(Pattern)==14)
            %14-
            Label = 14;return;
        end
    end
    
end

end
