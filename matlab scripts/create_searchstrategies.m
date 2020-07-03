%one should load the cobegame.csv from cobe lab final folder
% or the all_bacthes from mturk final folder
% or the alien game data from cog sci folder
y=length(eight);

reference_prev=zeros(y,1);
start_id=zeros(y,1);
max_so_far=zeros(y,1);
max_so_far_index=zeros(y,1);
interdep1=zeros(y,1);
interdep2=zeros(y,1);
interdep=zeros(y,1);
MB=zeros(y,1);
succ_f=zeros(y,1);
for i=2:y
    if Id(i)==Id(i-1)&&session(i)==session(i-1)
       reference_prev(i)=i-1;
    end
end

start_id(1)=1;
for i=2:y
    if Id(i)==Id(i-1)&&session(i)==session(i-1)
        start_id(i)=start_id(i-1);
    else
       start_id(i)=i;
    end
end

for i=2:y
    if Id(i)==Id(i-1)
        if session(i)==session(i-1)
            if score(i)>=max(score(start_id(i):i))
                succ_f(i)=0;
                max_so_far(i)=score(i);
                max_so_far_index(i)=i;
            else
                max_so_far(i)=max_so_far(i-1);
                max_so_far_index(i)=max_so_far_index(i-1);
                succ_f(i)=succ_f(i-1)+1;
            end
        else
            max_so_far(i)=score(i); 
            max_so_far_index(i)=i;
        end
    else
         max_so_far(i)=score(i); 
         max_so_far_index(i)=i;
        
    end
end

for i=2:y
    if Id(i)==Id(i-1)&&session(i)==session(i-1)
    hamming_prev(i)=abs(one(i)-one(reference_prev(i)))+abs(two(i)-two(reference_prev(i)))...
        +abs(three(i)-three(reference_prev(i)))+abs(four(i)-four(reference_prev(i)))...
        +abs(five(i)-five(reference_prev(i)))+abs(six(i)-six(reference_prev(i)))...
        +abs(seven(i)-seven(reference_prev(i)))+abs(eight(i)-eight(reference_prev(i)));
    end
end

for i=3:y
    if Id(i)==Id(i-1)&&session(i)==session(i-1)
    hamming_best(i)=abs(one(i)-one(max_so_far_index(i-1)))+abs(two(i)-two(max_so_far_index(i-1)))...
        +abs(three(i)-three(max_so_far_index(i-1)))+abs(four(i)-four(max_so_far_index(i-1)))...
        +abs(five(i)-five(max_so_far_index(i-1)))+abs(six(i)-six(max_so_far_index(i-1)))...
        +abs(seven(i)-seven(max_so_far_index(i-1)))+abs(eight(i)-eight(max_so_far_index(i-1)));
    end
end

for i=2:y
    if Id(i)==Id(i-1)&&session(i)==session(i-1)
    if abs(one(i)-one(reference_prev(i)))~=abs(two(i)-two(reference_prev(i)))
        interdep1(i)=interdep1(i)+1;
    end
    if abs(three(i)-three(reference_prev(i)))~=abs(four(i)-four(reference_prev(i)))
        if interdep1(i)>0
        interdep1(i)=0;
        end
    end
    if abs(five(i)-five(reference_prev(i)))~=abs(six(i)-six(reference_prev(i)))
        interdep2(i)=interdep2(i)+1;
    end
    if abs(seven(i)-seven(reference_prev(i)))~=abs(eight(i)-eight(reference_prev(i)))
        if interdep2(i)>0
        interdep2(i)=0;
        end
    end
    end
end

for i=2:y
    if interdep1(i)>0||interdep2(i)>0
        interdep(i)=1;
    end
end

%solini=[one(reference_prev(i)), two(reference_prev(i)), three(reference_prev(i)), four(reference_prev(i)), five(reference_prev(i)), six(reference_prev(i)), seven(reference_prev(i)), eight(reference_prev(i))]
%sol=[one(i), two(i), three(i), four(i), five(i), six(i), seven(i), eight(i)]
for i=2:y
    if Id(i)==Id(i-1)&&session(i)==session(i-1)
    if hamming_best(i)==2&&interdep(i)==0
        MB(i)=1;
    end
    end
end

for i=3:y
    if Id(i)==Id(i-2)&&session(i)==session(i-2)
       feedback_prev(i)=score(i-1)-score(i-2);
       feedback_max(i)=score(i-1)-max_so_far(i-2);
    end
end
max_so_far_index(1)=1;
x= bin2dec(num2str([one, two, three, four, five, six, seven, eight]));
y= bin2dec(num2str([one(max_so_far_index), two(max_so_far_index), ...
    three(max_so_far_index), four(max_so_far_index), ...
five(max_so_far_index), six(max_so_far_index), seven(max_so_far_index), eight(max_so_far_index)]));

