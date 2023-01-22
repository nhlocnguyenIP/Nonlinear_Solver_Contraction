clear all;
close all;
caseid = 1;
nois = 10;

st = sprintf('Data/data%d%noise%d',caseid,nois);
load(st);

temp = abs(u_true - u)/max(max(abs(u_true)));
max(max(temp))