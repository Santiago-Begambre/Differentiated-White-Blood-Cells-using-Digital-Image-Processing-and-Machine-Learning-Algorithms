%% Codigo para Realizar el Preprocesamiento de las Imagenes

%% Selección de Carpetas de Imagenes y Originales y reprocesadas

ImageOriginal=dir('Ubique aquí la ruta de ubicación de su carpeta con el set de imagenes correspondiente a la clase respectiva y seleccione el tipo de imagen que es al final: C:\Users\asus\Desktop...*.jpg');
CarpetaImagenOriginal='Ubique aquí la ruta de ubicación de su carpeta con el set de imagenes correspondiente';
CarpetaImagenPreprocesada='Ubique aquí la ruta de ubicación de su carpeta con el set de imagenes preprocesadas';
ImagenPreprocesada=dir('Ubique aquí la ruta de ubicación de su carpeta de imagenes preprocesadas y seleccione el tipo en el que se exportara: C:\Users\asus\Desktop...*.jpg');

%% Preprocesamiento respectivo

ImagenesCompls=[ImageOriginal;ImagenPreprocesada];
xl={ImagenesCompls.name}; 
i=length(xl);
for m=1:1:i
VectImgs=xl{m};
    Image=strcat(CarpetaImagenOriginal,string(VectImgs));
    Image=imread(Image);
        Image=rgb2gray(Image);
        Image=imgaussfilt(Image);
        Image=medfilt2(Image);
        Image=histeq(Image);
        
        figure;
        imshow(Image);
        
        h_recorte = imrect();
        posicion_recorte = h_recorte.getPosition();
        posicion_recorte = round(posicion_recorte);
        seleccion_wbc = Image(posicion_recorte(2) + (0:posicion_recorte(4)), posicion_recorte(1) + (0:posicion_recorte(3)));
        figure, imshow (seleccion_wbc)
        seleccion_wbc= imresize(seleccion_wbc, [255 255]);
        seleccion_wbc=edge(seleccion_wbc,'canny');
       
    directorio=strcat(CarpetaImagenPreprocesada,num2str(m));
    directorio=strcat(directorio,'.png');
    imwrite(seleccion_wbc, directorio);
    
    figure,imshow(seleccion_wbc,[]);    
    close all;
    
end