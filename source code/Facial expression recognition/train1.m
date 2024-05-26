clear all;
close all;
clc;
%////////////////////////////////////////////////////////////
FaceState=['AN';'DI';'FE';'HA';'NE';'SA';'SU';]; % i
% FaceState=['HA';];
% PersonName=['Untitled-1'];
 PersonName=['KA';'KL';'KM';'KR';'MK';'NA';'NM';'TM';'UY';'YM';]; % j
%  PersonName=['TM';];
r=1;
for i=1:7
    i;
    PerName='';
    for j=1:10
        j;
        cd ('E:\JAFFE\');
        AllFile=dir('*.TIF');
        cc=1;        
        for ll=1:length(AllFile(:,1))
            TotalName(ll,1:length(AllFile(ll,1).name))=AllFile(ll,1).name;        
            if (strfind(TotalName(ll,:),FaceState(i,:)))
                if  (strfind(TotalName(ll,:),PersonName(j,:)))
                   PerName(cc,1:length(TotalName(ll,:)))=TotalName(ll,:);
                   cc=cc+1;
                end                
            end
        end
%     end
% end
% for i=1:4
%     for j=1:5
            
            
                %  finding consider faces
            %
     cd ('C:\Users\computer\Documents\MATLAB\New Folder\facial expression121');
 for k=1:length(PerName(:,1))
         h=imread(strcat('E:\JAFFE\',PerName(k,:)));
               
%          [row col depth]=size(h);
    
   %////////////////////////////////////////////////////     
         
% h=imread('KL.NE2.156.tiff');

% figure;
[row col depth]=size(h);
% imshow(h);

%////////////////////////////////////////////////

h(127:129,97:99)=255;           %dot 0
h(127:129,82:84)=255;           %dot 1
h(120:122,97:99)=255;           %dot 2
h(127:129,110:112)=255;         %dot 3
h(134:136,97:99)=255;           %dot 4
h(127:129,160:162)=255;         %dot 5
h(127:129,175:177)=255;         %dot 6
h(120:122,160:162)=255;         %dot 7
h(127:129,149:151)=255;         %dot 8
h(134:136,160:162)=255;         %dot 9
h(109:111,75:77)=255;           %dot 10
h(105:107,90:92)=255;           %dot 11
h(107:109,110:112)=255;         %dot 12
h(107:109,182:184)=255;         %dot 13
h(103:105,165:167)=255;         %dot 14
h(105:107,150:152)=255;         %dot 15
h(80:82,100:102)=255;           %dot 16
h(80:82,130:132)=255;           %dot 17
h(80:82,160:162)=255;           %dot 18
h(127:129,130:132)=255;         %dot 19
h(155:157,80:82)=255;           %dot 20
h(155:157,175:177)=255;         %dot 21
h(175:177,130:132)=255;         %dot 22
h(175:177,113:115)=255;         %dot 23
h(175:177,146:148)=255;         %dot 24
h(197:199,106:108)=255;         %dot 25
h(195:197,127:129)=255;         %dot 26
h(197:199,147:149)=255;         %dot 27
h(210:212,127:129)=255;         %dot 28
h(185:187,80:82)=255;           %dot 29
h(185:187,175:177)=255;         %dot 30
h(223:225,106:108)=255;         %dot 31
h(230:232,127:129)=255;         %dot 32
h(223:225,147:149)=255;         %dot 33

figure;
imshow(h);
%//////////////////////////////////////////////////////////
 
 
 x1=h(128:130,98:100);
 x2=h(128:130,83:85);
 x3=h(121:123,98:100);
 x4=h(128:130,111:113);
 x5=h(135:137,98:100);
 x6=h(128:130,161:163);
 x7=h(128:130,176:178);
 x8=h(121:123,161:163);
 x9=h(128:130,150:152);
 x10=h(135:137,161:163);
 x11=h(110:112,76:78);
 x12=h(106:108,91:93);
 x13=h(108:110,111:113);
 x14=h(108:110,183:184);
 x15=h(104:106,166:168);
 x16=h(106:108,150:152);
 x17=h(81:83,101:103);
 x18=h(81:83,131:133);
 x19=h(81:83,161:163);
 x20=h(128:130,131:133);
 x21=h(156:158,81:83);
 x22=h(156:158,176:178);
 x23=h(176:178,131:133);
 x24=h(176:178,114:116);
 x25=h(176:178,147:149);
 x26=h(198:200,107:109);
 x27=h(196:198,128:130);
 x28=h(198:200,148:150);
 x29=h(211:213,128:130);
 x30=h(186:188,81:83);
 x31=h(186:188,176:178);
 x32=h(224:226,107:108);
 x33=h(231:233,128:130);
 x34=h(224:226,148:150);
 norient=6;
 xx1=imresize(x1,[256,256]);
 xx2=imresize(x2,[256,256]);
 xx3=imresize(x3,[256,256]);
 xx4=imresize(x4,[256,256]);
 xx5=imresize(x5,[256,256]);
 xx6=imresize(x6,[256,256]);
 xx7=imresize(x7,[256,256]);
 xx8=imresize(x8,[256,256]);
 xx9=imresize(x9,[256,256]);
 xx10=imresize(x10,[256,256]);
 xx11=imresize(x11,[256,256]);
 xx12=imresize(x12,[256,256]);
 xx13=imresize(x13,[256,256]);
 xx14=imresize(x14,[256,256]);
 xx15=imresize(x15,[256,256]);
 xx16=imresize(x16,[256,256]);
 xx17=imresize(x17,[256,256]);
 xx18=imresize(x18,[256,256]);
 xx19=imresize(x19,[256,256]);
 xx20=imresize(x20,[256,256]);
 xx21=imresize(x21,[256,256]);
 xx22=imresize(x22,[256,256]);
 xx23=imresize(x23,[256,256]);
 xx24=imresize(x24,[256,256]);
 xx25=imresize(x25,[256,256]);
 xx26=imresize(x26,[256,256]);
 xx27=imresize(x27,[256,256]);
 xx28=imresize(x28,[256,256]);
 xx29=imresize(x29,[256,256]);
 xx30=imresize(x30,[256,256]);
 xx31=imresize(x31,[256,256]);
 xx32=imresize(x32,[256,256]);
 xx33=imresize(x33,[256,256]);
 xx34=imresize(x34,[256,256]);
 
%//////////////////////////////////////////////////////////////// 
count=1;
for DWScale=0:2
        
t(DWScale+1).a(1).data=GabFilter(h,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(2).data=GabFilter(x1,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(3).data=GabFilter(x2,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(4).data=GabFilter(x3,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(5).data=GabFilter(x4,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(6).data=GabFilter(x5,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(7).data=GabFilter(x6,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(8).data=GabFilter(x7,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(9).data=GabFilter(x8,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(10).data=GabFilter(x9,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(11).data=GabFilter(x10,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(12).data=GabFilter(x11,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(13).data=GabFilter(x12,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(14).data=GabFilter(x13,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(15).data=GabFilter(x14,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(16).data=GabFilter(x15,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(17).data=GabFilter(x16,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(18).data=GabFilter(x17,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(19).data=GabFilter(x18,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(20).data=GabFilter(x19,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(21).data=GabFilter(x20,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(22).data=GabFilter(x21,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(23).data=GabFilter(x22,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(24).data=GabFilter(x23,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(25).data=GabFilter(x24,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(26).data=GabFilter(x25,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(27).data=GabFilter(x26,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(28).data=GabFilter(x27,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(29).data=GabFilter(x28,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(30).data=GabFilter(x29,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(31).data=GabFilter(x30,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(32).data=GabFilter(x31,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(33).data=GabFilter(x32,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(34).data=GabFilter(x33,DWScale,norient,0,1,0.65,1.5);
t(DWScale+1).a(35).data=GabFilter(x34,DWScale,norient,0,1,0.65,1.5);
end
FV(r,1:612)=GetFeaturesCenter(t);
FV(r,613)=i;
%  FV(Col,1:length(fv))=fv;
%  FV(Col,length(fv)+1)=i;
 r=r+1;
%FV(r,614)=PersonName(j);
end % number of found photos
end %Number of person 10
end% end of i number of face state


%///////////////////////////////////////////////////////////////
% 
% figure;
% imshow(h);

% figure;
% showimg(t1);
% figure;
% showimg(t2);
% figure;
% showimg(t3);
% figure;
% showimg(t4);
% figure;
% showimg(t5);
% figure;
% showimg(t6);
% figure;
% showimg(t7);
% figure;
% showimg(t8);
% figure;
% showimg(t9);
% figure;
% showimg(t10);
% figure;
% showimg(t11);
% figure;
% showimg(t12);
% figure;
% showimg(t13);
% figure;
% showimg(t14);
% figure;
% showimg(t15);
% figure;
% showimg(t16);
% figure;
% showimg(t17);
% figure;
% showimg(t18);
% figure;
% showimg(t19);
% figure;
% showimg(t20);
% figure;
% showimg(t21);
% figure;
% showimg(t22);
% figure;
% showimg(t23);
% figure;
% showimg(t24);
% figure;
% showimg(t25);
% figure;
% showimg(t26);
% figure;
% showimg(t27);
% figure;
% showimg(t28);
% figure;
% showimg(t29);
% figure;
% showimg(t30);
% figure;
% showimg(t31);
% figure;
% showimg(t32);
% figure;
% showimg(t33);
% figure;
% showimg(t34);
% figure;
% showimg(t35);
% ////////////////////////////////////////////////
save('FV.mat','FV')

% FVTest=FVT;
% load('FVT.mat');
% % FVTrain=FV;
% x=FVT(:,1:612)
% y=FV(:,613);
% 
% y=ind2vec(y);
% y=full(y);
% save('FVTestSet.mat','x','y');

% [COEFF,SCORE] = princomp(FV);
% 






















