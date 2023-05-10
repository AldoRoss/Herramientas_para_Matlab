clc
clear all
close all
warning of all
%Funciones por si quieres procesar la información de un pixel en particular
a=imread(['Imagen.jpg']);


%Con impixel obtienes el valor RGB del pixel que seleccionaste
figure(1);
valorRBG = impixel(a);

%Si deseas conocer las coordenadas de un pixel en particular puedes ocupar
figure(2);
imshow(a);
%El número que recibe esta función es el numero de puntos a seleccionar
[X, Y] = ginput(1);
disp('Sus valores RGB estan guadados en la variable valorRBG y sus cordenadas en X & Y');
%Si no tiene nombre la variable sera nombrada ans


