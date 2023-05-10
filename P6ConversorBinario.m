clc
clear all
close all
warning of all
%Programa para obtener el valor binario de un número, ya sea positivo o negativo
%Aquí ingrese el número que desea y el número de bits que ocupa su número
%Si es negativo ingrese el número de bits que ocupa su forma positiva
cadena = '';
Num = input('Ingrese el número que desea conocer en binario:');
bits = input('Ingrese el número de bits que requiere sun número positivo:');
    %convertimos el valor a binario
     if (Num<0)
        y = abs(Num);
        y0 = dec2bin(y, bits);
        y1 = ['0' y0];
        % Invertir todos los bits
        y2 = double(y1) - '0';
        % Invertir bits
        y3 = ~y2;
        
        % Convertir de vuelta a cadena de caracteres
        y4 = char(y3 + '0');
        z1 = y4;
        z2 = '1';
        %sumarle 1
        z11 = bin2dec(z1);
        z22 = bin2dec(z2);
        num_neg = z11 + z22;

        num_neg_bin = dec2bin(num_neg);
        cadena = [cadena num_neg_bin];
    
    
     else
          num_bin = dec2bin(Num, bits);
          cadena = [cadena '0'];
          cadena = [cadena num_bin];
     end
        disp('Su número en binario es:')
        disp(cadena);
        disp('Recuerde que el primer bit es de signo, si es 0 es positivo, si es 1 es negativo.');