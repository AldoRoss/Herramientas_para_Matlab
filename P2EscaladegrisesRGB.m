clc
clear all
close all
warning of all

%descomponer la imagen en sus componentes RGB para mostrar sus escalas en
%grises
a=imread('Imagen.jpg');
imshow(a);
%Imagen roja
title('Color rojo');
rojo=a;
rojo(:,:,1);
rojo(:,:,2)=0;
rojo(:,:,3)=0;
%Imagen verde
verde=a;
verde(:,:,1)=0;
verde(:,:,2);
verde(:,:,3)=0;

%Imagen azul
azul=a;
azul(:,:,1)=0;
azul(:,:,2)=0;
azul(:,:,3);
%Escala de grises rgb
%Rojo
figure(1);
imshow(rojo(:,:,1));
%Verde
figure(2);
imshow(verde(:,:,2));
%Azul
figure(3);
imshow(azul(:,:,3));
