%数据准备
%Fig6A need Action to para
%Action: b1:S->G1 ,b2 G1->S.a1:G1->G0,a2:G0->G1.c1:S->G0.c2:G0->S
daction={};
a=zeros(7,2);
b=zeros(7,2);
c=zeros(7,2);
load('/results/action_5_1.mat');
p_action=action;
daction{1}=p_action;

%{
for i=1:6
    rs=strcat('action_KO_smad3_',num2str(i),'.mat');
    xs=strcat('xx_KO_smad3_',num2str(i),'.mat');
    load(rs);
    load(xs);   
    daction{i+1}=action;
end
KO_smad3_1_lab={'U','N','T','P','H'};
KO_smad3_2_lab={'U','N','T','P','H'};

a1=[daction{1}(4,3) daction{2}(4,3) daction{3}(5,4) daction{4}(4,3) daction{5}(3,2) daction{6}(3,2) daction{7}(3,2)];
a2=[daction{1}(3,4) daction{2}(3,4) daction{3}(4,5) daction{4}(3,4) daction{5}(2,3) daction{6}(2,3) daction{7}(2,3)];
b1=[daction{1}(5,4) daction{2}(5,3) daction{3}(5,3) daction{4}(3,2) daction{5}(1,2) daction{6}(1,2) daction{7}(1,2)];
b2=[daction{1}(4,5) daction{2}(3,5) daction{3}(3,5) daction{4}(2,3) daction{5}(2,1) daction{6}(2,1) daction{7}(2,1)];
%}
%{
for i=1:6
    rs=strcat('action_KO_MITF_',num2str(i),'.mat');
    xs=strcat('xx_KO_MITF_',num2str(i),'.mat');
    load(rs);
    load(xs);   
    daction{i+1}=action;
end
KO_smad3_1_lab={'U','N','T','P','H'};
KO_smad3_2_lab={'U','N','T','P','H'};

a1=[daction{1}(4,3) daction{2}(4,3) daction{3}(4,3) daction{4}(4,3) daction{5}(4,3) daction{6}(4,3) daction{7}(4,3)];
a2=[daction{1}(3,4) daction{2}(3,4) daction{3}(3,4) daction{4}(3,4) daction{5}(3,4) daction{6}(3,4) daction{7}(3,4)];
c1=[daction{1}(4,1) daction{2}(3,1) daction{3}(3,1) daction{4}(3,1) daction{5}(3,1) daction{6}(3,1) daction{7}(3,1)];
c2=[daction{1}(1,4) daction{2}(1,3) daction{3}(1,3) daction{4}(1,3) daction{5}(1,3) daction{6}(1,3) daction{7}(1,3)];
%}
%
for i=1:6
    rs=strcat('action_KO_SMAD3_MITF_t',num2str(i),'.mat');
    %xs=strcat('xx_KO_SMAD3_MITF_',num2str(i),'.mat');
    load(rs);
    %load(xs);   
    daction{i+1}=action;
end
KO_smad3_1_lab={'U','N','T','M','H'};
KO_smad3_2_lab={'U','N','T','M','H'};

a1=[daction{1}(4,3) daction{2}(4,3) daction{3}(4,3) daction{4}(4,3) daction{5}(4,3) daction{6}(4,3) daction{7}(4,3)];
a2=[daction{1}(3,4) daction{2}(3,4) daction{3}(3,4) daction{4}(3,4) daction{5}(3,4) daction{6}(3,4) daction{7}(3,4)];
b1=[daction{1}(1,4) daction{2}(1,4) daction{3}(1,4) daction{4}(1,4) daction{5}(1,4) daction{6}(1,4) daction{7}(1,4)];
b2=[daction{1}(4,1) daction{2}(4,1) daction{3}(4,1) daction{4}(4,1) daction{5}(4,1) daction{6}(4,1) daction{7}(4,1)];
c1=[daction{1}(4,1) daction{2}(3,1) daction{3}(3,1) daction{4}(3,1) daction{5}(3,1) daction{6}(3,1) daction{7}(3,1)];
c2=[daction{1}(1,4) daction{2}(1,3) daction{3}(1,3) daction{4}(1,3) daction{5}(1,3) daction{6}(1,3) daction{7}(1,3)];
%}






figure(1)
%x_axis=[1 0.5 0.1 0.01 0.001 0.0001 0.00001];
x_axis=[1 0.9 0.8 0.7 0.6 0.5 0.4];
%at1=1-log10(x_axis);
at1=10-10*x_axis;

xlim([1 6]);
set(gca,'XTick',at1);
set(gca,'XTicklabel',{' 1',' 0.9',' 0.8',' 0.7',' 0.6','0.5','0.4'});
%xlabel('SMAD3_KO');ylabel('Relative Action');
xlabel('SMAD3\_and\_MITF\_KO');ylabel('Relative Action');
legend('boxoff')

%
%画action变化的
hold on
%{
plot(at1,a2,'-o','linewidth' ,2.5,'Color','r')
plot(at1,a1,'-s','linewidth' ,2.5,'Color','b')
legend('T->M','M->T')

%}
%
plot(at1,b2,'-o','linewidth' ,2.5,'Color','r')
plot(at1,b1,'-s','linewidth' ,2.5,'Color','b')
legend('M->U','U->M')
%}
%{
plot(at1,c2,'-o','linewidth' ,2.5,'Color','r')
plot(at1,c1,'-s','linewidth' ,2.5,'Color','b')
legend('M->U','U->M')
%}

%}