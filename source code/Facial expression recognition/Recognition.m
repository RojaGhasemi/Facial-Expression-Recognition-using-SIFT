function [Corr Err SumMatchNum]=Recognition(Train,Test)
global showflag;
TsSetNum=size(Test,2);
TsSamNum=size(Test(1).Descrt,2);
Corr=0;
Err=0;
Sum=0;
matchnumtmp=0;
% fprintf('---------------------\n Start Recognizing... \n');
for i=1:TsSetNum
    for j=1:TsSamNum
            [MatchNum MatchIndx] =DoMatch(Train,Test(i).Descrt(j).data);
            EstClass(i).MatchNum(j)=MatchNum;
%             EstClass(i).MatchIndx(j)=MatchIndx;
              fprintf('\n Sample(->>%d<<-,%d)-Matched Sample(->>%d<<-)',i,j,MatchIndx);
                fprintf('(%d,%d)-(%d)',i,j,MatchIndx);
                if mod(i,20)==1
                    fprintf('\n');
                end
            if MatchIndx==i
                matchnumtmp(i,j)=MatchNum;          
                Corr=Corr+1;
            else
                Err=Err+1;
            end
            MatchNum=0;
            MatchIndx=0;
    end
end
SumMatchNum=sum(matchnumtmp,1);