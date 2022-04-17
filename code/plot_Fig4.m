addpath('..\figure');
h{1}=openfig('xx_5_1.fig');
h{2}=openfig('xx_5_1_kd_SMAD3.fig');
h{3}=openfig('xx_5_1_kd_MITF.fig');
h{4}=openfig('xx_5_1_kd__MITF_SMAD3.fig');
hash_tr={'','SMAD3-','MITF-','SMAD3-,MITF-'};
figure(11)
for i=1:3
s{i}=subplot(2,2,i);
copyobj(get(get(h{i},'Children'),'Children'),s{i});
title(hash_tr{i},'FontSize',10);
close(h{i});
view([-1.447904832713755e+02 76.923364478864443]);
end


s{4}=subplot(2,2,4);
gt=get(get(h{4},'Children'),'Children');
copyobj(gt,s{4});
title(hash_tr{4},'FontSize',10);
close(h{4});
view([-1.447904832713755e+02 76.923364478864443]);