function  [descriptors frames]=GetSIFT(SampleImg,SigIn,RadIn)
%% <initial parameters>
 global I;
I=SampleImg;
% figure;
% imshow(I);
ShowGDFlag=0;
ApproachNum=1;
PyrNum=4;    %Pyramid number
SigNum=6;    %Sigma number
EliminateFlag=1; %Flag for Eliminate low contrast.
SigValue=[];
[M,N,C] = size(I) ;
frames=[];
descriptors=[];
% Lowe's choices
S=3 ;
omin=-1 ;
O=floor(log2(min(M,N)))-omin-4 ; % Up to 16x16 images
PyrNum=O;
sigma0=1.6*2^(1/S) ;
sigman=0.5 ;
SigValue=SigIn;
thresh=0.005;% 0.04 / (S-1) / 2 ;
r = RadIn;%10 ;
NBP = 4 ;
NBO = 8 ;
magnif = 3.0 ;
S=4;
% fprintf(' -  Octave num= %d \n',O);
if (ApproachNum==1)
    GaussImg=gaussianss(I,sigman,O,S,omin,-1,S+1,sigma0) ;
%     fprintf(' -  Approach= Lowe.');    
else
    GaussImg=GaussianImg(I,PyrNum,SigValue);   
%     fprintf(' -  Approach= My App.');
end
% fprintf('\n--------------------------------');
% fprintf('\n - Gaussian...  \n ') ;
GaussImg.OctNum=PyrNum;
GaussImg.S=4;
GaussImg.SigNum=length(SigValue);
GaussImg.smin=-1;
GaussImg.omin=-1;
GaussImg.sigma0=2.0159;
showlabel=1;
if (ApproachNum==1)
    DiffGaussImg = diffss(GaussImg) ;
else
    DiffGaussImg=DiffGaussianImg(GaussImg,PyrNum);
end
%% -------------------
DiffGaussImg.OctNum = GaussImg.OctNum ;
DiffGaussImg.SigNum = GaussImg.SigNum-1 ;
DiffGaussImg.smin=-1;
%%
for o=1:PyrNum
%     fprintf('---------------------\n - Step1:(Octave#= %d) Extracting Features points. \n',o) ;
    %%-------------
%     idx = siftlocalmax( DiffGaussImg.octave{o} , 0.8*thresh  ) ;
%     idx = [idx , siftlocalmax( - DiffGaussImg.octave{o}, 0.8*thresh)] ;  
%     K=length(idx) ; 
%   	[i,j,s] = ind2sub( size( DiffGaussImg.octave{1,1} ), idx )
% 	y=i-1 ;
% 	x=j-1 ;
    %%------------------------------
    [x y]=findpoints1();
    K=length(x);
    %%-------------
%     s=0;
%     s=s-1+DiffGaussImg.smin ;
    s=zeros(1,K);
    oframes=cat(1,x,y);
    oframes=cat(1,oframes,s);
%      oframes = [x(:); y(:) ;s(:)] ;
      %oframes = [x(:)';y(:)';s(:)'] ;
%      fprintf('\t\t Keypoint Num= %4d \t  \n',length(oframes(1,:)));
%%    Remove points too close to the boundary
%      if EliminateFlag==1
%           rad = magnif * sigma0 * 2.^(oframes(3,:)/S) * NBP / 2 ;
%           sel=find(...
%           oframes(1,:)-rad >= 1                     & ...
%            oframes(1,:)+rad <= size(GaussImg.octave{o},2) & ...
%            oframes(2,:)-rad >= 1                     & ...
%           oframes(2,:)+rad <= size(GaussImg.octave{o},1)     ) ;
%             oframes=oframes(:,sel) ;
%      end
%     fprintf('\t Remove points too close to the boundary. \n\t\t Keypoint Num= %4d',length(oframes(1,:)));     
     	% Refine the location, threshold strength and remove points on edges
% 	 oframes = siftrefinemx(...
% 		oframes, ...
% 		DiffGaussImg.octave{o},  -1,thresh, r) ;
%     fprintf('\n\t Refine the location, threshold strength and remove points on edges. \n\t\t  Keypoint Num= %4d',length(oframes(1,:)));         
      % Compute the oritentations
	 oframes = siftormx(...
		oframes, ...
		GaussImg.octave{o}, ...
		GaussImg.S, ...
		GaussImg.smin, ...
		GaussImg.sigma0 ) ;
  % Store frames
	x     = 2^(o-1+GaussImg.omin) * oframes(1,:) ;
	y     = 2^(o-1+GaussImg.omin) * oframes(2,:) ;
	sigma = 2^(o-1+GaussImg.omin) * GaussImg.sigma0 * 2.^(oframes(3,:)/GaussImg.S) ;		
	frames = [frames, [x(:)' ; y(:)' ; sigma(:)' ; oframes(4,:)] ] ;
%     fprintf('\n - Step2: Describing Features points \n') ;    
    % Descriptors
    	sh = siftdescriptor(...
			GaussImg.octave{o}, ...
      oframes, ...
      GaussImg.sigma0, ...
      GaussImg.S, ...
      GaussImg.smin, ...
      'Magnif', magnif, ...
      'NumSpatialBins', NBP, ...
      'NumOrientBins', NBO) ;    
    descriptors = [descriptors, sh] ;    
end
