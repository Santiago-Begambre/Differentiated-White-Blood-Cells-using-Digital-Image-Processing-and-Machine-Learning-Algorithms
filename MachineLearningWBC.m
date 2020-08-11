%% Codigo para la creaci�n del modelo de clasificaci�n

%% Imagenes Preprocesadas y Definici�n de Clases

direcdeimg='Ubique aqu� la ruta ubicaci�n de su carpeta con los sets de imagenes C:\Users\asus\Desktop...';
imgset = imageSet(direcdeimg, 'recursive'); 
disp(['El set de imagenes cuenta con: ', num2str(sum([imgset.Count])),...
    'imagenes de' num2str(numel(imgset)) ' clases '])

%% Visualizaci�n de las Imagenes por clases
% Para ejecutar esta secci�n descargue las funciones que se presentan a 
%continuaci�n

% createButtonLabel(string,varargin)
% createTabLabels(cellstrIn,nPerRow)
% createUniqueName(baseString)
% expandAxes(hndls,rotEnable)
% imageSetViewer(imgSet,varargin)
% ISVChangePanel(mainPanel,allListboxes,nPerRow,imgAx)
% ISVUpdateImage(obj,varargin)
% pathsFromImageSet(imgSet)
% removePathFromImageSet(imgSet,pathToRemove,recurse)
% tabPanel(parent,tabLabels,varargin)

imageSetViewer(imgset)


%% Entrenamiento
% Para este algoritmo de clasificaci�n se utilizo la subfunci�n de
% StrongestFeatures, sin embargo puede otras de acuerdo a su preprocesamiento y
% numero de imagenes.
training=bagOfFeatures(imgset,...
    'StrongestFeatures',1)...)
    
%% Histograma de los Resultados
CaracteristicasData=double(encode(training, imgset));
ImageData=array2table(CaracteristicasData);
TipodeCaracteristica=categorical(repelem({imgset.Description}'...
    ,[imgset.Count],1));
ImageData.TipodeCaracteristica=TipodeCaracteristica;

%% Validaci�n de Datos y Modelo de Clasficaci�n
% 1. Seleccione la carpeta correspondiente con las caracteristicas por imagen
% 2. Seleccione el metodo de validaci�n correspondiente
% 3. Entrene su algoritmo con el modelo de clasificaci�n correspondiente
% 4. Exporte su modelo de clasificaci�n
classificationLearner

%% Clasificador Entrenado
% Identifique las herramientas de su modelo de clasificaci�n para su
% correcta utilizaci�n
trainedClassifier