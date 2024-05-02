-- SELECCIONAR UNA TABLA Y VER DATOS
SELECT * FROM CATEGORIA;
-- ORDENAR y DESCENDIENTE -> DESC - ASCEDENTE -> ASC
SELECT * FROM PLATILLOS ORDER BY PRECIO DESC;

-- COUNT -> CONTAR un campo - GROUP BY -> AGRUPARLO 
-- veremos que agrupa las veces que se repite una fecha
SELECT COUNT(ID), FECHA FROM RESERVACIONES GROUP BY FECHA ORDER BY COUNT(ID) DESC;
/* SE VUELVE A EXPLICAR CON ESTA LINEA  - sabremos cuantos platos hay de cada comida -
COUNT(id) --> cuenta y q se acumule en el id
CATEGORIAID --> es columna que seleccionamos de la tabla
FROM PLATILLOS --> la nueva tabla
GROUP BY CATEGORIAID --> agrupamos por categoria ID
ORDER BY COUNT(ID) --> ordenar por el ID de categoria que es la principal
*/
SELECT COUNT(ID), CATEGORIAID FROM PLATILLOS GROUP BY CATEGORIAID ORDER BY COUNT(ID) DESC;

-- RELACIONAR DOS TABLAS INNER JOIN -> relaciona lo que es igual en dos tablas
-- con ON indicamos que columnas de ambas tablas es igual
SELECT * FROM PLATILLOS INNER JOIN CATEGORIA ON CATEGORIA.ID = PLATILLOS.CATEGORIAID;

/*CONTAR REPETIDOS Y MOSTRANDO LOS DATOS
en COUNT(PLATILLOS.ID) -> especifcamos el campo que queremos que nos cuente pq ahora apunta
a dos tablas con muchos campos.
CATEGORIA.NOMBRE --> nos trae nombre de la categoria
INNER JOIN PLATILLOS.CATEGORIAID = CATEGORIA.ID --> la comparación
GROUP BY CATEGORIA.NOMBRE; --> los agrupe por aquí 
*/
SELECT COUNT(PLATILLOS.ID), CATEGORIA.NOMBRE FROM PLATILLOS INNER JOIN CATEGORIA ON PLATILLOS.CATEGORIAID = CATEGORIA.ID GROUP BY CATEGORIA.NOMBRE;

-- CONOCER PRECIOS EN EL MENU
-- DISTINCT --> distintos y tenemos indicar campo a mostrar y la tabla (sin q se repita)
-- retorna valor sin indicar repeticiones, ignora duplicados
SELECT DISTINCT PRECIO FROM PLATILLOS;

-- FILTROS --
/* 
 DONDE PRECIO SEA ENTRE 100 Y 200
 WHERE precio BETWEEN 100 AND 200 */
 SELECT * FROM PLATILLOS WHERE PRECIO BETWEEN 100 AND 200;
 
 /* BUSCAR PALABRA EN CONCRETO 
 LIKE --> busca lo que le indiquemos en la tabla  y campo
 % --> buscara los caracteres indicados antes o despues y da igual lo que tenga a continuación o antes */
 SELECT * FROM PLATILLOS WHERE NOMBRE LIKE 'CAFE%';
 SELECT * FROM PLATILLOS WHERE NOMBRE LIKE "%TTE";
 -- %palabraBUSCAR% --> busca todo lo que contenga esos caracteres, da igual lo q haya antes o despues;
  SELECT * FROM PLATILLOS WHERE NOMBRE LIKE '%INA%';
  
  -- buscar en dos columnas
  /* CONCAT --> concatena dos campos y los pone como uno solo*/
  SELECT * FROM reservaciones WHERE CONCAT (NOMBRE, ' ', APELLIDO) LIKE "%ANA PRECIADO%";
  -- APARESCA CAMPO JUNTO ASI
  SELECT CONCAT (NOMBRE, ' ', APELLIDO) FROM reservaciones WHERE CONCAT (NOMBRE, ' ', APELLIDO) LIKE "%ANA PRECIADO%";
  -- ALIAS -- 
  -- en campo a mostrar controlemos lo que ponga
SELECT CONCAT (NOMBRE, ' ', APELLIDO)
AS 'NOMBRE y APELLIDOS'
FROM reservaciones
WHERE CONCAT (NOMBRE, ' ', APELLIDO)
LIKE "%ANA PRECIADO%";

-- si quieres resto info debes solo poner coma y todas tablas que desees
SELECT CONCAT (NOMBRE, ' ', APELLIDO)
AS 'CLIENTE', fecha 'DIA', hora 'HORA', cantidadmesa 'NUM SILLA RESERVA'
FROM reservaciones
WHERE CONCAT (NOMBRE, ' ', APELLIDO)
LIKE "%ANA PRECIADO%";

-- hacer multiples condiciones con IN  --> poner margen inicio y de fin
SELECT * FROM RESERVACIONES WHERE CANTIDADMESA IN (2,3);
-- para fecha en concreto
SELECT * FROM RESERVACIONES WHERE FECHA = '2019-07-02' AND CANTIDADMESA IN (2,3);