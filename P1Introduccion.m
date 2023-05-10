clc
clear all
close all
warning of all
%Imagen normal a color
figure(1)
a=imread('Imagen.jpg');
imshow(a);
%Imagen a escala de grises
figure(2);
b=rgb2gray(a);
imshow(b);
%Imagen a blanco y negro
figure(3);
c=imbinarize(b);
imshow(c);
%Descomponer la Imagen en sus componentes RGB
%Imagen roja
figure(4);
title('Color rojo');
rojo=a;
rojo(:,:,1);
rojo(:,:,2)=0;
rojo(:,:,3)=0;
imshow(rojo);

%Imagen verde
figure(5);
title('Color verde');
verde=a;
verde(:,:,1)=0;
verde(:,:,2);
verde(:,:,3)=0;
imshow(verde);

%Imagen azul
figure(6);
title('Color azul');
azul=a;
azul(:,:,1)=0;
azul(:,:,2)=0;
azul(:,:,3);
imshow(azul);




