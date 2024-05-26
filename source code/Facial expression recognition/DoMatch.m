function  [MatchNum Indx ]=DoMatch(Train,Test)
TrSetNum=size(Train,2);
TrSamNum=size(Train(1).Descrt,2);
Max.MatchNum=0;
Max.Ind=0;
for i=1:TrSetNum
    for j=1:TrSamNum
        if (size(Train(i).Descrt(j).data,2)<2)
            continue;
        end
           matchedNum=siftmatch( Test,Train(i).Descrt(j).data, 3 ) ; 
           if (size(matchedNum,2)>Max.MatchNum)
               Max.MatchNum=size(matchedNum,2);
               Max.Ind=i;
           end
    end
end
MatchNum=Max.MatchNum;
Indx=Max.Ind;