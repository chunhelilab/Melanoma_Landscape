%
M = csvread('data_exp/GSE134432_tetra.csv', 1, 2);
D=importdata('data_exp/GSE134432_tetra.csv');
label={};
dim=17;

%ss lab={'U','N','M','T'}
load('PCu.mat');
PC_4=[PCu(1,:)',PCu(2,:)'];
mu_pca=zeros(4,2);
%sig=[1,0.5;0.5,1];
%对准稳态
load('mu_4_2.mat');
mu_pca(1,:)=log2(stable_point(3,:))*PC_4;
mu_pca(2,:)=log2(stable_point(4,:))*PC_4;
mu_pca(3,:)=log2(stable_point(1,:))*PC_4;
mu_pca(4,:)=log2(stable_point(2,:))*PC_4; 


res_mat=zeros(size(M));
for i=3:size(D.textdata,2)
    label{i-2}=D.textdata{1,i};
end
index_c=ones(5,1);cnt=2;
for k=2:size(D.textdata,1)-1
    res=D.textdata{k,2};
    lad=D.textdata{k+1,2};
    if ~strcmp(lad,res)
        index_c(cnt)=k;
        cnt=cnt+1;
    end 
end
index_c(5)=size(M,1);
main_label={'AHR','NFIC','FOS','KLF4','FOXF1','JUN','SMAD3','MITF','SMAD4','MAFB','NR3C1','NR2F1','STAT5A','TBX3','TFE3','ETV5','TFAP2A'};
for i=1:dim
    for j=1:dim
   if strcmp(label{i},strcat('"',main_label{j},'"'))
       res_mat(:,j)=M(:,i);
       break
   end
    end
end
da=res_mat+1e-7;
mc_pca=ones(4,17);
for k=1:17
    ta(k)=max(da(:,k));
    la(k)=min(da(:,k));
    na(:,k)=log2((da(:,k)-la(k))./(ta(k)-la(k))+10);
end
for i=1:4
[idx,mc]=kmeans(na(index_c(i):index_c(i+1),:),1);
mc_pca(i,:)=mc;
hold on
end
%res_na=(na)'*PC_4;
A=mu_pca'*pinv(mc_pca');
res_na=da*A';
color={'y','g','b','k'};
ss_label={'Landscape','M','T','U','N'};
p1_max=60;
p1_min=-61;
p2_max=5;
p2_min=-10;
s1=p1_max-p1_min;
s2=p2_max-p2_min;
ddd = max(res_na)-min(res_na);
rs=[s1,s2];
ds=ddd./rs;
ds(1)=ds(1)*0.5;
ds(2)=ds(2)*1.5;
done=ones(size(res_na));
dy=[-40,3];
openfig('tetra_ss\xx_4_2_r.fig','reuse'); % open figure
res_na=[-1.2,0.8].*res_na./ds+dy.*done;

for i=1:4
z=180*ones(index_c(i+1)-index_c(i)+1,1);
scatter3(res_na(index_c(i):index_c(i+1),1),res_na(index_c(i):index_c(i+1),2),z,30,color{i},'.');
hold on
end
legend(ss_label)
legend('boxoff')


hold on
p1_max=60;
p1_min=-61;
p2_max=6;
p2_min=-1;
axis([p1_min p1_max p2_min p2_max 0 250])
%}

%{
M = csvread('data_exp/GSE116237_penta.csv', 1, 2);
D=importdata('data_exp/GSE116237_penta.csv');
label={};dim=17;
ss_lab={'H','T','U','M','N'};
load('PCu.mat');PC_4=[PCu(1,:)',PCu(2,:)'];
mu_pca=zeros(5,2);
%sig=[1,0.5;0.5,1];
load('mu_p_p_5_1.mat');
mu_pca(1,:)=(stable_point(3,:))*PC_4;
mu_pca(2,:)=(stable_point(4,:))*PC_4;
mu_pca(3,:)=(stable_point(1,:))*PC_4;
mu_pca(4,:)=(stable_point(2,:))*PC_4;
mu_pca(5,:)=(stable_point(5,:))*PC_4; 
res_mat=zeros(size(M));
for i=3:size(D.textdata,2)
    label{i-2}=D.textdata{1,i};
end
index_c=ones(5,1);cnt=2;
for k=2:size(D.textdata,1)-1
    res=D.textdata{k,2};
    lad=D.textdata{k+1,2};
    if ~strcmp(lad,res)
        index_c(cnt)=k;
        cnt=cnt+1;
    end 
end
index_c(6)=size(M,1);
main_label={'AHR','NFIC','FOS','KLF4','FOXF1','JUN','SMAD3','MITF','SMAD4','MAFB','NR3C1','NR2F1','STAT5A','TBX3','TFE3','ETV5','TFAP2A'};
for i=1:dim
    for j=1:dim
   if strcmp(label{i},strcat('"',main_label{j},'"'))
       res_mat(:,j)=M(:,i);
       break
   end
    end
end
da=res_mat+1e-7;
mc_pca=ones(5,17);
for k=1:17
    ta(k)=max(da(:,k));
    la(k)=min(da(:,k));
    na(:,k)=log2((da(:,k)-la(k))./(ta(k)-la(k))+10);
end
for i=1:5
[idx,mc]=kmeans(na(index_c(i):index_c(i+1),:),1);
mc_pca(i,:)=mc;
hold on
end
%res_na=(na)'*PC_4;

A=mu_pca'*pinv(mc_pca');
res_na=da*A';
color={'r','g','b','y','k'};
ss_label={'Landscape','H','T','U','M','N'};
p1_max=2500;
p1_min=-800;
p2_max=150;
p2_min=-48;
s1=p1_max-p1_min;
s2=p2_max-p2_min;
ddd = max(res_na)-min(res_na);
rs=[s1,s2];
ds=ddd./rs;
done=ones(size(res_na));
dy=[-50,30];
openfig('penta_ss\xx_p_p_5_1_1.fig','reuse'); % open figure
res_na=[5,4].*res_na./ds+dy.*done;

for i=1:5
z=180*ones(index_c(i+1)-index_c(i)+1,1);
scatter3(res_na(index_c(i):index_c(i+1),1),res_na(index_c(i):index_c(i+1),2),z,40,color{i},'.');
hold on
end
legend(ss_label)
legend('boxoff')


hold on
axis([p1_min p1_max p2_min p2_max 0 250])
%}
