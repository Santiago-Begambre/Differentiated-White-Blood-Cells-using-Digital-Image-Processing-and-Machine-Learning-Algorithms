%% Codigo para la creación del modelo de clasificación

%% Imagenes Preprocesadas y Definición de Clases

direcdeimg='Ubique aquí la ruta ubicación de su carpeta con los sets de imagenes C:\Users\asus\Desktop...';
imgset = imageSet(direcdeimg, 'recursive'); 
disp(['El set de imagenes cuenta con: ', num2str(sum([imgset.Count])),...
    'imagenes de' num2str(numel(imgset)) ' clases '])

%% Visualización de las Imagenes por clases
% Para ejecutar esta sección descargue las funciones que se presentan a 
%continuación

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
% Para este algoritmo de clasificación se utilizo la subfunción de
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

%% Validación de Datos y Modelo de Clasficación
% 1. Seleccione la carpeta correspondiente con las caracteristicas por imagen
% 2. Seleccione el metodo de validación correspondiente
% 3. Entrene su algoritmo con el modelo de clasificación correspondiente
% 4. Exporte su modelo de clasificación
classificationLearner

%% Clasificador Entrenado
% Identifique las herramientas de su modelo de clasificación para su
% correcta utilización
trainedClassifier