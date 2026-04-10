######################################################################################################################################
# Libreria Daunt Books


DROP DATABASE libreria;
CREATE SCHEMA libreria;

# para entrar en esta base de datos
USE libreria;


######################################################################################################################################

CREATE TABLE autores (
    id_autor INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido TEXT
);

INSERT INTO autores (id_autor, nombre, apellido)
VALUES
  (1, 'Gabriel', 'García Márquez'),
  (2, 'Mario', 'Vargas Llosa'),
  (3, 'Isabel', 'Allende'),
  (4, 'Julio', 'Cortázar'),
  (5, 'Jorge Luis', 'Borges');

######################################################################################################################################
  
CREATE TABLE categorias (
    id_categoria INTEGER PRIMARY KEY,
    nombre TEXT
);

INSERT INTO categorias (id_categoria, nombre) VALUES
    (1, 'Realismo mágico'),
    (2, 'Narrativa'),
    (3, 'Novela'),
    (4, 'Ficción'),
	(5, 'Biografía'),
    (6, 'Histórico'),
    (7, 'Ensayo');

######################################################################################################################################
 
CREATE TABLE libros (
  id_libro INTEGER PRIMARY KEY,
  titulo TEXT,
  autor_id INTEGER,
  descripcion TEXT,
  fecha_publicacion DATE,
  categoria_id INTEGER,
  precio DECIMAL(10,2),
  stock INTEGER,
  FOREIGN KEY (autor_id) REFERENCES autores(id_autor),
  FOREIGN KEY (categoria_id) REFERENCES categorias(id_categoria)
);

INSERT INTO libros (id_libro, titulo, autor_id, descripcion, fecha_publicacion, categoria_id, precio, stock)
VALUES
  (1, 'Cien años de soledad', 1, 'Una de las obras cumbres de la literatura latinoamericana', '1967-05-30', 1, 25.99, 10),
  (2, 'La ciudad y los perros', 2, 'Una novela de formación ambientada en una escuela militar', '1963-06-28', 1, 19.99, 15),
  (3, 'La casa de los espíritus', 3, 'Una novela de realismo mágico que narra la historia de tres generaciones de mujeres', '1982-01-01', 1, 21.99, 8),
  (4, 'Rayuela', 4, 'Una obra experimental que juega con el lenguaje y la estructura narrativa', '1963-06-28', 4, 17.50, 20),
  (5, 'Ficciones', 5, 'Un conjunto de cuentos y relatos que exploran temas filosóficos y metafísicos', '1944-06-14', 2, 23.99, 12),
  (6, 'Paula', 3, 'Una narrativa que te identifica con el dolor de una madre', '1994-01-01', 2, 19.95, 6);
  
######################################################################################################################################

CREATE TABLE prestamos (
  id_prestamo INTEGER PRIMARY KEY,
  libro_id INTEGER,
  cliente_id INTEGER,
  fecha_prestamo DATE,
  fecha_devolucion DATE,
  FOREIGN KEY(libro_id) REFERENCES libros(id_libro)
);

INSERT INTO prestamos (id_prestamo, libro_id, cliente_id, fecha_prestamo, fecha_devolucion)
VALUES
  (1, 1, 1, '2022-03-01', '2022-03-07'),
  (2, 2, 2, '2022-03-02', '2022-03-08'),
  (3, 3, 3, '2022-03-03', '2022-03-09'),
  (4, 4, 4, '2022-03-04', '2022-03-10'),
  (5, 5, 5, '2022-03-05', '2022-03-11'),
  (6, 1, 5, '2022-04-01', '2022-04-07'),
  (7, 1, 3, '2022-03-09', '2022-03-15'),
  (8, 5, 3, '2022-03-15', '2022-03-24');
  
################################################

# MAS DATOS

INSERT INTO autores (id_autor, nombre, apellido)
VALUES
  (6, 'Laura', 'Esquivel'),
  (7, 'Carlos', 'Fuentes'),
  (8, 'Julia de', 'Burgos'),
  (9, 'Pablo', 'Neruda'),
  (10, 'Alejo', 'Carpentier');

INSERT INTO categorias (id_categoria, nombre)
VALUES
    (8, 'Poesía'),
    (9, 'Ciencia Ficción'),
    (10, 'Aventura'),
    (11, 'Filosofía');

INSERT INTO libros (id_libro, titulo, autor_id, descripcion, fecha_publicacion, categoria_id, precio, stock)
VALUES
  (13, 'El otoño del patriarca', 1, 'Una novela que retrata la vida de un dictador en un país latinoamericano', '1975-01-01', 1, 24.99, 14),
  (14, 'Conversación en la catedral', 2, 'Una obra que explora la vida en la dictadura peruana', '1969-01-01', 2, 21.50, 12),
  (15, 'Eva Luna', 3, 'Una novela que sigue la vida de una mujer nacida en Sudamérica', '1987-01-01', 1, 19.99, 16),
  (16, 'Bestiario', 4, 'Una colección de cuentos cortos que exploran lo fantástico y surreal', '1951-01-01', 4, 18.75, 18),
  (17, 'El Aleph', 5, 'Un libro que contiene cuentos que exploran lo infinito y lo eterno', '1949-01-01', 2, 22.99, 20),
  (18, 'La casa verde', 2, 'Una novela que sigue la vida de un personaje a lo largo de la historia peruana', '1966-01-01', 6, 20.95, 15),
  (19, 'La guerra del fin del mundo', 2, 'Una novela histórica basada en hechos ocurridos en Brasil', '1981-01-01', 6, 26.99, 10),
  (20, 'Pantaleón y las visitadoras', 2, 'Una sátira que aborda temas relacionados con el ejército y la moral', '1973-01-01', 3, 18.50, 14),
  (21, 'La fiesta del chivo', 2, 'Una novela que narra los últimos días de la dictadura de Trujillo en República Dominicana', '2000-01-01', 1, 29.95, 12),
  (22, 'Final del juego', 4, 'Otra compilación de cuentos que muestra la maestría narrativa de Cortázar', '1956-01-01', 4, 20.50, 15),
  (23, 'Las armas secretas', 4, 'Un conjunto de relatos que juegan con la realidad y la percepción', '1959-01-01', 4, 22.99, 12);


  
######################################################################################################################################
# Libros 

SELECT COUNT(*) from autores ; 
SELECT COUNT(*) from prestamos ; 
SELECT COUNT(*) from libros ; 
SELECT COUNT(*) from categorias ; 

SELECT * from libros; 

# 1. Seleccionar todos los libros con un precio mayor a $20 y menor a 25$:
SELECT * FROM libros
WHERE precio > 20 AND precio < 25;

# 2. Encontrar el libro con la fecha de publicación más reciente:
SELECT * FROM libros
WHERE fecha_publicacion = (SELECT MAX(fecha_publicacion) FROM libros);

#función ventana: si preguntan por el tercero más reciente
#SELECT * FROM libros; 
#SELECT * 
	#	ROW_NUMBER() OVER (ORDER BY fecha_publicacion DESC) AS fila
#FROM libros;

#SELECT *, 
	#RANK() OVER (ORDER BY fecha_publicacion DESC) AS rango 
   # DENSE_RANK() 


# 3. Mostrar los libros con precio superior a la media de precios:
SELECT * FROM libros
WHERE precio > (SELECT AVG(precio) FROM libros);

# 4. Mostrar el nombre de la categoria y el número de libros 
# para cada nombre de categoría:
ALTER TABLE categorias 
CHANGE id_categoria categoria_id int ;
SELECT * FROM categorias; 

# numero de libros => diferentes titulos
SELECT c.nombre AS nombre_categoria,
       COUNT(DISTINCT l.titulo) AS cantidad_titulos FROM categorias c
LEFT JOIN libros l
       ON c.categoria_id = l.categoria_id
GROUP BY c.nombre;

# numero de libros => cantidad total de libros
SELECT c.nombre AS nombre_categoria,
       SUM(l.stock) AS cantidad_total_libros FROM categorias c
LEFT JOIN libros l
       ON c.categoria_id = l.categoria_id
GROUP BY c.nombre;

#SELECT c.nombre, 
		#COUNT(*) AS num_libros,
        #COUNT(DISTINCT l.titulo) AS num_titulos,
        #COALESCE(SUM(l.stock), 0) AS cantidad_total para que no quede null si left join
#FROM categorias c 
#LEFT JOIN libros l
#ON c.id_categoria = l.categoria_id
#GROUP BY c.nombre
#si agrupamos sobre pk, se puede obtener resto de nombre, si no es pk, solo se muestra
#datos de ese no pk 
# agrupando por la PK podemos arrastrar todos los campos de esa tabla (nombre)
#SELECT nombre, id_categoria,
#		COUNT(l.id_libro) AS total_libros,
 #       SUM(stock) AS cantidad_total
#FROM categorias c 
#INNER JOIN libros l
#ON c.id_categoria = l.categoria_id
#GROUP BY id_categoria;

# agrupando por campo que NO es PK, solo podeis mostrar/selecionar el campo de agrupacion
# (NO podeis seleccionar el id_categoria)
#SELECT nombre, 
	#	COUNT(l.id_libro) AS total_libros,
 #       SUM(stock) AS cantidad_total
#FROM categorias c 
#INNER JOIN libros l
#ON c.id_categoria = l.categoria_id
#GROUP BY nombre;

######################################################################################################################################
#  Autores


# 5. Listar todos los autores ordenados alfabéticamente por su apellido:
SELECT * FROM autores 
ORDER BY apellido ASC;

# 6. Encontrar el autor con 
# el mayor número de libros publicados: 
# (tip: calcular el número de libros que cada autor ha publicado)
ALTER TABLE autores 
CHANGE id_autor autor_id int; 
SELECT * FROM autores ; 

# nombre, apellido del autor + num libros que ha publico
SELECT a.autor_id, a.nombre, a.apellido,
       COUNT(l.id_libro) AS num_libros
FROM autores a
INNER JOIN libros l
     ON a.autor_id = l.autor_id
GROUP BY a.autor_id, a.nombre, a.apellido
ORDER BY num_libros DESC 
LIMIT 1; 

WITH publicaciones AS (
SELECT a.nombre, a.apellido, 
		COUNT(l.id_libro) AS num_libros
FROM autores a
INNER JOIN libros l 
ON a.autor_id = l.autor_id
GROUP BY a.autor_id)

SELECT * FROM publicaciones
WHERE num_libros = (SELECT MAX(num_libros) FROM publicaciones);


SELECT a.nombre, a.apellido, 
		COUNT(l.id_libro) AS num_libros
FROM autores a
INNER JOIN libros l 
ON a.autor_id = l.autor_id
GROUP BY a.autor_id
HAVING num_libros = (
		SELECT MAX(num_libros) FROM 
			(
            SELECT COUNT(*) AS num_libros
			FROM libros
			GROUP BY autor_id 
            ) subquery
        );
        

        
# 7. Obtener los nombres y apellidos de los autores 
# junto con el número de libros que tienen en stock: (tip: el número de libros llamarlo stock_total y calcularlo para cada autor)
SELECT a.autor_id, a.nombre, a.apellido,
       SUM(l.stock) AS stock_libros
FROM autores a
INNER JOIN libros l
     ON a.autor_id = l.autor_id
GROUP BY a.autor_id;

# 8. Mostrar los autores cuyos 
# libros tienen un precio promedio superior a la media: 
# (tip: calcular primeramente el nombre y apellido de los autores y el precio_promedio de los libros de cada autor)
SELECT a.autor_id, a.nombre, a.apellido,
       ROUND(AVG(l.precio), 2) AS precio_medio
FROM autores a
INNER JOIN libros l
     ON a.autor_id = l.autor_id
GROUP BY a.autor_id
HAVING precio_medio > (SELECT AVG(precio) FROM libros); 

######################################################################################################################################
# Categorias
SELECT * FROM categorias;

# 9.  Contar cuántas categorías existen en total:
SELECT COUNT(DISTINCT categoria_id) AS cat_total FROM categorias; 

# 10.  Encontrar la categoría con más libros: (tip: calcular la cantidad de libros de cada categoria)
SELECT l.categoria_id, c.nombre, SUM(l.stock) AS total_books  
FROM libros l 
INNER JOIN categorias c 
ON c.categoria_id = l.categoria_id 
GROUP BY l.categoria_id 
HAVING total_books = (
	SELECT MAX(total_books) FROM 
			(SELECT SUM(l.stock) AS total_books
			FROM libros l
			GROUP BY l.categoria_id) max_total)
ORDER BY total_books DESC;

# 11.  Listar las categorías ordenadas alfabéticamente junto con el promedio de precio de los libros en cada una de ellas: 
SELECT l.categoria_id, c.nombre, ROUND(AVG(l.precio), 2) AS precio_prom 
FROM libros l 
RIGHT JOIN categorias c
ON l.categoria_id = c.categoria_id  
WHERE l.categoria_id IS NOT NULL AND precio IS NOT NULL
GROUP BY l.categoria_id
ORDER BY c.nombre;

#####################################################################################################################################
# Prestamos
SELECT * from prestamos;

# 13. Listar los préstamos realizados por un cliente específico (1):
SELECT cliente_id, SUM(id_prestamo) AS total_prestamo FROM prestamos 
GROUP BY cliente_id 
HAVING cliente_id LIKE 1;

# 14.  Calcular la cantidad de libros prestados por mes en un año específico:
SELECT YEAR(fecha_prestamo) AS año, MONTH(fecha_prestamo) AS mes, COUNT(libro_id) AS total_libros
FROM prestamos 
GROUP BY año, mes
ORDER BY año, mes ; 

# 15.  Seleccionar el título de cada libro junto con la cantidad de veces que ha sido prestado::
SELECT COUNT(l.id_libro) AS total_prestado, l.titulo
FROM libros l 
INNER JOIN prestamos p 
ON p.libro_id = l.id_libro 
GROUP BY l.id_libro ;

# 16.  Encontrar el libro más prestado: (tip: calcular la cantidad de préstamos por cada libro)
SELECT COUNT(l.id_libro) AS total_prestado, l.titulo
FROM libros l 
INNER JOIN prestamos p 
ON p.libro_id = l.id_libro 
GROUP BY l.id_libro 
ORDER BY total_prestado DESC
LIMIT 1;

######################################################################################################################################

# EXTRAS:

# 1. Listar los libros que tienen mas de 15 unidades en stock y 
# cuyo precio sea superior al promedio de precios de todos los libros.


  
  
# 2. Obtener una lista de libros con información detallada, incluyendo 
# el título del libro, el nombre completo del autor, el precio redondeado y una categorización basada en el rango de precios. 
# La categorización deberá ser clasificada como "Económico" para libros con un precio inferior a $20, 
#"Moderado" para libros con un precio entre $20 y $25, y "Costoso" para libros con un precio superior a $25. 
# La lista debe estar ordenada por título de libro.

  
# 3. Obtener una lista de libros con información detallada, incluyendo 
# el título del libro, el nombre completo del autor, 
# una "breve_descripcion" cogiendo los primeros 100 caracteres de la descripcion y 
# la longitud total de la descripción (LENGTH). 
# Además, agregar una columna que clasifique la longitud de la descripción en tres categorías:
#  "Corta" para descripciones con menos de 60 caracteres,
#  "Moderada" para descripciones entre 60 y 70 caracteres, y 
# "Larga" para descripciones de más de 75 caracteres. 
# La lista debe estar ordenada por la longitud total de la descripción en orden descendente.

# 4. Obtener el nombre completo de los autores y el número total de libros 
# que han escrito en la categoría de 'Realismo mágico'


# 5. Obtener una lista de autores con información detallada, incluyendo 
# el nombre completo del autor y 
# el número total de libros escritos en cada categoría (crear una columna para cada categoria)
# Además, agregar una columna que clasifique a los autores en tres categorías:
# "Especializado" para autores que han escrito en una sola categoría, 
# "Versátil" para autores que han escrito en dos categorías, y 
# "Polifacético" para autores que han escrito en tres o más categorías. 
# La lista debe estar ordenada por el nombre completo del autor.