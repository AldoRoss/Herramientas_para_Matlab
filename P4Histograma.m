clc
clear all
close all
warning off all
%si deseas obtener el histograma de una imagen te presento dos alternativas
a = imread('Imagen.jpg');
figure(1);
subplot(2,2,1);
imshow(a);
subplot(2,2,2);
%Usar la función histogram
histogram(a);
title('Función histogram')
subplot(2,2,3);
%o puedes usar la función imhist y despues mostrarla con bar
histograma = imhist(a);
bar(histograma);
title('Función imhist y bar')
subplot(2,2,3);
%bar(b);