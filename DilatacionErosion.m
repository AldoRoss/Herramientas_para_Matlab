clc
clear all
close all all
warning off all


%Implementacian de erosion y dilatacion con diferentes estructuras, para
%pareciar mejor las operaciones usar imagenes pequeñas o hacer mas grandes
%las estructuras.

Imagen = imread('Screenshot_20231214_120606_H&M.jpg');
ImGris = rgb2gray(Imagen); 
ImBW = imbinarize(ImGris);
est1 = [1, 0, 1, 1];

%L
est2 = [
    1, 1, 0, 0, 0; 
    1, 1, 0, 0, 0; 
    1, 1, 0, 0, 0;
    1, 1, 1, 1, 1;
    1, 1, 1, 1, 1; 
 ];
 
 %Rombo
est3 = [
    0, 0, 1, 0, 0;
    0, 1, 1, 1, 0;
    1, 1, 1, 1, 1;
    0, 1, 1, 1, 0;
    0, 0, 1, 0, 0;
];

%Círculo 
est4 = [
    0, 0, 0, 1, 1, 0, 0, 0;
    0, 0, 1, 1, 1, 1, 0, 0;
    0, 1, 1, 1, 1, 1, 1, 0;
    1, 1, 1, 1, 1, 1, 1, 1;
    1, 1, 1, 1, 1, 1, 1, 1;
    0, 1, 1, 1, 1, 1, 1, 0;
    0, 0, 1, 1, 1, 1, 0, 0;
    0, 0, 0, 1, 1, 0, 0, 0;
];
%Estructuras para erosion 
est5 = [1,1,1,1,1];

est6 = [1,1,1;
        1,1,1;
        1,1,1];

est7 = [1,1,1];

est8 = [0,1,1,1,1];

usuario = 0;
while usuario == 0
    %Pedir al usuario la instruccion
    disp('Dilatación y Erosión')
    disp('1. Dilatación'); 
    disp('2. Erosión'); 
    opc = input('Ingrese el númerode la opciónque desea realizar:'); 
    if opc == 1
        imagen1 = Dilatacion(ImBW, est1); 
        imagen2 = Dilatacion(ImBW, est2);
        imagen3 = Dilatacion(ImBW, est3);
        imagen4 = Dilatacion(ImBW, est4);
    elseif opc == 2
        imagen1 = Erosion(ImBW, est5);
        imagen2 = Erosion(ImBW, est6);
        imagen3 = Erosion(ImBW, est7);
        imagen4 = Erosion(ImBW, est8);
    else 
        disp('Opción no reconocida'); 
    end
    
    
    imagenRef = ImBW;
    
    
    
    %Mostrar las imágenes 
    figure;
    subplot(2, 2, [1 2]); 
    imshow(imagenRef);
    title('Imagen de referencia', 'FontSize', 12, 'HorizontalAlignment', 'center');
    
    % Imagenes de abajo
    subplot(2, 4, 5); 
    imshow(imagen1);
    title('Imagen 1', 'FontSize', 10, 'HorizontalAlignment', 'center');
    
    subplot(2, 4, 6); 
    imshow(imagen2);
    title('Imagen 2', 'FontSize', 10, 'HorizontalAlignment', 'center');
    
    subplot(2, 4, 7); 
    imshow(imagen3);
    title('Imagen 3', 'FontSize', 10, 'HorizontalAlignment', 'center');
    
    subplot(2, 4, 8); 
    imshow(imagen4);
    title('Imagen 4', 'FontSize', 10, 'HorizontalAlignment', 'center');
    usuario = input('Introduzca 0 si quiere verificar otro pixel o 1 si quiere salir:');
end
disp('Fin del programa, gracias por usarlo :)');


function imagenFinal = Dilatacion(imagen, estructura)
    [filas, columnas] = size(imagen);
    [estFilas, estColumnas] = size(estructura);
    
    imagenFinal = zeros(filas, columnas);

    for i = 1:filas
        for j = 1:columnas
            if imagen(i, j) == 1
                for m = 1:estFilas
                    for n = 1:estColumnas
                        if estructura(m, n) == 1
                            % Actualizar la imagen final
                            if i+m-1 <= filas && j+n-1 <= columnas
                                imagenFinal(i+m-1, j+n-1) = 1;
                            end
                        end
                    end
                end
            end
        end
    end
end

function imagenFinal = Erosion(imagen, estructura)
    [filas, columnas] = size(imagen);
    [estFilas, estColumnas] = size(estructura);
    
    imagenFinal = zeros(filas, columnas);

    for i = 1:filas - estFilas + 1
        for j = 1:columnas - estColumnas + 1
            submatriz = imagen(i:i+estFilas-1, j:j+estColumnas-1);
            comparacion = xor(submatriz, estructura);
            if sum(comparacion(:)) == 0
                imagenFinal(i+round(estFilas/2), j+round(estColumnas/2)) = 1;
            else
                imagenFinal(i+round(estFilas/2), j+round(estColumnas/2)) = 0;
            end
        end
    end
end

