%This is an implementation of the DRL(dimension reduction of landscape)
%method on Melanoma model.
%citation:Kang, Xin, and Chunhe Li. 
%"A Dimension Reduction Approach for Energy Landscape: Identifying Intermediate States in Metabolism‐EMT Network." 
%Advanced Science 8.10 (2021): 2003133.
%param_index 1-3 for tetra_landscape, param_index 4-5 for penta_landscape
cycle_index=0;  %% The number of random initial conditions to the ODEs to be solved, recommend more than 3000;
path='../params/';
nst='Tables.csv';
opts=detectImportOptions(strcat(path,nst))
preview(strcat(path,nst),opts)
% The parameters of the ODE
[ Figure	Number_of_steady_states	Prod_of_AHR	Prod_of_NFIC	Prod_of_FOS	Prod_of_KLF4	Prod_of_FOXF1	Prod_of_JUN	Prod_of_SMAD3	Prod_of_MITF	Prod_of_SMAD4	Prod_of_MAFB	Prod_of_NR3C1	Prod_of_NR2F1	Prod_of_STAT5A	Prod_of_TBX3	Prod_of_TFE3	Prod_of_ETV5	Prod_of_TFAP2A	Deg_of_AHR	Deg_of_NFIC	Deg_of_FOS	Deg_of_KLF4	Deg_of_FOXF1	Deg_of_JUN	Deg_of_SMAD3	Deg_of_MITF	Deg_of_SMAD4	Deg_of_MAFB	Deg_of_NR3C1	Deg_of_NR2F1	Deg_of_STAT5A	Deg_of_TBX3	Deg_of_TFE3	Deg_of_ETV5	Deg_of_TFAP2A	Trd_of_AHRToAHR	Num_of_AHRToAHR	Inh_of_AHRToAHR	Trd_of_NFICToAHR	Num_of_NFICToAHR	Act_of_NFICToAHR	Trd_of_FOSToAHR	Num_of_FOSToAHR	Inh_of_FOSToAHR	Trd_of_NR3C1ToNFIC	Num_of_NR3C1ToNFIC	Act_of_NR3C1ToNFIC	Trd_of_MITFToNFIC	Num_of_MITFToNFIC	Inh_of_MITFToNFIC	Trd_of_AHRToFOS	Num_of_AHRToFOS	Inh_of_AHRToFOS	Trd_of_NR3C1ToFOS	Num_of_NR3C1ToFOS	Inh_of_NR3C1ToFOS	Trd_of_SMAD3ToFOS	Num_of_SMAD3ToFOS	Act_of_SMAD3ToFOS	Trd_of_NFICToFOS	Num_of_NFICToFOS	Inh_of_NFICToFOS	Trd_of_MITFToFOS	Num_of_MITFToFOS	Act_of_MITFToFOS	Trd_of_SMAD4ToFOS	Num_of_SMAD4ToFOS	Act_of_SMAD4ToFOS	Trd_of_FOSToFOS	Num_of_FOSToFOS	Inh_of_FOSToFOS	Trd_of_AHRToKLF4	Num_of_AHRToKLF4	Act_of_AHRToKLF4	Trd_of_JUNToKLF4	Num_of_JUNToKLF4	Act_of_JUNToKLF4	Trd_of_NR3C1ToKLF4	Num_of_NR3C1ToKLF4	Act_of_NR3C1ToKLF4	Trd_of_SMAD3ToKLF4	Num_of_SMAD3ToKLF4	Act_of_SMAD3ToKLF4	Trd_of_TBX3ToKLF4	Num_of_TBX3ToKLF4	Act_of_TBX3ToKLF4	Trd_of_MITFToKLF4	Num_of_MITFToKLF4	Inh_of_MITFToKLF4	Trd_of_KLF4ToFOXF1	Num_of_KLF4ToFOXF1	Act_of_KLF4ToFOXF1	Trd_of_JUNToJUN	Num_of_JUNToJUN	Act_of_JUNToJUN	Trd_of_SMAD3ToJUN	Num_of_SMAD3ToJUN	Act_of_SMAD3ToJUN	Trd_of_KLF4ToJUN	Num_of_KLF4ToJUN	Act_of_KLF4ToJUN	Trd_of_MITFToJUN	Num_of_MITFToJUN	Inh_of_MITFToJUN	Trd_of_SMAD4ToJUN	Num_of_SMAD4ToJUN	Act_of_SMAD4ToJUN	Trd_of_AHRToSMAD3	Num_of_AHRToSMAD3	Act_of_AHRToSMAD3	Trd_of_JUNToSMAD3	Num_of_JUNToSMAD3	Act_of_JUNToSMAD3	Trd_of_NR3C1ToSMAD3	Num_of_NR3C1ToSMAD3	Act_of_NR3C1ToSMAD3	Trd_of_NFICToSMAD3	Num_of_NFICToSMAD3	Act_of_NFICToSMAD3	Trd_of_FOSToSMAD3	Num_of_FOSToSMAD3	Inh_of_FOSToSMAD3	Trd_of_AHRToMITF	Num_of_AHRToMITF	Inh_of_AHRToMITF	Trd_of_JUNToMITF	Num_of_JUNToMITF	Inh_of_JUNToMITF	Trd_of_NR3C1ToMITF	Num_of_NR3C1ToMITF	Act_of_NR3C1ToMITF	Trd_of_SMAD3ToMITF	Num_of_SMAD3ToMITF	Inh_of_SMAD3ToMITF	Trd_of_KLF4ToMITF	Num_of_KLF4ToMITF	Inh_of_KLF4ToMITF	Trd_of_MITFToMITF	Num_of_MITFToMITF	Act_of_MITFToMITF	Trd_of_SMAD4ToMITF	Num_of_SMAD4ToMITF	Act_of_SMAD4ToMITF	Trd_of_NR3C1ToSMAD4	Num_of_NR3C1ToSMAD4	Inh_of_NR3C1ToSMAD4	Trd_of_MAFBToMAFB	Num_of_MAFBToMAFB	Act_of_MAFBToMAFB	Trd_of_NR3C1ToMAFB	Num_of_NR3C1ToMAFB	Act_of_NR3C1ToMAFB	Trd_of_AHRToNR3C1	Num_of_AHRToNR3C1	Act_of_AHRToNR3C1	Trd_of_JUNToNR3C1	Num_of_JUNToNR3C1	Act_of_JUNToNR3C1	Trd_of_SMAD3ToNR3C1	Num_of_SMAD3ToNR3C1	Act_of_SMAD3ToNR3C1	Trd_of_NFICToNR3C1	Num_of_NFICToNR3C1	Act_of_NFICToNR3C1	Trd_of_FOSToNR3C1	Num_of_FOSToNR3C1	Inh_of_FOSToNR3C1	Trd_of_NR3C1ToNR2F1	Num_of_NR3C1ToNR2F1	Act_of_NR3C1ToNR2F1	Trd_of_KLF4ToNR2F1	Num_of_KLF4ToNR2F1	Act_of_KLF4ToNR2F1	Trd_of_NFICToNR2F1	Num_of_NFICToNR2F1	Act_of_NFICToNR2F1	Trd_of_FOSToNR2F1	Num_of_FOSToNR2F1	Inh_of_FOSToNR2F1	Trd_of_STAT5AToSTAT5A	Num_of_STAT5AToSTAT5A	Act_of_STAT5AToSTAT5A	Trd_of_MITFToSTAT5A	Num_of_MITFToSTAT5A	Act_of_MITFToSTAT5A	Trd_of_SMAD3ToTBX3	Num_of_SMAD3ToTBX3	Act_of_SMAD3ToTBX3	Trd_of_TBX3ToTBX3	Num_of_TBX3ToTBX3	Act_of_TBX3ToTBX3	Trd_of_KLF4ToTBX3	Num_of_KLF4ToTBX3	Act_of_KLF4ToTBX3	Trd_of_NFICToTBX3	Num_of_NFICToTBX3	Act_of_NFICToTBX3	Trd_of_JUNToTFE3	Num_of_JUNToTFE3	Act_of_JUNToTFE3	Trd_of_TFE3ToTFE3	Num_of_TFE3ToTFE3	Inh_of_TFE3ToTFE3	Trd_of_NFICToTFE3	Num_of_NFICToTFE3	Act_of_NFICToTFE3	Trd_of_MITFToTFE3	Num_of_MITFToTFE3	Inh_of_MITFToTFE3	Trd_of_FOSToTFE3	Num_of_FOSToTFE3	Inh_of_FOSToTFE3	Trd_of_NR3C1ToETV5	Num_of_NR3C1ToETV5	Inh_of_NR3C1ToETV5	Trd_of_ETV5ToETV5	Num_of_ETV5ToETV5	Act_of_ETV5ToETV5	Trd_of_MITFToETV5	Num_of_MITFToETV5	Act_of_MITFToETV5	Trd_of_NR2F1ToTFAP2A	Num_of_NR2F1ToTFAP2A	Act_of_NR2F1ToTFAP2A	Trd_of_MITFToTFAP2A	Num_of_MITFToTFAP2A	Act_of_MITFToTFAP2A] = readvars(strcat(path,nst));
par=[Prod_of_AHR	Prod_of_NFIC	Prod_of_FOS	Prod_of_KLF4	Prod_of_FOXF1	Prod_of_JUN	Prod_of_SMAD3	Prod_of_MITF	Prod_of_SMAD4	Prod_of_MAFB	Prod_of_NR3C1	Prod_of_NR2F1	Prod_of_STAT5A	Prod_of_TBX3	Prod_of_TFE3	Prod_of_ETV5	Prod_of_TFAP2A	Deg_of_AHR	Deg_of_NFIC	Deg_of_FOS	Deg_of_KLF4	Deg_of_FOXF1	Deg_of_JUN	Deg_of_SMAD3	Deg_of_MITF	Deg_of_SMAD4	Deg_of_MAFB	Deg_of_NR3C1	Deg_of_NR2F1	Deg_of_STAT5A	Deg_of_TBX3	Deg_of_TFE3	Deg_of_ETV5	Deg_of_TFAP2A	Trd_of_AHRToAHR	Num_of_AHRToAHR	Inh_of_AHRToAHR	Trd_of_NFICToAHR	Num_of_NFICToAHR	Act_of_NFICToAHR	Trd_of_FOSToAHR	Num_of_FOSToAHR	Inh_of_FOSToAHR	Trd_of_NR3C1ToNFIC	Num_of_NR3C1ToNFIC	Act_of_NR3C1ToNFIC	Trd_of_MITFToNFIC	Num_of_MITFToNFIC	Inh_of_MITFToNFIC	Trd_of_AHRToFOS	Num_of_AHRToFOS	Inh_of_AHRToFOS	Trd_of_NR3C1ToFOS	Num_of_NR3C1ToFOS	Inh_of_NR3C1ToFOS	Trd_of_SMAD3ToFOS	Num_of_SMAD3ToFOS	Act_of_SMAD3ToFOS	Trd_of_NFICToFOS	Num_of_NFICToFOS	Inh_of_NFICToFOS	Trd_of_MITFToFOS	Num_of_MITFToFOS	Act_of_MITFToFOS	Trd_of_SMAD4ToFOS	Num_of_SMAD4ToFOS	Act_of_SMAD4ToFOS	Trd_of_FOSToFOS	Num_of_FOSToFOS	Inh_of_FOSToFOS	Trd_of_AHRToKLF4	Num_of_AHRToKLF4	Act_of_AHRToKLF4	Trd_of_JUNToKLF4	Num_of_JUNToKLF4	Act_of_JUNToKLF4	Trd_of_NR3C1ToKLF4	Num_of_NR3C1ToKLF4	Act_of_NR3C1ToKLF4	Trd_of_SMAD3ToKLF4	Num_of_SMAD3ToKLF4	Act_of_SMAD3ToKLF4	Trd_of_TBX3ToKLF4	Num_of_TBX3ToKLF4	Act_of_TBX3ToKLF4	Trd_of_MITFToKLF4	Num_of_MITFToKLF4	Inh_of_MITFToKLF4	Trd_of_KLF4ToFOXF1	Num_of_KLF4ToFOXF1	Act_of_KLF4ToFOXF1	Trd_of_JUNToJUN	Num_of_JUNToJUN	Act_of_JUNToJUN	Trd_of_SMAD3ToJUN	Num_of_SMAD3ToJUN	Act_of_SMAD3ToJUN	Trd_of_KLF4ToJUN	Num_of_KLF4ToJUN	Act_of_KLF4ToJUN	Trd_of_MITFToJUN	Num_of_MITFToJUN	Inh_of_MITFToJUN	Trd_of_SMAD4ToJUN	Num_of_SMAD4ToJUN	Act_of_SMAD4ToJUN	Trd_of_AHRToSMAD3	Num_of_AHRToSMAD3	Act_of_AHRToSMAD3	Trd_of_JUNToSMAD3	Num_of_JUNToSMAD3	Act_of_JUNToSMAD3	Trd_of_NR3C1ToSMAD3	Num_of_NR3C1ToSMAD3	Act_of_NR3C1ToSMAD3	Trd_of_NFICToSMAD3	Num_of_NFICToSMAD3	Act_of_NFICToSMAD3	Trd_of_FOSToSMAD3	Num_of_FOSToSMAD3	Inh_of_FOSToSMAD3	Trd_of_AHRToMITF	Num_of_AHRToMITF	Inh_of_AHRToMITF	Trd_of_JUNToMITF	Num_of_JUNToMITF	Inh_of_JUNToMITF	Trd_of_NR3C1ToMITF	Num_of_NR3C1ToMITF	Act_of_NR3C1ToMITF	Trd_of_SMAD3ToMITF	Num_of_SMAD3ToMITF	Inh_of_SMAD3ToMITF	Trd_of_KLF4ToMITF	Num_of_KLF4ToMITF	Inh_of_KLF4ToMITF	Trd_of_MITFToMITF	Num_of_MITFToMITF	Act_of_MITFToMITF	Trd_of_SMAD4ToMITF	Num_of_SMAD4ToMITF	Act_of_SMAD4ToMITF	Trd_of_NR3C1ToSMAD4	Num_of_NR3C1ToSMAD4	Inh_of_NR3C1ToSMAD4	Trd_of_MAFBToMAFB	Num_of_MAFBToMAFB	Act_of_MAFBToMAFB	Trd_of_NR3C1ToMAFB	Num_of_NR3C1ToMAFB	Act_of_NR3C1ToMAFB	Trd_of_AHRToNR3C1	Num_of_AHRToNR3C1	Act_of_AHRToNR3C1	Trd_of_JUNToNR3C1	Num_of_JUNToNR3C1	Act_of_JUNToNR3C1	Trd_of_SMAD3ToNR3C1	Num_of_SMAD3ToNR3C1	Act_of_SMAD3ToNR3C1	Trd_of_NFICToNR3C1	Num_of_NFICToNR3C1	Act_of_NFICToNR3C1	Trd_of_FOSToNR3C1	Num_of_FOSToNR3C1	Inh_of_FOSToNR3C1	Trd_of_NR3C1ToNR2F1	Num_of_NR3C1ToNR2F1	Act_of_NR3C1ToNR2F1	Trd_of_KLF4ToNR2F1	Num_of_KLF4ToNR2F1	Act_of_KLF4ToNR2F1	Trd_of_NFICToNR2F1	Num_of_NFICToNR2F1	Act_of_NFICToNR2F1	Trd_of_FOSToNR2F1	Num_of_FOSToNR2F1	Inh_of_FOSToNR2F1	Trd_of_STAT5AToSTAT5A	Num_of_STAT5AToSTAT5A	Act_of_STAT5AToSTAT5A	Trd_of_MITFToSTAT5A	Num_of_MITFToSTAT5A	Act_of_MITFToSTAT5A	Trd_of_SMAD3ToTBX3	Num_of_SMAD3ToTBX3	Act_of_SMAD3ToTBX3	Trd_of_TBX3ToTBX3	Num_of_TBX3ToTBX3	Act_of_TBX3ToTBX3	Trd_of_KLF4ToTBX3	Num_of_KLF4ToTBX3	Act_of_KLF4ToTBX3	Trd_of_NFICToTBX3	Num_of_NFICToTBX3	Act_of_NFICToTBX3	Trd_of_JUNToTFE3	Num_of_JUNToTFE3	Act_of_JUNToTFE3	Trd_of_TFE3ToTFE3	Num_of_TFE3ToTFE3	Inh_of_TFE3ToTFE3	Trd_of_NFICToTFE3	Num_of_NFICToTFE3	Act_of_NFICToTFE3	Trd_of_MITFToTFE3	Num_of_MITFToTFE3	Inh_of_MITFToTFE3	Trd_of_FOSToTFE3	Num_of_FOSToTFE3	Inh_of_FOSToTFE3	Trd_of_NR3C1ToETV5	Num_of_NR3C1ToETV5	Inh_of_NR3C1ToETV5	Trd_of_ETV5ToETV5	Num_of_ETV5ToETV5	Act_of_ETV5ToETV5	Trd_of_MITFToETV5	Num_of_MITFToETV5	Act_of_MITFToETV5	Trd_of_NR2F1ToTFAP2A	Num_of_NR2F1ToTFAP2A	Act_of_NR2F1ToTFAP2A	Trd_of_MITFToTFAP2A	Num_of_MITFToTFAP2A	Act_of_MITFToTFAP2A];
name_ini='initial_conditions.csv';
[AHR  NFIC	FOS	KLF4	FOXF1	JUN	SMAD3	MITF	SMAD4	MAFB	NR3C1	NR2F1	STAT5A	TBX3	TFE3	ETV5	TFAP2A] = readvars(strcat(path,name_ini));
extra_conditions=[AHR  NFIC	FOS	KLF4	FOXF1	JUN	SMAD3	MITF	SMAD4	MAFB	NR3C1	NR2F1	STAT5A	TBX3	TFE3	ETV5	TFAP2A];
size(extra_conditions)
signal=[3,3,3];  %% Signal
d=0.1;  %% The diffusion coefficient 
% The dimension of the system
Num=17;
tic() %% Time
label={'AHR','NFIC','FOS','KLF4','FOXF1','JUN','SMAD3','MITF','SMAD4','MAFB','NR3C1','NR2F1','STAT5A','TBX3','TFE3','ETV5','TFAP2A'};
%%
param_index=1;
par1=par(param_index,:);
[xx,sigma,n,ycell,action]=Solver(cycle_index,extra_conditions,par1,signal,d);

index=size(n,1);  %% The number of the stable states
alpha=zeros(index,1);  %% The weight of the stable states
sigma0=cell(index,1);  %% The covariance of the Gaussian density function
mu=zeros(index,Num);  %% The mean value of the Gaussian density function

for i=1:index
   %The mean value of each stable state
   mu(i,:)=xx(n(i,1),:); 
   %The covariance of each stable state
   sigma0{i}=reshape(sigma(n(i,1),:),Num,Num)';  
   %The weight of each stable state
   alpha(i)=n(i,2)/sum(n(:,2)); 
end

%% Save the data_files
mkdir('../data_save')
save('../data_save/action','action');
save('../data_save/ycell','ycell');
save('../data_save/mu','mu');
%% Solve the ODEs, calculate the paths and actions;
%
load('../params/PCu.mat')
index=size(n,1);  %% The number of the stable states
alpha=zeros(index,1);  %% The weight of the stable states
sigma0=cell(index,1);  %% The covariance of the Gaussian density function
mu=zeros(index,Num);  %% The mean value of the Gaussian density function

for i=1:index
   %The mean value of each stable state
   mu(i,:)=xx(n(i,1),:); 
   %The covariance of each stable state
   sigma0{i}=reshape(sigma(n(i,1),:),Num,Num)';  
   %The weight of each stable state
   alpha(i)=n(i,2)/sum(n(:,2)); 
end
%Calculate the mean value 
Mu=0;
%Lu=pinv(mu)*PCu;
for i=1:index
    Mu=Mu+alpha(i)*mu(i,:);
end
%Calculate the covariance
Sigma=-Mu'*Mu; 
for i=1:index
    Sigma=Sigma+alpha(i)*(sigma0{i}+mu(i,:)'*mu(i,:));
end

[V,D] = eigs(Sigma,2);
 switch param_index
      case 1
        lab={'U','N','T','M'};
        V=[PCu(1,:)',PCu(2,:)'];
        M=3;T=4;U=2;N=1;ss=[0,0,0,1];
        p1_max=60;p1_min=-61;p2_max=6;p2_min=-4;
        remake_sig=[   4.58292918284943  -0.243959748363383;
                       -0.243959748363383   0.055882886193189];
        az=117;el=76;
     
     case 2
        lab={'M','T','N','U'};
        V=[PCu(1,:)',PCu(2,:)'];
        M=1;T=2;U=4;N=3;ss=[1,0,0,0];
        p1_max=60;p1_min=-61;p2_max=10;p2_min=-18;
        remake_sig=[   4.58292918284943  -0.243959748363383;
                       -0.243959748363383   0.255882886193189];
        az=117;el=76;
      case 3
        lab={'T','U','N','M'};
        V=[PCu(1,:)',PCu(2,:)'];
        M=4;T=1;U=2;N=3;ss=[0,0,0,1];
        p1_max=60;p1_min=-61;p2_max=5;p2_min=-10;
        remake_sig=[   4.58292918284943  -0.243959748363383;
                       -0.243959748363383   0.055882886193189];
        az=117;el=76;
        
        case 4
        lab={'T','U','N','M','H'};
        V=[PCu(1,:)',PCu(2,:)'];
        M=4;T=1;U=2;N=3;ss=[0,0,0,1];
        p1_max=2500;p1_min=-800;p2_max=150;p2_min=-48;
        remake_sig=[   4.58292918284943  -0.243959748363383;
                       -0.243959748363383   0.055882886193189];
        az=117;el=76;
        
        case 5
         lab={'U','N','T','M','H'};
        V=[PCu(1,:)',PCu(2,:)'];
        M=4;T=1;U=2;N=3;ss=[0,0,0,1];
        p1_max=60;p1_min=-61;p2_max=5;p2_min=-10;
        remake_sig=[   4.58292918284943  -0.243959748363383;
                       -0.243959748363383   0.055882886193189];
        az=117;el=76;
 end


%Calculate the eigenvalues and eigenvectors of the covariance
if sign(V(:,1)'*[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]')<0
    V(:,1)=-V(:,1);
end
if sign(V(:,2)'*[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]')<0
     V(:,2)=-V(:,2);
end
%%%Calculate the covariance and mean value after dimension reduction
sigma0_pca=cell(index,1);   
mu_pca=zeros(index,2);
%sig=[1,0.5;0.5,1];
for i=1:index
   mu_pca(i,:)=V'*log2(mu(i,:)');
   %sigma0_pca{i}=sigma0{i}/(mu(i,:)'*mu(i,:));

   %sigma0_pca{i}=V'*(sigma0{i}/(mu(i,:)*mu(i,:)'))*V;
   %sigma0_pca{i}=sig;
end
sigma0_pca{4}=remake_sig;
sigma0_pca{1}=remake_sig;
sigma0_pca{3}=remake_sig;
sigma0_pca{2}=remake_sig;
if param_index>3
    sigma0_pca{5}=remake_sig;
end

%{
p1_max=60;
p1_min=-61;
p2_max=10;
p2_min=-8;
%}
%{
p1_max=2500;
p1_min=-800;
p2_max=150;
p2_min=-48;
%}
%{
p1_max=25;
p1_min=-80;
p2_max=3;
p2_min=-23;
%}
%{
p1_max=8;
p1_min=-38;
p2_max=4;
p2_min=-27;
%}
y_max=[p1_max,p2_max]; %% Range of the landscape
y_min=[p1_min,p2_min];
step=(y_max-y_min)/1250; %% Length of the step
[a1,a2]=meshgrid(y_min(1):step(1):y_max(1),y_min(2):step(2):y_max(2)); %% Grid
[s1,s2]=size(a1);
P=zeros(s1,s2);
z=zeros(s1,s2);
for kk=1:index
    sig=sigma0_pca{kk};
    x_wen=mu_pca(kk,:);
    for i=1:s1
        for j=1:s2
            z(i,j)=multivariate_normal_distribution([a1(i,j);a2(i,j)],x_wen',sig,2);  %% Normal distribution
        end
    end

    P=P+z*alpha(kk);
end
P=P/sum(sum(P));
surf(a1,a2,-log(max(P,10^-100)));   %% Plot landscape
shading interp
xlabel('PC1')
ylabel('PC2')
zlabel('U')
axis([p1_min p1_max p2_min p2_max 0 250])
view([az,el])
for i=1:size(n,1)
    A(i)=floor((mu_pca(i,1)-y_min(1))/step(1))+1;
    B(i)=floor((mu_pca(i,2)-y_min(2))/step(2))+1;
end
 hold on
 

 %lab={'U','N','T','P','H'};
 %lab={'U','N','T','M'};
%lab={'T','P','H'};
% lab={'N','U','M','T'}%xx_4_7
%lab={'U','N','T','M'}%xx_4_18
%lab={'N','U','M','T'};%xx_4_2

%{
%Plot the grid
for i=1:floor(size(a1,1)/4)
    plot3(a1(4*i-1,:),a2(4*i-1,:),-log(max(P(4*i-1,:),10^-100)),'Color',[0.4 0.4 0.4],'LineWidth',0.01);
end
for i=1:floor(size(a1,2)/4)
    plot3(a1(:,4*i-1),a2(:,4*i-1),-log(max(P(:,4*i-1),10^-100)),'Color',[0.4 0.4 0.4],'LineWidth',0.01);
end
%}
%
%Calculate the paths after dimension reduction
k=size(ycell);
for i=1:k(2)
    for j=1:k(2)
  if (i==M && j==T)||(i==T&&j==N) ||(i==N&&j==U) %(i==2 && j==1)||(i==5&&j==1) %||(i==4&&j==3) %(i==1 && j==4)||(i==4&&j==2) ||(i==2&&j==3)

y12=V'*log2(abs(ycell{i,j}));
%y12=V'*ycell{i,j};
a=y12(1,:);
b=y12(2,:);
c = polyfit(a, b, 4);  %进行拟合，c为2次拟合后的系数
d = polyval(c, a, 4);  %拟合后，每一个横坐标对应的值即为d
d(1:3)=b(1:3);d(end-3:end)=b(end-3:end);
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
hold on
z3path=griddata(a1,a2,-log(max(P,10^-100)),a,b);
z3path = fillmissing(z3path,'previous');
%y3path=griddata(a1,a2,-log(max(P,10^-100)),values(1,:),values(2,:));
if ~sum(isnan(z3path))
  %  plot3(values(1,:),values(2,:),y3path+5, 'w','LineWidth',2);
    plot3(a,d,z3path+20, 'w','LineWidth',2);
   % plot3(y12(1,:),y12(2,:),z3path+5,'w','LineWidth',2);
end
  end
    if (i==4 && j==5)% || (i==1&&j==3)%(i==3&&j==5)|| (i==5&&j==2)
y12=V'*log2(abs(ycell{i,j}));
%y12=V'*ycell{i,j};

a=y12(1,:);
b=y12(2,:);
hold on
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
c = polyfit(a, b, 4);  %进行拟合，c为2次拟合后的系数
d = polyval(c, a, 4);  %拟合后，每一个横坐标对应的值即为d
z3path=griddata(a1,a2,-log(max(P,10^-100)),a,b);
%y3path=griddata(a1,a2,-log(max(P,10^-100)),values(1,:),values(2,:));
d(1:5)=b(1:5);d(end-5:end)=b(end-5:end);
if ~sum(isnan(z3path))
    %plot3(y12(1,:),y12(2,:),z3path+5,'w','LineWidth',2);
    %plot3(values(1,:),values(2,:),y3path+5,'Color',[0.85,0.43,0.83],'LineWidth',2);
        plot3(a,d,z3path+20, 'Color',[0.85,0.43,0.83],'LineWidth',2);
end
    end
 end
end
%}
%%
%PLot_Fig2E, stationary distribution of statble states.
if param_index<2
    PP=[];
    iter_nn=30;
    epsilon=1e6;
    PP=exp(-1*action/epsilon);
    PP(logical(eye(size(PP))))=0;
    for i=1:size(PP,2)
    PP(i,:)= PP(i,:)./sum(PP(i,:));
    end
    PP
%PP(logical(eye(size(PP))))=-sum(PP,2)
    lis=zeros(4,iter_nn+1);
    lis(:,1)=ss;

    %PLOT P->others
    figure(3)
    for i=1:iter_nn
     ss=ss*PP;
    lis(:,i+1)=ss;
    end
    for i=1:4
    plot([0:1:iter_nn],lis(i,:),'linewidth',2)
    hold on
    end
    legend([lab(2),lab(1),lab(3),lab(4)])
    legend('boxoff')
    hold on
else
iter_nn=30;
%PP=16-log(action)
%PP(logical(eye(size(PP))))=0;
epsilon=1e4;
PP=exp(-1*action/epsilon)
PP(logical(eye(size(PP))))=0
for i=1:size(PP,2)
PP(i,:)= PP(i,:)./sum(PP(i,:));
end
ss=[0,0,0,1,0];
lis=zeros(5,iter_nn+1);
lis(:,1)=ss;
PP=PP./(sum(PP,2))

%PLOT P->others
figure(3)
for i=1:iter_nn
  ss=ss*PP;
lis(:,i+1)=ss;
end
for i=1:5
plot([0:1:iter_nn],lis(i,:),'linewidth',2)
hold on
end
legend([lab(1),lab(2),lab(3),lab(4),lab(5)])

%legend([strcat(lab(4),'->',lab(1)),strcat(lab(4),'->',lab(4)),strcat(lab(4),'->',lab(3)),strcat(lab(4),'->',lab(2)),strcat(lab(4),'->',lab(5))])
legend('boxoff')
hold on
end
%}