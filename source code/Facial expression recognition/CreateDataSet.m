%Create m file consider to trainset percent
function CreateDataSet(TrainSetSize,DataSetNumber,PerSamNumber,File2Save)
global showflag;
%Set the defualt value
if nargin<1    
    TrainSetSize=1; %TestSetSize=100-TranSetSize   
    DataSetNumber=13;
    PerSamNumber=1;
    File2Save='DataSetname.mat';
end
TestSetSize=100-TrainSetSize;
DataSetPath = 0;%uigetdir(strcat(matlabroot,'\work'), 'Select DataSet path.' );
if length(DataSetPath)==1
    tmppath=pwd;
    cd(tmppath);
    tmppath=[];
    cd('..');
    tmppath=pwd;    
    DataSetPath=strcat(tmppath,'\DataSet');
end
TrainSample.DataSerDirectory=DataSetPath;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Class_Number=0;
        cd (DataSetPath);
        AllDirectory=dir;
        for i = 1:size(AllDirectory,1)
            if not(strcmp(AllDirectory(i).name,'.')|strcmp(AllDirectory(i).name,'..')|strcmp(AllDirectory(i).name,'Thumbs.db'))
                Class_Number = Class_Number + 1; % Number of all images in the training database
                DirName(Class_Number).Name=AllDirectory(i).name;
            end
        end
        fprintf('Building dataset... \n');
             fprintf('Class number is =%d \n and sample number is=%d \n',Class_Number,PerSamNumber) ;
        for i=1:Class_Number
                if showflag==1
            fprintf('Class number(%d) processed \n',i);
                end
            FolderPath=strcat(DataSetPath,'\',DirName(i).Name);
%             FolderPath=strcat(DataSetPath);%,'\',DirName(i).Name);            
             cd(FolderPath);
            AllFiles=dir('*.TIF');
%             FileNum=size(AllFiles,1);
%             cd('..\face');
            if PerSamNumber==0
                FileNum=size(AllFiles,1);
            else
                FileNum=PerSamNumber;
            end
            ind=[1:FileNum];
            train_Number=round(TrainSetSize/100*FileNum);
            TSIdx= randsample(ind,train_Number);
            TrCounter=1;
             TsCounter=1;
            for j=1:FileNum
%                      TrainSample.img(TrCounter).data=imreadbw(AllFiles(j).name);
%                     TrainSample.img(TrCounter).name=strcat(FolderPath,'\',AllFiles(j).name);
%                     TrCounter=TrCounter+1;
                
                if  (find(j==TSIdx))
                     TrainSample(i).img(TrCounter).data=imreadbw(AllFiles(j).name);
                    TrainSample(i).img(TrCounter).name=strcat(FolderPath,'\',AllFiles(j).name);
                    TrCounter=TrCounter+1;
                else
                     TestSample(i).img(TsCounter).data=imreadbw(AllFiles(j).name);
                    TestSample(i).img(TsCounter).name=strcat(FolderPath,'\',AllFiles(j).name);
                    TsCounter=TsCounter+1;
                end
            end
               clear FolderPath;
               clear AllFiles;
        end
        fprintf('\n creation done successfull. \n');
        fprintf('mat file saved in:  ');
        disp(DataSetPath);
        fprintf('\n \t \t Filename:');
        disp(File2Save);
        fprintf(' \n');
         cd('../..');
          cd('Facial expression key points_a');
%         cd(strcat(pwd,'\My_Implementetion\MGS-SIFTPaperSource_Rate'));
        if exist(File2Save,'file')==1
            delete(File2Save);
        end
        save(File2Save,'TrainSample','TestSample');
        
