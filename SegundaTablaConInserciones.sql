--todo lo relacionado con la tabla cliente -------------------------------------------------------------------------
CREATE TABLE Cliente (
  id_cli VARCHAR(11) PRIMARY KEY,
  nom_cli VARCHAR(30),
  ape_cli VARCHAR(30),
  dir_cli VARCHAR(100),
  dep_cli VARCHAR(20),
  mes_cum_cli VARCHAR(10)
);
--procedimiento para los cliente cumpliendo años ----------------------------------------------------------------------

CREATE OR REPLACE FUNCTION ClientesCumpleaniosEnMes(mes_buscado VARCHAR(10)) RETURNS TABLE (
    id_cli VARCHAR(11),
    nom_cli VARCHAR(30),
    ape_cli VARCHAR(30),
    dir_cli VARCHAR(100),
    dep_cli VARCHAR(20),
    mes_cum_cli VARCHAR(10)
) AS $$
BEGIN
    RETURN QUERY
    SELECT *
    FROM Cliente
    WHERE Cliente.mes_cum_cli = mes_buscado;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM ClientesCumpleaniosEnMes('Enero');

--procedimientos de inseratr consultar y eliminar ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE InsertarCliente(
    IN idCliente VARCHAR(11),
    IN nombreCliente VARCHAR(30),
    IN apellidoCliente VARCHAR(30),
    IN direccionCliente VARCHAR(100),
    IN departamentoCliente VARCHAR(20),
    IN mesCumpleañosCliente VARCHAR(10)
) AS $$
BEGIN
    -- Usamos la sentencia INSERT para agregar un nuevo registro a la tabla Cliente
    INSERT INTO Cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli)
    VALUES (idCliente, nombreCliente, apellidoCliente, direccionCliente, departamentoCliente, mesCumpleañosCliente);
END;
$$ LANGUAGE plpgsql;
CALL InsertarCliente('12345678901', 'John', 'Doe', '123 Main St', 'California', 'January');

CREATE OR REPLACE PROCEDURE EditarCliente(
    IN idCliente VARCHAR(11),
    IN nuevoNombreCliente VARCHAR(30),
    IN nuevoApellidoCliente VARCHAR(30),
    IN nuevaDireccionCliente VARCHAR(100),
    IN nuevoDepartamentoCliente VARCHAR(20),
    IN nuevoMesCumpleañosCliente VARCHAR(10)
) AS $$
BEGIN
    -- Usamos la sentencia UPDATE para modificar un registro existente en la tabla Cliente
    UPDATE Cliente
    SET nom_cli = nuevoNombreCliente, ape_cli = nuevoApellidoCliente,
        dir_cli = nuevaDireccionCliente, dep_cli = nuevoDepartamentoCliente,
        mes_cum_cli = nuevoMesCumpleañosCliente
    WHERE id_cli = idCliente;
END;
$$ LANGUAGE plpgsql;
CALL EditarCliente('12345678901', 'John', 'Doe', '456 Elm St', 'New York', 'February');



CREATE OR REPLACE PROCEDURE EliminarCliente(
    IN idCliente VARCHAR(11)
) AS $$
BEGIN
    -- Usamos la sentencia DELETE para eliminar un registro de la tabla Cliente
    DELETE FROM Cliente
    WHERE id_cli = idCliente;
END;
$$ LANGUAGE plpgsql;
CALL EliminarCliente('12345678901');

-- Insertar 50 registros en la tabla Cliente
INSERT INTO Cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli) VALUES
('10123456789', 'Luis', 'González', 'Calle 123, Ciudad A', 'Departamento A', 'Enero'),
('20234567890', 'Ana', 'Martínez', 'Avenida X, Ciudad B', 'Departamento B', 'Febrero'),
('30345678901', 'Carlos', 'Pérez', 'Calle 456, Ciudad C', 'Departamento C', 'Marzo'),
('40456789012', 'Marta', 'Ramírez', 'Avenida Y, Ciudad D', 'Departamento D', 'Abril'),
('50567890123', 'Pedro', 'López', 'Calle 789, Ciudad E', 'Departamento E', 'Mayo'),
('60678901234', 'Sofía', 'Hernández', 'Avenida Z, Ciudad F', 'Departamento F', 'Junio'),
('70789012345', 'Javier', 'Torres', 'Calle 123, Ciudad G', 'Departamento G', 'Julio'),
('80890123456', 'Lorena', 'Sánchez', 'Avenida X, Ciudad H', 'Departamento H', 'Agosto'),
('90901234567', 'David', 'Gómez', 'Calle 456, Ciudad I', 'Departamento I', 'Septiembre'),
('10112345678', 'Laura', 'Fernández', 'Avenida X, Ciudad J', 'Departamento J', 'Octubre'),
('11123456789', 'Miguel', 'Díaz', 'Calle 123, Ciudad K', 'Departamento K', 'Noviembre'),
('12134567890', 'Isabel', 'Jiménez', 'Avenida Z, Ciudad L', 'Departamento L', 'Diciembre'),
('13145678901', 'Jorge', 'Vargas', 'Calle 456, Ciudad M', 'Departamento M', 'Enero'),
('14156789012', 'Carmen', 'Morales', 'Avenida X, Ciudad N', 'Departamento N', 'Febrero'),
('15167890123', 'Luisa', 'Cabrera', 'Calle 789, Ciudad O', 'Departamento O', 'Marzo'),
('16178901234', 'Ricardo', 'Ortega', 'Avenida Y, Ciudad P', 'Departamento P', 'Abril'),
('17189012345', 'María', 'Silva', 'Calle 123, Ciudad Q', 'Departamento Q', 'Mayo'),
('18190123456', 'Diego', 'Rojas', 'Avenida Z, Ciudad R', 'Departamento R', 'Junio'),
('19201234567', 'Valeria', 'Pineda', 'Calle 456, Ciudad S', 'Departamento S', 'Julio'),
('20212345678', 'Andrés', 'Campos', 'Avenida X, Ciudad T', 'Departamento T', 'Agosto'),
('21223456789', 'Natalia', 'González', 'Calle 123, Ciudad U', 'Departamento U', 'Septiembre'),
('22234567890', 'Eduardo', 'Martínez', 'Avenida X, Ciudad V', 'Departamento V', 'Octubre'),
('23245678901', 'Adriana', 'Pérez', 'Calle 456, Ciudad W', 'Departamento W', 'Noviembre'),
('24256789012', 'Gabriel', 'Ramírez', 'Avenida Z, Ciudad X', 'Departamento X', 'Diciembre'),
('25267890123', 'Renata', 'López', 'Calle 123, Ciudad Y', 'Departamento Y', 'Enero'),
('26278901234', 'José', 'Hernández', 'Avenida Y, Ciudad Z', 'Departamento Z', 'Febrero'),
('27289012345', 'Sara', 'Torres', 'Calle 789, Ciudad AA', 'Departamento AA', 'Marzo'),
('28290123456', 'Carlos', 'Sánchez', 'Avenida X, Ciudad BB', 'Departamento BB', 'Abril'),
('29301234567', 'Elena', 'Gómez', 'Calle 456, Ciudad CC', 'Departamento CC', 'Mayo'),
('30312345678', 'Iván', 'Fernández', 'Avenida Z, Ciudad DD', 'Departamento DD', 'Junio'),
('31323456789', 'Ana', 'Díaz', 'Calle 123, Ciudad EE', 'Departamento EE', 'Julio'),
('32334567890', 'Héctor', 'Jiménez', 'Avenida X, Ciudad FF', 'Departamento FF', 'Agosto'),
('33345678901', 'Mónica', 'Vargas', 'Calle 456, Ciudad GG', 'Departamento GG', 'Septiembre'),
('34356789012', 'Andrea', 'Morales', 'Avenida Y, Ciudad HH', 'Departamento HH', 'Octubre'),
('35367890123', 'Roberto', 'Cabrera', 'Calle 789, Ciudad II', 'Departamento II', 'Noviembre'),
('36378901234', 'Luis', 'Ortega', 'Avenida X, Ciudad JJ', 'Departamento JJ', 'Diciembre'),
('37389012345', 'Lucía', 'Silva', 'Calle 123, Ciudad KK', 'Departamento KK', 'Enero'),
('38390123456', 'Felipe', 'Rojas', 'Avenida Z, Ciudad LL', 'Departamento LL', 'Febrero'),
('39401234567', 'Camila', 'Pineda', 'Calle 456, Ciudad MM', 'Departamento MM', 'Marzo'),
('40412345678', 'Alejandro', 'Campos', 'Avenida Y, Ciudad NN', 'Departamento NN', 'Abril'),
('41423456789', 'Diana', 'González', 'Calle 123, Ciudad OO', 'Departamento OO', 'Mayo'),
('42434567890', 'Isabella', 'Martínez', 'Avenida X, Ciudad PP', 'Departamento PP', 'Junio'),
('43445678901', 'Gustavo', 'Pérez', 'Calle 456, Ciudad QQ', 'Departamento QQ', 'Julio'),
('44456789012', 'Valentina', 'Ramírez', 'Avenida Z, Ciudad RR', 'Departamento RR', 'Agosto'),
('45467890123', 'Manuel', 'López', 'Calle 789, Ciudad SS', 'Departamento SS', 'Septiembre'),
('46478901234', 'Laura', 'Hernández', 'Avenida Y, Ciudad TT', 'Departamento TT', 'Octubre');

--fin de lo relacionado con cliente----------------------------------------------------------------------------

--todo lo relacionado con articulo --------------------------------------------------------------------------------

CREATE TABLE Artículo (
  id_art SERIAL PRIMARY KEY,
  tit_art VARCHAR(100),
  aut_art VARCHAR(100),
  edi_art VARCHAR(300),
  prec_art INT
);

-- Insertar 50 registros en la tabla Artículo
INSERT INTO Artículo (tit_art, aut_art, edi_art, prec_art) VALUES
('Libro de Matemáticas', 'Juan Pérez', 'Editorial A', 25),
('Historia del Arte', 'María Gómez', 'Editorial B', 30),
('Introducción a la Economía', 'Luis Rodríguez', 'Editorial C', 20),
('Programación en C', 'Ana Sánchez', 'Editorial D', 40),
('Química Orgánica', 'Carlos López', 'Editorial E', 35),
('Literatura Universal', 'Laura Fernández', 'Editorial F', 28),
('Física General', 'Pedro Martínez', 'Editorial G', 32),
('Diseño Gráfico', 'Sofía García', 'Editorial H', 45),
('Inglés Avanzado', 'Diego Ramírez', 'Editorial I', 30),
('Cálculo Diferencial', 'Elena Torres', 'Editorial J', 38),
('Algoritmos y Estructuras de Datos', 'Javier Hernández', 'Editorial K', 50),
('Historia Mundial Contemporánea', 'Isabel Díaz', 'Editorial L', 30),
('Filosofía', 'Ricardo Vargas', 'Editorial M', 22),
('Biología Celular', 'Patricia Ortega', 'Editorial N', 42),
('Dibujo Artístico', 'Miguel Reyes', 'Editorial O', 36),
('Estadística Aplicada', 'Carmen Morales', 'Editorial P', 28),
('Inglés Conversacional', 'Fernando Lara', 'Editorial Q', 30),
('Álgebra Lineal', 'Marcela Guzmán', 'Editorial R', 25),
('Historia de la Ciencia', 'José Salazar', 'Editorial S', 34),
('Desarrollo Web', 'Lorena Pineda', 'Editorial T', 40),
('Literatura Clásica', 'Andrés Silva', 'Editorial U', 29),
('Anatomía Humana', 'Beatriz Montoya', 'Editorial V', 42),
('Diseño de Interfaces de Usuario', 'Jorge Cabrera', 'Editorial W', 45),
('Economía Internacional', 'Natalia Rojas', 'Editorial X', 38),
('Inglés para Negocios', 'Roberto Valencia', 'Editorial Y', 32),
('Cálculo Integral', 'Raquel Orozco', 'Editorial Z', 38),
('Historia del Cine', 'Pablo Paz', 'Editorial AA', 30),
('Programación en Python', 'Cecilia Soto', 'Editorial BB', 40),
('Psicología', 'Héctor Mendoza', 'Editorial CC', 35),
('Genética', 'Sara Estrada', 'Editorial DD', 42),
('Fotografía Digital', 'Federico Aguirre', 'Editorial EE', 45),
('Contabilidad Financiera', 'Verónica Jiménez', 'Editorial FF', 28),
('Inglés Técnico', 'Lorenzo Peralta', 'Editorial GG', 30),
('Álgebra Abstracta', 'Cristina Campos', 'Editorial HH', 25),
('Historia Antigua', 'Eduardo Mora', 'Editorial II', 32),
('Desarrollo de Aplicaciones Móviles', 'Adriana Luna', 'Editorial JJ', 45),
('Teatro y Dramaturgia', 'Fernando Arias', 'Editorial KK', 40),
('Microbiología', 'Mónica Cortés', 'Editorial LL', 42),
('Arquitectura de Software', 'Alejandro Góngora', 'Editorial MM', 50),
('Marketing', 'Valeria Villa', 'Editorial NN', 30),
('Inglés Literario', 'Gustavo Roldán', 'Editorial OO', 35),
('Geometría', 'Mariana Vélez', 'Editorial PP', 25),
('Historia del Deporte', 'Manuel Franco', 'Editorial QQ', 32),
('Inteligencia Artificial', 'Luisa Londoño', 'Editorial RR', 40),
('Sociología', 'Carlos Peña', 'Editorial SS', 30),
('Ecología', 'Ana Soto', 'Editorial TT', 38),
('Arte Digital', 'Rafael Duarte', 'Editorial UU', 36);

--fin de la tabla articulo-----------------------------------------------------------------------------------------

--tabla pedido y lo relacionado con ella --------------------------------------------------------------------------
CREATE TABLE Pedido (
  id_ped SERIAL PRIMARY KEY,
  id_cli_ped VARCHAR(11),
  fec_ped DATE,
  val_ped INT,
  FOREIGN KEY (id_cli_ped) REFERENCES Cliente(id_cli)
);


DROP FUNCTION IF EXISTS visualizarpedidosporarticulo(integer);
--procedimiento para visualizar pedidos de los articulos
CREATE OR REPLACE FUNCTION visualizarpedidosporarticulo(id_articulo INT)
RETURNS TABLE (
    nom_cli VARCHAR(30),
    dir_cli VARCHAR(100),
    id_ped INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT C.nom_cli, C.dir_cli, P.id_ped
    FROM Pedido P
    INNER JOIN Cliente C ON P.id_cli_ped = C.id_cli
    WHERE P.id_ped = id_articulo;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM visualizarpedidosporarticulo(1);

--proicedimiento para obtener la infromacioon de los cliente que tengan cierto articulo
CREATE OR REPLACE FUNCTION ObtenerInformacionCliente(
    IN cliente_id VARCHAR(11)
) RETURNS TABLE (
    nombre_cliente VARCHAR(30),
    fecha DATE,
    valor INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT c.nom_cli, p.fec_ped, p.val_ped
    FROM Cliente c
    INNER JOIN Pedido p ON c.id_cli = p.id_cli_ped
    WHERE c.id_cli = cliente_id;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM ObtenerInformacionCliente('11123456789');


select * from pedido
-- Insertar 50 registros en la tabla Pedido
INSERT INTO Pedido (id_cli_ped, fec_ped, val_ped) VALUES
('10123456789', '2023-09-05', 150),
('20234567890', '2023-09-10', 200),
('30345678901', '2023-09-15', 180),
('40456789012', '2023-09-20', 250),
('50567890123', '2023-09-25', 190),
('60678901234', '2023-09-30', 220),
('70789012345', '2023-10-05', 175),
('80890123456', '2023-10-10', 210),
('90901234567', '2023-10-15', 195),
('10112345678', '2023-10-20', 240),
('11123456789', '2023-10-25', 230),
('12134567890', '2023-10-30', 260),
('13145678901', '2023-11-05', 175),
('14156789012', '2023-11-10', 200),
('15167890123', '2023-11-15', 190),
('16178901234', '2023-11-20', 220),
('17189012345', '2023-11-25', 250),
('18190123456', '2023-11-30', 205),
('19201234567', '2023-12-05', 180),
('20212345678', '2023-12-10', 210),
('21223456789', '2023-12-15', 220),
('22234567890', '2023-12-20', 240),
('23245678901', '2023-12-25', 230),
('24256789012', '2023-12-30', 270),
('25267890123', '2024-01-05', 175),
('26278901234', '2024-01-10', 190),
('27289012345', '2024-01-15', 215),
('28290123456', '2024-01-20', 205),
('29301234567', '2024-01-25', 220),
('30312345678', '2024-01-30', 250),
('31323456789', '2024-02-05', 195),
('32334567890', '2024-02-10', 210),
('33345678901', '2024-02-15', 220),
('34356789012', '2024-02-20', 240),
('35367890123', '2024-02-25', 260),
('36378901234', '2024-02-28', 270),
('37389012345', '2024-03-05', 190),
('38390123456', '2024-03-10', 210),
('39401234567', '2024-03-15', 215),
('40412345678', '2024-03-20', 230),
('41423456789', '2024-03-25', 270),
('42434567890', '2024-03-30', 250),
('43445678901', '2024-04-05', 195),
('44456789012', '2024-04-10', 210),
('45467890123', '2024-04-15', 220),
('46478901234', '2024-04-20', 240);
--fin de la tabla pedido

--tabla pedido articulopedido y lo relacionado con ella

CREATE TABLE Artículoxpedido (
  id_ped_artped INT,
  id_art_artped INT,
  can_art_artped INT,
  val_ven_art_artped INT,
  FOREIGN KEY (id_ped_artped) REFERENCES Pedido(id_ped),
  FOREIGN KEY (id_art_artped) REFERENCES Artículo(id_art)
);

-- Insertar 50 registros en la tabla Artículoxpedido
INSERT INTO Artículoxpedido (id_ped_artped, id_art_artped, can_art_artped, val_ven_art_artped) VALUES
(1, 1, 2, 50),
(2, 2, 3, 60),
(3, 3, 1, 40),
(4, 4, 4, 80),
(5, 5, 2, 70),
(6, 6, 3, 90),
(7, 7, 1, 55),
(8, 8, 5, 100),
(9, 9, 2, 45),
(10, 10, 3, 70),
(11, 11, 1, 65),
(12, 12, 4, 95),
(13, 13, 2, 60),
(14, 14, 3, 75),
(15, 15, 1, 50),
(16, 16, 5, 110),
(17, 17, 2, 70),
(18, 18, 3, 80),
(19, 19, 1, 45),
(20, 20, 4, 85),
(21, 21, 2, 55),
(22, 22, 3, 75),
(23, 23, 1, 40),
(24, 24, 5, 105),
(25, 25, 2, 70),
(26, 26, 3, 85),
(27, 27, 1, 45),
(28, 28, 4, 95),
(29, 29, 2, 60),
(30, 30, 3, 75),
(31, 31, 1, 50),
(32, 32, 5, 115),
(33, 33, 2, 70),
(34, 34, 3, 90),
(35, 35, 1, 55),
(36, 36, 4, 100),
(37, 37, 2, 60),
(38, 38, 3, 75),
(39, 39, 1, 45),
(40, 40, 5, 105),
(41, 41, 2, 70),
(42, 42, 3, 85),
(43, 43, 1, 45),
(44, 44, 4, 95),
(45, 45, 2, 60),
(46, 46, 3, 80);

--fin de la tabla Artículoxpedido ----------------------------------------------------------------------------
--tabla compañia y lo relacionado con ella-----------------------------------------------------------------------
 CREATE TABLE Compañia (
  comnit VARCHAR(11) PRIMARY KEY,
  comnombre VARCHAR(30),
  comañofun INT,
  comreplegal VARCHAR(100)
);
--el procedimiento de el año de la dundacion por año -----------------------------------------------------------
CREATE OR REPLACE FUNCTION EmpresasFundadasPorAño(
    IN año_fundacion INT
) RETURNS TABLE (
    nit VARCHAR(11),
    nombre VARCHAR(30),
    anio_fundacion INT,
    representante_legal VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY
    SELECT comnit, comnombre, comañofun, comreplegal
    FROM Compañia
    WHERE comañofun = año_fundacion;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM EmpresasFundadasPorAño(2000);

--procedimiento almacenado para visualizar la empresa por el nit -------------------------------------------------
CREATE OR REPLACE FUNCTION VisualizarEmpresaPorNIT(
    IN nit_empresa VARCHAR(11)
) RETURNS TABLE (
    nit VARCHAR(11),
    nombre VARCHAR(30),
    año_fundacion INT,
    representante_legal VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY
    SELECT comnit, comnombre, comañofun, comreplegal
    FROM Compañia
    WHERE comnit = nit_empresa;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM VisualizarEmpresaPorNIT('12345678901');

--Procedimiento almacenado de insertar actualizar y eliminar 
CREATE OR REPLACE PROCEDURE InsertarCompañia(
	IN comnit VARCHAR(11),
	IN comNombre VARCHAR(30),
	IN comAñofun INT,
	IN comReplegal varchar(100)
)AS $$
BEGIN
INSERT INTO Compañia (comnit, comnombre, comañofun, comreplegal) 
VALUES (comnit,comNombre,comAñofun,comReplegal);
END;
$$ LANGUAGE plpgsql;
CALL InsertarCompañia('123441','compañiaWww',2005,'Juan Esteban N');

DROP PROCEDURE EditarCompañia(character varying, character varying, integer, character varying);
CREATE OR REPLACE PROCEDURE EditarCompañia(
    IN new_comnit VARCHAR(11),
    IN new_comNombre VARCHAR(30),
    IN new_comAñofun INT,
    IN new_comReplegal VARCHAR(100)
) AS $$
BEGIN 
    UPDATE Compañia AS c
    SET comnombre = new_comNombre, comañofun = new_comAñofun, comreplegal = new_comReplegal
    WHERE comnit = new_comnit;
END;
$$ LANGUAGE plpgsql;


-- Llama al procedimiento EditarCompañia y pasa los nuevos valores junto con el NIT de la compañía que deseas editar.
-- Sustituye '123441' con el NIT de la compañía que deseas editar.
CALL EditarCompañia('123441', 'NuevoNombreCompañia', 2020, 'NuevoRepresentanteLegal');

CREATE OR REPLACE PROCEDURE EliminarCompañia(
	IN Eli_comnit VARCHAR(11)
)AS $$
BEGIN
DELETE FROM Compañia
WHERE comnit = Eli_comnit;
END;
$$ LANGUAGE plpgsql;

select * from Compañia
-- Insertar 50 registros en la tabla Compañia
INSERT INTO Compañia (comnit, comnombre, comañofun, comreplegal) VALUES
('12345678901', 'Compañía A', 1990, 'Juan Pérez'),
('23456789012', 'Compañía B', 1985, 'Ana Gómez'),
('34567890123', 'Compañía C', 2000, 'Carlos Rodríguez'),
('45678901234', 'Compañía D', 1995, 'María López'),
('56789012345', 'Compañía E', 2005, 'Pedro Martínez'),
('67890123456', 'Compañía F', 1988, 'Sofía Ramírez'),
('78901234567', 'Compañía G', 2001, 'Javier Torres'),
('89012345678', 'Compañía H', 1992, 'Lorena Sánchez'),
('90123456789', 'Compañía I', 1998, 'David Gómez'),
('10123456789', 'Compañía J', 2004, 'Laura Díaz'),
('11234567890', 'Compañía K', 1991, 'Miguel Rodríguez'),
('12345678901', 'Compañía L', 2002, 'Isabel López'),
('13456789012', 'Compañía M', 1987, 'Jorge Ramírez'),
('14567890123', 'Compañía N', 1997, 'Carmen Martínez'),
('15678901234', 'Compañía O', 1993, 'Luis Rodríguez'),
('16789012345', 'Compañía P', 1999, 'Ricardo Torres'),
('17890123456', 'Compañía Q', 2006, 'María Sánchez'),
('18901234567', 'Compañía R', 1994, 'Diego López'),
('20123456789', 'Compañía S', 1996, 'Valeria Martínez'),
('21234567890', 'Compañía T', 2003, 'Natalia Pérez'),
('22345678901', 'Compañía U', 1986, 'Eduardo García'),
('23456789012', 'Compañía V', 2007, 'Adriana Díaz'),
('24567890123', 'Compañía W', 1989, 'Gabriel Martínez'),
('25678901234', 'Compañía X', 2008, 'Renata Ramírez'),
('26789012345', 'Compañía Y', 1990, 'Roberto Torres'),
('27890123456', 'Compañía Z', 2009, 'Manuel Sánchez'),
('28901234567', 'Compañía AA', 1992, 'Lucía Díaz'),
('30123456789', 'Compañía BB', 2010, 'Felipe Ramírez'),
('31234567890', 'Compañía CC', 1991, 'Camila Sánchez'),
('32345678901', 'Compañía DD', 2011, 'Alejandro Torres'),
('33456789012', 'Compañía EE', 1993, 'Diana López'),
('34567890123', 'Compañía FF', 2012, 'Isabella Martínez'),
('35678901234', 'Compañía GG', 1994, 'Gustavo Rodríguez'),
('36789012345', 'Compañía HH', 2013, 'Renata Torres'),
('37890123456', 'Compañía II', 1995, 'Sara Ramírez'),
('38901234567', 'Compañía JJ', 2014, 'Carlos López'),
('40123456789', 'Compañía KK', 1996, 'Carlos Torres'),
('41234567890', 'Compañía LL', 2015, 'María Martínez'),
('42345678901', 'Compañía MM', 1997, 'Laura Gómez'),
('43456789012', 'Compañía NN', 2016, 'Sofía Pérez'),
('44567890123', 'Compañía OO', 1998, 'Pedro Rodríguez'),
('45678901234', 'Compañía PP', 2017, 'Luis López'),
('46789012345', 'Compañía QQ', 1999, 'Carmen Torres'),
('47890123456', 'Compañía RR', 2018, 'Carlos Ramírez'),
('48901234567', 'Compañía SS', 2000, 'Ana Martínez'),
('50123456789', 'Compañía TT', 2019, 'María Rodríguez');
--fin de editar compañia ---------------------------------------------------------------------------------


