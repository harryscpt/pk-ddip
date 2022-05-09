# pk-ddip
The PK-DDIP (pharmacokinetic drug-drug interaction prediction) model is a model for quantitative DDI prediction with high accuracy, while constructing a highly reliable PK-DDI database. In this repository, users can check the PK-DDI DB and code files used to develop the PK-DDIP model.


# PK-DDI DB.xlsx
PK DDI information (perpetrator drug (d1), d1Code, victim drug (d2), d2Code, AUC FC)


# PK-DDIP model
Workspace Variables

1. bag: bagOfWords of 2830 tokens
2. DrugList: List of drugs that the trainedModel can predict.
3. PD: PD describes a drug that, when administered concurrently with the drug of interest, affects its pharmacodynamics.
4. trainedModel
5. vectorPOLY: The vectorPOLY digraph shows The binding relationship between a drug and target/enzyme/carrier/transporter

Example
load('DDIDATA_v2.mat');
allpairprediction(list,PD,vectorPOLY,bag,trainedModel,"/home/usr/alllll.txt");
