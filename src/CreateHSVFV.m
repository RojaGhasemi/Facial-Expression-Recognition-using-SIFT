function [FeatureVec KeyNum]=CreateHSVFV(type,DataSet,showflag)
global K;
SampleNumber=size(DataSet,2);
PerSamNumber=size(DataSet(1).img,2);
KeyNum=0;
Radius=10;
Sigma=[1.3688 1.0910 1.2974 1.5429 1.8348 2.1820 2.5948];
%% ------------------------
    fprintf('\nClass number is =%d \n and sample number is=%d \n',SampleNumber,size(DataSet(1).img,2)) ;
    fprintf('\n');
for i=1:SampleNumber
    if showflag==1
    %         fprintf('Sample (%d) is processing... \n',i);
    if (mod(i,15)==0)
        fprintf('\n');
    end
    fprintf('S(%d),',i);
    end
    for j=1:PerSamNumber
%         Sample=imread(DataSet(i).img(j).name);
%         HSVImg=rgb2hsv(Sample);  
        if type=='g' 
% %             HSVImg=[];
            Sample=[];
            Sample=imreadbw(DataSet(i).img(j).name);
             [t1 t2]=GetSIFT(Sample,Sigma,Radius);        
%         elseif strcmp(type,'mgs' )==1
%             HSVImg=[];
%             Sample=[];
%             Sample=imreadbw(DataSet(i).img(j).name);
%             [t1 t2]=GetMGSSIFT(Sample,Sigma,Radius,K);           
        end
            FeatureVec(i).Descrt(j).data=t1;
            FeatureVec(i).Frame(j).data=t2; 
            KeyNumtmp(i,j)=size(t2,2);
        
        clear Sample;
        clear t1;
        clear t2;
        clear HSVImg;
    end
end
KeyNum(1:PerSamNumber)=sum(KeyNumtmp,1);
clear DataSet;

