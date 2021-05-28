%% INTRODUCTION TO SHM (2021/1) - HOMEWORK #2
% Professor: Samuel da Silva
% Student: Estevao Fuzaro de Almeida
% Date: 27/05/2021
clc; clear; close all
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(groot,'defaultTextInterpreter','latex');

%% PARAMETERS
txtsize = 28;           % Figures text size
axislimit = true;       % Limit Axis on Plots
fi = 1e4;               % Initial Frequency
ff = 1.2e4;               % Final Frequency

%% READING DATA
PamelaDatasetRead

%% PLOTTING DATASET
PamelaDatasetPlot

%% SIMPLE RMSD - Freq: fi <=> ff Hz
PamelaDatasetSimpleRMSD

%% FREQUENCY SHIFT
df = 5;
dA = 2;
Threshold = 10;
RMSDShifted