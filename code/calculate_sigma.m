function [xx]=calculate_sigma(x,par,signal,kk,d)

%par is parameters
%d is diffusion coefficient
%the xx is the vector of sigma which is Row Major Order
%%lead in the parameters
v=num2cell(par(1,:));
[Prod_of_AHR	Prod_of_NFIC	Prod_of_FOS	Prod_of_KLF4	Prod_of_FOXF1	Prod_of_JUN	Prod_of_SMAD3	Prod_of_MITF	Prod_of_SMAD4	Prod_of_MAFB	Prod_of_NR3C1	Prod_of_NR2F1	Prod_of_STAT5A	Prod_of_TBX3	Prod_of_TFE3	Prod_of_ETV5	Prod_of_TFAP2A	Deg_of_AHR	Deg_of_NFIC	Deg_of_FOS	Deg_of_KLF4	Deg_of_FOXF1	Deg_of_JUN	Deg_of_SMAD3	Deg_of_MITF	Deg_of_SMAD4	Deg_of_MAFB	Deg_of_NR3C1	Deg_of_NR2F1	Deg_of_STAT5A	Deg_of_TBX3	Deg_of_TFE3	Deg_of_ETV5	Deg_of_TFAP2A	Trd_of_AHRToAHR	Num_of_AHRToAHR	Inh_of_AHRToAHR	Trd_of_NFICToAHR	Num_of_NFICToAHR	Act_of_NFICToAHR	Trd_of_FOSToAHR	Num_of_FOSToAHR	Inh_of_FOSToAHR	Trd_of_NR3C1ToNFIC	Num_of_NR3C1ToNFIC	Act_of_NR3C1ToNFIC	Trd_of_MITFToNFIC	Num_of_MITFToNFIC	Inh_of_MITFToNFIC	Trd_of_AHRToFOS	Num_of_AHRToFOS	Inh_of_AHRToFOS	Trd_of_NR3C1ToFOS	Num_of_NR3C1ToFOS	Inh_of_NR3C1ToFOS	Trd_of_SMAD3ToFOS	Num_of_SMAD3ToFOS	Act_of_SMAD3ToFOS	Trd_of_NFICToFOS	Num_of_NFICToFOS	Inh_of_NFICToFOS	Trd_of_MITFToFOS	Num_of_MITFToFOS	Act_of_MITFToFOS	Trd_of_SMAD4ToFOS	Num_of_SMAD4ToFOS	Act_of_SMAD4ToFOS	Trd_of_FOSToFOS	Num_of_FOSToFOS	Inh_of_FOSToFOS	Trd_of_AHRToKLF4	Num_of_AHRToKLF4	Act_of_AHRToKLF4	Trd_of_JUNToKLF4	Num_of_JUNToKLF4	Act_of_JUNToKLF4	Trd_of_NR3C1ToKLF4	Num_of_NR3C1ToKLF4	Act_of_NR3C1ToKLF4	Trd_of_SMAD3ToKLF4	Num_of_SMAD3ToKLF4	Act_of_SMAD3ToKLF4	Trd_of_TBX3ToKLF4	Num_of_TBX3ToKLF4	Act_of_TBX3ToKLF4	Trd_of_MITFToKLF4	Num_of_MITFToKLF4	Inh_of_MITFToKLF4	Trd_of_KLF4ToFOXF1	Num_of_KLF4ToFOXF1	Act_of_KLF4ToFOXF1	Trd_of_JUNToJUN	Num_of_JUNToJUN	Act_of_JUNToJUN	Trd_of_SMAD3ToJUN	Num_of_SMAD3ToJUN	Act_of_SMAD3ToJUN	Trd_of_KLF4ToJUN	Num_of_KLF4ToJUN	Act_of_KLF4ToJUN	Trd_of_MITFToJUN	Num_of_MITFToJUN	Inh_of_MITFToJUN	Trd_of_SMAD4ToJUN	Num_of_SMAD4ToJUN	Act_of_SMAD4ToJUN	Trd_of_AHRToSMAD3	Num_of_AHRToSMAD3	Act_of_AHRToSMAD3	Trd_of_JUNToSMAD3	Num_of_JUNToSMAD3	Act_of_JUNToSMAD3	Trd_of_NR3C1ToSMAD3	Num_of_NR3C1ToSMAD3	Act_of_NR3C1ToSMAD3	Trd_of_NFICToSMAD3	Num_of_NFICToSMAD3	Act_of_NFICToSMAD3	Trd_of_FOSToSMAD3	Num_of_FOSToSMAD3	Inh_of_FOSToSMAD3	Trd_of_AHRToMITF	Num_of_AHRToMITF	Inh_of_AHRToMITF	Trd_of_JUNToMITF	Num_of_JUNToMITF	Inh_of_JUNToMITF	Trd_of_NR3C1ToMITF	Num_of_NR3C1ToMITF	Act_of_NR3C1ToMITF	Trd_of_SMAD3ToMITF	Num_of_SMAD3ToMITF	Inh_of_SMAD3ToMITF	Trd_of_KLF4ToMITF	Num_of_KLF4ToMITF	Inh_of_KLF4ToMITF	Trd_of_MITFToMITF	Num_of_MITFToMITF	Act_of_MITFToMITF	Trd_of_SMAD4ToMITF	Num_of_SMAD4ToMITF	Act_of_SMAD4ToMITF	Trd_of_NR3C1ToSMAD4	Num_of_NR3C1ToSMAD4	Inh_of_NR3C1ToSMAD4	Trd_of_MAFBToMAFB	Num_of_MAFBToMAFB	Act_of_MAFBToMAFB	Trd_of_NR3C1ToMAFB	Num_of_NR3C1ToMAFB	Act_of_NR3C1ToMAFB	Trd_of_AHRToNR3C1	Num_of_AHRToNR3C1	Act_of_AHRToNR3C1	Trd_of_JUNToNR3C1	Num_of_JUNToNR3C1	Act_of_JUNToNR3C1	Trd_of_SMAD3ToNR3C1	Num_of_SMAD3ToNR3C1	Act_of_SMAD3ToNR3C1	Trd_of_NFICToNR3C1	Num_of_NFICToNR3C1	Act_of_NFICToNR3C1	Trd_of_FOSToNR3C1	Num_of_FOSToNR3C1	Inh_of_FOSToNR3C1	Trd_of_NR3C1ToNR2F1	Num_of_NR3C1ToNR2F1	Act_of_NR3C1ToNR2F1	Trd_of_KLF4ToNR2F1	Num_of_KLF4ToNR2F1	Act_of_KLF4ToNR2F1	Trd_of_NFICToNR2F1	Num_of_NFICToNR2F1	Act_of_NFICToNR2F1	Trd_of_FOSToNR2F1	Num_of_FOSToNR2F1	Inh_of_FOSToNR2F1	Trd_of_STAT5AToSTAT5A	Num_of_STAT5AToSTAT5A	Act_of_STAT5AToSTAT5A	Trd_of_MITFToSTAT5A	Num_of_MITFToSTAT5A	Act_of_MITFToSTAT5A	Trd_of_SMAD3ToTBX3	Num_of_SMAD3ToTBX3	Act_of_SMAD3ToTBX3	Trd_of_TBX3ToTBX3	Num_of_TBX3ToTBX3	Act_of_TBX3ToTBX3	Trd_of_KLF4ToTBX3	Num_of_KLF4ToTBX3	Act_of_KLF4ToTBX3	Trd_of_NFICToTBX3	Num_of_NFICToTBX3	Act_of_NFICToTBX3	Trd_of_JUNToTFE3	Num_of_JUNToTFE3	Act_of_JUNToTFE3	Trd_of_TFE3ToTFE3	Num_of_TFE3ToTFE3	Inh_of_TFE3ToTFE3	Trd_of_NFICToTFE3	Num_of_NFICToTFE3	Act_of_NFICToTFE3	Trd_of_MITFToTFE3	Num_of_MITFToTFE3	Inh_of_MITFToTFE3	Trd_of_FOSToTFE3	Num_of_FOSToTFE3	Inh_of_FOSToTFE3	Trd_of_NR3C1ToETV5	Num_of_NR3C1ToETV5	Inh_of_NR3C1ToETV5	Trd_of_ETV5ToETV5	Num_of_ETV5ToETV5	Act_of_ETV5ToETV5	Trd_of_MITFToETV5	Num_of_MITFToETV5	Act_of_MITFToETV5	Trd_of_NR2F1ToTFAP2A	Num_of_NR2F1ToTFAP2A	Act_of_NR2F1ToTFAP2A	Trd_of_MITFToTFAP2A	Num_of_MITFToTFAP2A	Act_of_MITFToTFAP2A]=deal(v{:});

syms AHR NFIC FOS KLF4 FOXF1 JUN SMAD3 MITF SMAD4 MAFB NR3C1 NR2F1 STAT5A TBX3 TFE3 ETV5  TFAP2A; 

Hills_AHR_AHR=Inh_of_AHRToAHR+((1.0 -Inh_of_AHRToAHR) .* (Trd_of_AHRToAHR.^Num_of_AHRToAHR./(AHR.^Num_of_AHRToAHR +Trd_of_AHRToAHR.^Num_of_AHRToAHR )));
Hills_NFIC_AHR=(Act_of_NFICToAHR+((1.0 -Act_of_NFICToAHR) .* (Trd_of_NFICToAHR.^Num_of_NFICToAHR./(NFIC.^Num_of_NFICToAHR +Trd_of_NFICToAHR.^Num_of_NFICToAHR ))))./Act_of_NFICToAHR;
Hills_FOS_AHR=Inh_of_FOSToAHR+((1.0 -Inh_of_FOSToAHR) .* (Trd_of_FOSToAHR.^Num_of_FOSToAHR./(FOS.^Num_of_FOSToAHR +Trd_of_FOSToAHR.^Num_of_FOSToAHR )));
Hills_NR3C1_NFIC=(Act_of_NR3C1ToNFIC+((1.0 -Act_of_NR3C1ToNFIC) .* (Trd_of_NR3C1ToNFIC.^Num_of_NR3C1ToNFIC./(NR3C1.^Num_of_NR3C1ToNFIC +Trd_of_NR3C1ToNFIC.^Num_of_NR3C1ToNFIC ))))./Act_of_NR3C1ToNFIC;
Hills_MITF_NFIC=Inh_of_MITFToNFIC+((1.0 -Inh_of_MITFToNFIC) .* (Trd_of_MITFToNFIC.^Num_of_MITFToNFIC./(MITF.^Num_of_MITFToNFIC +Trd_of_MITFToNFIC.^Num_of_MITFToNFIC )));
Hills_AHR_FOS=Inh_of_AHRToFOS+((1.0 -Inh_of_AHRToFOS) .* (Trd_of_AHRToFOS.^Num_of_AHRToFOS./(AHR.^Num_of_AHRToFOS +Trd_of_AHRToFOS.^Num_of_AHRToFOS )));
Hills_NR3C1_FOS=Inh_of_NR3C1ToFOS+((1.0 -Inh_of_NR3C1ToFOS) .* (Trd_of_NR3C1ToFOS.^Num_of_NR3C1ToFOS./(NR3C1.^Num_of_NR3C1ToFOS +Trd_of_NR3C1ToFOS.^Num_of_NR3C1ToFOS )));
Hills_SMAD3_FOS=(Act_of_SMAD3ToFOS+((1.0 -Act_of_SMAD3ToFOS) .* (Trd_of_SMAD3ToFOS.^Num_of_SMAD3ToFOS./(SMAD3.^Num_of_SMAD3ToFOS +Trd_of_SMAD3ToFOS.^Num_of_SMAD3ToFOS ))))./Act_of_SMAD3ToFOS;
Hills_NFIC_FOS=Inh_of_NFICToFOS+((1.0 -Inh_of_NFICToFOS) .* (Trd_of_NFICToFOS.^Num_of_NFICToFOS./(NFIC.^Num_of_NFICToFOS +Trd_of_NFICToFOS.^Num_of_NFICToFOS )));
Hills_MITF_FOS=(Act_of_MITFToFOS+((1.0 -Act_of_MITFToFOS) .* (Trd_of_MITFToFOS.^Num_of_MITFToFOS./(MITF.^Num_of_MITFToFOS +Trd_of_MITFToFOS.^Num_of_MITFToFOS ))))./Act_of_MITFToFOS;
Hills_SMAD4_FOS=(Act_of_SMAD4ToFOS+((1.0 -Act_of_SMAD4ToFOS) .* (Trd_of_SMAD4ToFOS.^Num_of_SMAD4ToFOS./(SMAD4.^Num_of_SMAD4ToFOS +Trd_of_SMAD4ToFOS.^Num_of_SMAD4ToFOS ))))./Act_of_SMAD4ToFOS;
Hills_FOS_FOS=Inh_of_FOSToFOS+((1.0 -Inh_of_FOSToFOS) .* (Trd_of_FOSToFOS.^Num_of_FOSToFOS./(FOS.^Num_of_FOSToFOS +Trd_of_FOSToFOS.^Num_of_FOSToFOS )));
Hills_AHR_KLF4=(Act_of_AHRToKLF4+((1.0 -Act_of_AHRToKLF4) .* (Trd_of_AHRToKLF4.^Num_of_AHRToKLF4./(AHR.^Num_of_AHRToKLF4 +Trd_of_AHRToKLF4.^Num_of_AHRToKLF4 ))))./Act_of_AHRToKLF4;
Hills_JUN_KLF4=(Act_of_JUNToKLF4+((1.0 -Act_of_JUNToKLF4) .* (Trd_of_JUNToKLF4.^Num_of_JUNToKLF4./(JUN.^Num_of_JUNToKLF4 +Trd_of_JUNToKLF4.^Num_of_JUNToKLF4 ))))./Act_of_JUNToKLF4;
Hills_NR3C1_KLF4=(Act_of_NR3C1ToKLF4+((1.0 -Act_of_NR3C1ToKLF4) .* (Trd_of_NR3C1ToKLF4.^Num_of_NR3C1ToKLF4./(NR3C1.^Num_of_NR3C1ToKLF4 +Trd_of_NR3C1ToKLF4.^Num_of_NR3C1ToKLF4 ))))./Act_of_NR3C1ToKLF4;
Hills_SMAD3_KLF4=(Act_of_SMAD3ToKLF4+((1.0 -Act_of_SMAD3ToKLF4) .* (Trd_of_SMAD3ToKLF4.^Num_of_SMAD3ToKLF4./(SMAD3.^Num_of_SMAD3ToKLF4 +Trd_of_SMAD3ToKLF4.^Num_of_SMAD3ToKLF4 ))))./Act_of_SMAD3ToKLF4;
Hills_TBX3_KLF4=(Act_of_TBX3ToKLF4+((1.0 -Act_of_TBX3ToKLF4) .* (Trd_of_TBX3ToKLF4.^Num_of_TBX3ToKLF4./(TBX3.^Num_of_TBX3ToKLF4 +Trd_of_TBX3ToKLF4.^Num_of_TBX3ToKLF4 ))))./Act_of_TBX3ToKLF4;
Hills_MITF_KLF4=Inh_of_MITFToKLF4+((1.0 -Inh_of_MITFToKLF4) .* (Trd_of_MITFToKLF4.^Num_of_MITFToKLF4./(MITF.^Num_of_MITFToKLF4 +Trd_of_MITFToKLF4.^Num_of_MITFToKLF4 )));
Hills_KLF4_FOXF1=(Act_of_KLF4ToFOXF1+((1.0 -Act_of_KLF4ToFOXF1) .* (Trd_of_KLF4ToFOXF1.^Num_of_KLF4ToFOXF1./(KLF4.^Num_of_KLF4ToFOXF1 +Trd_of_KLF4ToFOXF1.^Num_of_KLF4ToFOXF1 ))))./Act_of_KLF4ToFOXF1;
Hills_JUN_JUN=(Act_of_JUNToJUN+((1.0 -Act_of_JUNToJUN) .* (Trd_of_JUNToJUN.^Num_of_JUNToJUN./(JUN.^Num_of_JUNToJUN +Trd_of_JUNToJUN.^Num_of_JUNToJUN ))))./Act_of_JUNToJUN;
Hills_SMAD3_JUN=(Act_of_SMAD3ToJUN+((1.0 -Act_of_SMAD3ToJUN) .* (Trd_of_SMAD3ToJUN.^Num_of_SMAD3ToJUN./(SMAD3.^Num_of_SMAD3ToJUN +Trd_of_SMAD3ToJUN.^Num_of_SMAD3ToJUN ))))./Act_of_SMAD3ToJUN;
Hills_KLF4_JUN=(Act_of_KLF4ToJUN+((1.0 -Act_of_KLF4ToJUN) .* (Trd_of_KLF4ToJUN.^Num_of_KLF4ToJUN./(KLF4.^Num_of_KLF4ToJUN +Trd_of_KLF4ToJUN.^Num_of_KLF4ToJUN ))))./Act_of_KLF4ToJUN;
Hills_MITF_JUN=Inh_of_MITFToJUN+((1.0 -Inh_of_MITFToJUN) .* (Trd_of_MITFToJUN.^Num_of_MITFToJUN./(MITF.^Num_of_MITFToJUN +Trd_of_MITFToJUN.^Num_of_MITFToJUN )));
Hills_SMAD4_JUN=(Act_of_SMAD4ToJUN+((1.0 -Act_of_SMAD4ToJUN) .* (Trd_of_SMAD4ToJUN.^Num_of_SMAD4ToJUN./(SMAD4.^Num_of_SMAD4ToJUN +Trd_of_SMAD4ToJUN.^Num_of_SMAD4ToJUN ))))./Act_of_SMAD4ToJUN;
Hills_AHR_SMAD3=(Act_of_AHRToSMAD3+((1.0 -Act_of_AHRToSMAD3) .* (Trd_of_AHRToSMAD3.^Num_of_AHRToSMAD3./(AHR.^Num_of_AHRToSMAD3 +Trd_of_AHRToSMAD3.^Num_of_AHRToSMAD3 ))))./Act_of_AHRToSMAD3;
Hills_JUN_SMAD3=(Act_of_JUNToSMAD3+((1.0 -Act_of_JUNToSMAD3) .* (Trd_of_JUNToSMAD3.^Num_of_JUNToSMAD3./(JUN.^Num_of_JUNToSMAD3 +Trd_of_JUNToSMAD3.^Num_of_JUNToSMAD3 ))))./Act_of_JUNToSMAD3;
Hills_NR3C1_SMAD3=(Act_of_NR3C1ToSMAD3+((1.0 -Act_of_NR3C1ToSMAD3) .* (Trd_of_NR3C1ToSMAD3.^Num_of_NR3C1ToSMAD3./(NR3C1.^Num_of_NR3C1ToSMAD3 +Trd_of_NR3C1ToSMAD3.^Num_of_NR3C1ToSMAD3 ))))./Act_of_NR3C1ToSMAD3;
Hills_NFIC_SMAD3=(Act_of_NFICToSMAD3+((1.0 -Act_of_NFICToSMAD3) .* (Trd_of_NFICToSMAD3.^Num_of_NFICToSMAD3./(NFIC.^Num_of_NFICToSMAD3 +Trd_of_NFICToSMAD3.^Num_of_NFICToSMAD3 ))))./Act_of_NFICToSMAD3;
Hills_FOS_SMAD3=Inh_of_FOSToSMAD3+((1.0 -Inh_of_FOSToSMAD3) .* (Trd_of_FOSToSMAD3.^Num_of_FOSToSMAD3./(FOS.^Num_of_FOSToSMAD3 +Trd_of_FOSToSMAD3.^Num_of_FOSToSMAD3 )));
Hills_AHR_MITF=Inh_of_AHRToMITF+((1.0 -Inh_of_AHRToMITF) .* (Trd_of_AHRToMITF.^Num_of_AHRToMITF./(AHR.^Num_of_AHRToMITF +Trd_of_AHRToMITF.^Num_of_AHRToMITF )));
Hills_JUN_MITF=Inh_of_JUNToMITF+((1.0 -Inh_of_JUNToMITF) .* (Trd_of_JUNToMITF.^Num_of_JUNToMITF./(JUN.^Num_of_JUNToMITF +Trd_of_JUNToMITF.^Num_of_JUNToMITF )));
Hills_NR3C1_MITF=(Act_of_NR3C1ToMITF+((1.0 -Act_of_NR3C1ToMITF) .* (Trd_of_NR3C1ToMITF.^Num_of_NR3C1ToMITF./(NR3C1.^Num_of_NR3C1ToMITF +Trd_of_NR3C1ToMITF.^Num_of_NR3C1ToMITF ))))./Act_of_NR3C1ToMITF;
Hills_SMAD3_MITF=Inh_of_SMAD3ToMITF+((1.0 -Inh_of_SMAD3ToMITF) .* (Trd_of_SMAD3ToMITF.^Num_of_SMAD3ToMITF./(SMAD3.^Num_of_SMAD3ToMITF +Trd_of_SMAD3ToMITF.^Num_of_SMAD3ToMITF )));
Hills_KLF4_MITF=Inh_of_KLF4ToMITF+((1.0 -Inh_of_KLF4ToMITF) .* (Trd_of_KLF4ToMITF.^Num_of_KLF4ToMITF./(KLF4.^Num_of_KLF4ToMITF +Trd_of_KLF4ToMITF.^Num_of_KLF4ToMITF )));
Hills_MITF_MITF=(Act_of_MITFToMITF+((1.0 -Act_of_MITFToMITF) .* (Trd_of_MITFToMITF.^Num_of_MITFToMITF./(MITF.^Num_of_MITFToMITF +Trd_of_MITFToMITF.^Num_of_MITFToMITF ))))./Act_of_MITFToMITF;
Hills_SMAD4_MITF=(Act_of_SMAD4ToMITF+((1.0 -Act_of_SMAD4ToMITF) .* (Trd_of_SMAD4ToMITF.^Num_of_SMAD4ToMITF./(SMAD4.^Num_of_SMAD4ToMITF +Trd_of_SMAD4ToMITF.^Num_of_SMAD4ToMITF ))))./Act_of_SMAD4ToMITF;
Hills_NR3C1_SMAD4=Inh_of_NR3C1ToSMAD4+((1.0 -Inh_of_NR3C1ToSMAD4) .* (Trd_of_NR3C1ToSMAD4.^Num_of_NR3C1ToSMAD4./(NR3C1.^Num_of_NR3C1ToSMAD4 +Trd_of_NR3C1ToSMAD4.^Num_of_NR3C1ToSMAD4 )));
Hills_MAFB_MAFB=(Act_of_MAFBToMAFB+((1.0 -Act_of_MAFBToMAFB) .* (Trd_of_MAFBToMAFB.^Num_of_MAFBToMAFB./(MAFB.^Num_of_MAFBToMAFB +Trd_of_MAFBToMAFB.^Num_of_MAFBToMAFB ))))./Act_of_MAFBToMAFB;
Hills_NR3C1_MAFB=(Act_of_NR3C1ToMAFB+((1.0 -Act_of_NR3C1ToMAFB) .* (Trd_of_NR3C1ToMAFB.^Num_of_NR3C1ToMAFB./(NR3C1.^Num_of_NR3C1ToMAFB +Trd_of_NR3C1ToMAFB.^Num_of_NR3C1ToMAFB ))))./Act_of_NR3C1ToMAFB;
Hills_AHR_NR3C1=(Act_of_AHRToNR3C1+((1.0 -Act_of_AHRToNR3C1) .* (Trd_of_AHRToNR3C1.^Num_of_AHRToNR3C1./(AHR.^Num_of_AHRToNR3C1 +Trd_of_AHRToNR3C1.^Num_of_AHRToNR3C1 ))))./Act_of_AHRToNR3C1;
Hills_JUN_NR3C1=(Act_of_JUNToNR3C1+((1.0 -Act_of_JUNToNR3C1) .* (Trd_of_JUNToNR3C1.^Num_of_JUNToNR3C1./(JUN.^Num_of_JUNToNR3C1 +Trd_of_JUNToNR3C1.^Num_of_JUNToNR3C1 ))))./Act_of_JUNToNR3C1;
Hills_SMAD3_NR3C1=(Act_of_SMAD3ToNR3C1+((1.0 -Act_of_SMAD3ToNR3C1) .* (Trd_of_SMAD3ToNR3C1.^Num_of_SMAD3ToNR3C1./(SMAD3.^Num_of_SMAD3ToNR3C1 +Trd_of_SMAD3ToNR3C1.^Num_of_SMAD3ToNR3C1 ))))./Act_of_SMAD3ToNR3C1;
Hills_NFIC_NR3C1=(Act_of_NFICToNR3C1+((1.0 -Act_of_NFICToNR3C1) .* (Trd_of_NFICToNR3C1.^Num_of_NFICToNR3C1./(NFIC.^Num_of_NFICToNR3C1 +Trd_of_NFICToNR3C1.^Num_of_NFICToNR3C1 ))))./Act_of_NFICToNR3C1;
Hills_FOS_NR3C1=Inh_of_FOSToNR3C1+((1.0 -Inh_of_FOSToNR3C1) .* (Trd_of_FOSToNR3C1.^Num_of_FOSToNR3C1./(FOS.^Num_of_FOSToNR3C1 +Trd_of_FOSToNR3C1.^Num_of_FOSToNR3C1 )));
Hills_NR3C1_NR2F1=(Act_of_NR3C1ToNR2F1+((1.0 -Act_of_NR3C1ToNR2F1) .* (Trd_of_NR3C1ToNR2F1.^Num_of_NR3C1ToNR2F1./(NR3C1.^Num_of_NR3C1ToNR2F1 +Trd_of_NR3C1ToNR2F1.^Num_of_NR3C1ToNR2F1 ))))./Act_of_NR3C1ToNR2F1;
Hills_KLF4_NR2F1=(Act_of_KLF4ToNR2F1+((1.0 -Act_of_KLF4ToNR2F1) .* (Trd_of_KLF4ToNR2F1.^Num_of_KLF4ToNR2F1./(KLF4.^Num_of_KLF4ToNR2F1 +Trd_of_KLF4ToNR2F1.^Num_of_KLF4ToNR2F1 ))))./Act_of_KLF4ToNR2F1;
Hills_NFIC_NR2F1=(Act_of_NFICToNR2F1+((1.0 -Act_of_NFICToNR2F1) .* (Trd_of_NFICToNR2F1.^Num_of_NFICToNR2F1./(NFIC.^Num_of_NFICToNR2F1 +Trd_of_NFICToNR2F1.^Num_of_NFICToNR2F1 ))))./Act_of_NFICToNR2F1;
Hills_FOS_NR2F1=Inh_of_FOSToNR2F1+((1.0 -Inh_of_FOSToNR2F1) .* (Trd_of_FOSToNR2F1.^Num_of_FOSToNR2F1./(FOS.^Num_of_FOSToNR2F1 +Trd_of_FOSToNR2F1.^Num_of_FOSToNR2F1 )));
Hills_STAT5A_STAT5A=(Act_of_STAT5AToSTAT5A+((1.0 -Act_of_STAT5AToSTAT5A) .* (Trd_of_STAT5AToSTAT5A.^Num_of_STAT5AToSTAT5A./(STAT5A.^Num_of_STAT5AToSTAT5A +Trd_of_STAT5AToSTAT5A.^Num_of_STAT5AToSTAT5A ))))./Act_of_STAT5AToSTAT5A;
Hills_MITF_STAT5A=(Act_of_MITFToSTAT5A+((1.0 -Act_of_MITFToSTAT5A) .* (Trd_of_MITFToSTAT5A.^Num_of_MITFToSTAT5A./(MITF.^Num_of_MITFToSTAT5A +Trd_of_MITFToSTAT5A.^Num_of_MITFToSTAT5A ))))./Act_of_MITFToSTAT5A;
Hills_SMAD3_TBX3=(Act_of_SMAD3ToTBX3+((1.0 -Act_of_SMAD3ToTBX3) .* (Trd_of_SMAD3ToTBX3.^Num_of_SMAD3ToTBX3./(SMAD3.^Num_of_SMAD3ToTBX3 +Trd_of_SMAD3ToTBX3.^Num_of_SMAD3ToTBX3 ))))./Act_of_SMAD3ToTBX3;
Hills_TBX3_TBX3=(Act_of_TBX3ToTBX3+((1.0 -Act_of_TBX3ToTBX3) .* (Trd_of_TBX3ToTBX3.^Num_of_TBX3ToTBX3./(TBX3.^Num_of_TBX3ToTBX3 +Trd_of_TBX3ToTBX3.^Num_of_TBX3ToTBX3 ))))./Act_of_TBX3ToTBX3;
Hills_KLF4_TBX3=(Act_of_KLF4ToTBX3+((1.0 -Act_of_KLF4ToTBX3) .* (Trd_of_KLF4ToTBX3.^Num_of_KLF4ToTBX3./(KLF4.^Num_of_KLF4ToTBX3 +Trd_of_KLF4ToTBX3.^Num_of_KLF4ToTBX3 ))))./Act_of_KLF4ToTBX3;
Hills_NFIC_TBX3=(Act_of_NFICToTBX3+((1.0 -Act_of_NFICToTBX3) .* (Trd_of_NFICToTBX3.^Num_of_NFICToTBX3./(NFIC.^Num_of_NFICToTBX3 +Trd_of_NFICToTBX3.^Num_of_NFICToTBX3 ))))./Act_of_NFICToTBX3;
Hills_JUN_TFE3=(Act_of_JUNToTFE3+((1.0 -Act_of_JUNToTFE3) .* (Trd_of_JUNToTFE3.^Num_of_JUNToTFE3./(JUN.^Num_of_JUNToTFE3 +Trd_of_JUNToTFE3.^Num_of_JUNToTFE3 ))))./Act_of_JUNToTFE3;
Hills_TFE3_TFE3=Inh_of_TFE3ToTFE3+((1.0 -Inh_of_TFE3ToTFE3) .* (Trd_of_TFE3ToTFE3.^Num_of_TFE3ToTFE3./(TFE3.^Num_of_TFE3ToTFE3 +Trd_of_TFE3ToTFE3.^Num_of_TFE3ToTFE3 )));
Hills_NFIC_TFE3=(Act_of_NFICToTFE3+((1.0 -Act_of_NFICToTFE3) .* (Trd_of_NFICToTFE3.^Num_of_NFICToTFE3./(NFIC.^Num_of_NFICToTFE3 +Trd_of_NFICToTFE3.^Num_of_NFICToTFE3 ))))./Act_of_NFICToTFE3;
Hills_MITF_TFE3=Inh_of_MITFToTFE3+((1.0 -Inh_of_MITFToTFE3) .* (Trd_of_MITFToTFE3.^Num_of_MITFToTFE3./(MITF.^Num_of_MITFToTFE3 +Trd_of_MITFToTFE3.^Num_of_MITFToTFE3 )));
Hills_FOS_TFE3=Inh_of_FOSToTFE3+((1.0 -Inh_of_FOSToTFE3) .* (Trd_of_FOSToTFE3.^Num_of_FOSToTFE3./(FOS.^Num_of_FOSToTFE3 +Trd_of_FOSToTFE3.^Num_of_FOSToTFE3 )));
Hills_NR3C1_ETV5=Inh_of_NR3C1ToETV5+((1.0 -Inh_of_NR3C1ToETV5) .* (Trd_of_NR3C1ToETV5.^Num_of_NR3C1ToETV5./(NR3C1.^Num_of_NR3C1ToETV5 +Trd_of_NR3C1ToETV5.^Num_of_NR3C1ToETV5 )));
Hills_ETV5_ETV5=(Act_of_ETV5ToETV5+((1.0 -Act_of_ETV5ToETV5) .* (Trd_of_ETV5ToETV5.^Num_of_ETV5ToETV5./(ETV5.^Num_of_ETV5ToETV5 +Trd_of_ETV5ToETV5.^Num_of_ETV5ToETV5 ))))./Act_of_ETV5ToETV5;
Hills_MITF_ETV5=(Act_of_MITFToETV5+((1.0 -Act_of_MITFToETV5) .* (Trd_of_MITFToETV5.^Num_of_MITFToETV5./(MITF.^Num_of_MITFToETV5 +Trd_of_MITFToETV5.^Num_of_MITFToETV5 ))))./Act_of_MITFToETV5;
Hills_NR2F1_TFAP2A=(Act_of_NR2F1ToTFAP2A+((1.0 -Act_of_NR2F1ToTFAP2A) .* (Trd_of_NR2F1ToTFAP2A.^Num_of_NR2F1ToTFAP2A./(NR2F1.^Num_of_NR2F1ToTFAP2A +Trd_of_NR2F1ToTFAP2A.^Num_of_NR2F1ToTFAP2A ))))./Act_of_NR2F1ToTFAP2A;
Hills_MITF_TFAP2A=(Act_of_MITFToTFAP2A+((1.0 -Act_of_MITFToTFAP2A) .* (Trd_of_MITFToTFAP2A.^Num_of_MITFToTFAP2A./(MITF.^Num_of_MITFToTFAP2A +Trd_of_MITFToTFAP2A.^Num_of_MITFToTFAP2A ))))./Act_of_MITFToTFAP2A;
dx(1,:) = Prod_of_AHR.*Hills_AHR_AHR.*Hills_NFIC_AHR.*Hills_FOS_AHR - Deg_of_AHR.*AHR;
dx(2,:) = Prod_of_NFIC.*Hills_NR3C1_NFIC.*Hills_MITF_NFIC - Deg_of_NFIC.*NFIC;
dx(3,:) = Prod_of_FOS.*Hills_AHR_FOS.*Hills_NR3C1_FOS.*Hills_SMAD3_FOS.*Hills_NFIC_FOS.*Hills_MITF_FOS.*Hills_SMAD4_FOS.*Hills_FOS_FOS - Deg_of_FOS.*FOS;
dx(4,:) = Prod_of_KLF4.*Hills_AHR_KLF4.*Hills_JUN_KLF4.*Hills_NR3C1_KLF4.*Hills_SMAD3_KLF4.*Hills_TBX3_KLF4.*Hills_MITF_KLF4 - Deg_of_KLF4.*KLF4;
dx(5,:) = Prod_of_FOXF1.*Hills_KLF4_FOXF1 - Deg_of_FOXF1.*FOXF1;
dx(6,:) = Prod_of_JUN.*Hills_JUN_JUN.*Hills_SMAD3_JUN.*Hills_KLF4_JUN.*Hills_MITF_JUN.*Hills_SMAD4_JUN - Deg_of_JUN.*JUN;
dx(7,:) = Prod_of_SMAD3.*Hills_AHR_SMAD3.*Hills_JUN_SMAD3.*Hills_NR3C1_SMAD3.*Hills_NFIC_SMAD3.*Hills_FOS_SMAD3 - Deg_of_SMAD3.*SMAD3;
dx(8,:) = Prod_of_MITF.*Hills_AHR_MITF.*Hills_JUN_MITF.*Hills_NR3C1_MITF.*Hills_SMAD3_MITF.*Hills_KLF4_MITF.*Hills_MITF_MITF.*Hills_SMAD4_MITF - Deg_of_MITF.*MITF;
dx(9,:) = Prod_of_SMAD4.*Hills_NR3C1_SMAD4 - Deg_of_SMAD4.*SMAD4;
dx(10,:) = Prod_of_MAFB.*Hills_MAFB_MAFB.*Hills_NR3C1_MAFB - Deg_of_MAFB.*MAFB;
dx(11,:) = Prod_of_NR3C1.*Hills_AHR_NR3C1.*Hills_JUN_NR3C1.*Hills_SMAD3_NR3C1.*Hills_NFIC_NR3C1.*Hills_FOS_NR3C1 - Deg_of_NR3C1.*NR3C1;
dx(12,:) = Prod_of_NR2F1.*Hills_NR3C1_NR2F1.*Hills_KLF4_NR2F1.*Hills_NFIC_NR2F1.*Hills_FOS_NR2F1 - Deg_of_NR2F1.*NR2F1;
dx(13,:) = Prod_of_STAT5A.*Hills_STAT5A_STAT5A.*Hills_MITF_STAT5A - Deg_of_STAT5A.*STAT5A;
dx(14,:) = Prod_of_TBX3.*Hills_SMAD3_TBX3.*Hills_TBX3_TBX3.*Hills_KLF4_TBX3.*Hills_NFIC_TBX3 - Deg_of_TBX3.*TBX3;
dx(15,:) = Prod_of_TFE3.*Hills_JUN_TFE3.*Hills_TFE3_TFE3.*Hills_NFIC_TFE3.*Hills_MITF_TFE3.*Hills_FOS_TFE3 - Deg_of_TFE3.*TFE3;
dx(16,:) = Prod_of_ETV5.*Hills_NR3C1_ETV5.*Hills_ETV5_ETV5.*Hills_MITF_ETV5 - Deg_of_ETV5.*ETV5;
dx(17,:) = Prod_of_TFAP2A.*Hills_NR2F1_TFAP2A.*Hills_MITF_TFAP2A - Deg_of_TFAP2A.*TFAP2A;
Ajac=jacobian(dx,[AHR;NFIC;FOS;KLF4;FOXF1;JUN;SMAD3;MITF;SMAD4;MAFB;NR3C1;NR2F1;STAT5A;TBX3;TFE3;ETV5;TFAP2A]);

Ajac=subs(Ajac,{'AHR','NFIC','FOS','KLF4','FOXF1','JUN','SMAD3','MITF','SMAD4','MAFB','NR3C1','NR2F1','STAT5A','TBX3','TFE3','ETV5','TFAP2A'},{x(1),x(2),x(3),x(4),x(5),x(6),x(7),x(8),x(9),x(10),x(11),x(12),x(13),x(14),x(15),x(16),x(17)});
Ajac=double(Ajac);
% A*sigma+sigma*A'+2D
P=zeros(kk^2,kk^2);  %coefficient matrix
%%the initial of coeffiicient matrix
for i=0:(kk-1)
    P(i*kk+1:i*kk+kk,i*kk+1:i*kk+kk)=P(i*kk+1:i*kk+kk,i*kk+1:i*kk+kk)+Ajac;
end

for m=0:kk-1
    for i=1:kk
        for j=1:kk
            P(m*kk+i,(j-1)*kk+i)=P(m*kk+i,(j-1)*kk+i)+Ajac(m+1,j);
        end
    end
end

B=zeros(kk^2,1);
for i=1:kk
    B((i-1)*kk+i)=-2*d;
end


xx=P\B;

end
