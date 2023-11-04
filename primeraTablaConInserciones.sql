CREATE TABLE Profesor (
  doc_prof VARCHAR(11) PRIMARY KEY,
  nom_prof VARCHAR(30),
  ape_prof VARCHAR(30),
  cate_prof INT,
  sal_prof INT
);
CREATE TABLE Curso (
  cod_curs SERIAL PRIMARY KEY,
  nom_curs VARCHAR(100),
  horas_cur INT,
  valor_cur INT
);

--procedimiento almacenado en postgresql
-- Crear un procedimiento almacenado para insertar un nuevo curso
--Explico con el create or replace procedure = lo que hacemos es crear el nuevo procedimiento al macenado
-- el or replace lo que hace es que si ay otro procedimiento almacenado se remplaze con este nuevo procedimiento almacenado
CREATE OR REPLACE PROCEDURE InsertarCurso(
	--EL IN esára resibir parametros de entrada (variable)
    IN nombreCurso VARCHAR(100),
    IN horasCurso INT,
    IN valorCurso INT
) AS $$ -- tenemos lo $$ que se utiliza para delimitar el bloque de código del procedimiento almacenado
BEGIN
    -- Usamos la sentencia INSERT para agregar un nuevo registro a la tabla Curso
    INSERT INTO Curso (nom_curs, horas_cur, valor_cur)
    VALUES (nombreCurso, horasCurso, valorCurso);
END;
$$ LANGUAGE plpgsql;-- especifica el lenguaje de programación utilizado en el procedimiento almacenado.
-- Llama al procedimiento InsertarCurso y pasa los valores necesarios como argumentos
-- Sustituye 'Curso de ejemplo', 40 y 5000 con los valores que desees insertar en la tabla Curso.
CALL InsertarCurso('Curso de ejemplo', 40, 5000);

-- Crear un procedimiento almacenado para editar un curso existente
CREATE OR REPLACE PROCEDURE EditarCurso(
    IN codigoCurso INT,
    IN nombreCurso VARCHAR(100),
    IN horasCurso INT,
    IN valorCurso INT
) AS $$
BEGIN
    -- Usamos la sentencia UPDATE para modificar un registro existente en la tabla Curso
    UPDATE Curso
    SET nom_curs = nombreCurso, horas_cur = horasCurso, valor_cur = valorCurso
    WHERE cod_curs = codigoCurso;
END;
$$ LANGUAGE plpgsql;
-- Llama al procedimiento EditarCurso y pasa los valores necesarios como argumentos
-- Sustituye 1 (el código del curso) y los nuevos valores para nombre, horas y valor.
CALL EditarCurso(1, 'Nuevo nombre de curso', 45, 5500);

CREATE OR REPLACE PROCEDURE EliminarCurso(
    IN codigoCurso INT
) AS $$
BEGIN
    -- Usamos la sentencia DELETE para eliminar un registro de la tabla Curso
    DELETE FROM Curso
    WHERE cod_curs = codigoCurso;
END;
$$ LANGUAGE plpgsql;
-- Llama al procedimiento EliminarCurso y pasa el código del curso que deseas eliminar
-- Sustituye 1 con el código del curso que deseas eliminar.
CALL EliminarCurso(55);

select * from Curso



CREATE TABLE Estudiante (
  doc_est VARCHAR(11) PRIMARY KEY,
  nom_est VARCHAR(30),
  ape_est VARCHAR(30),
  edad_est INT
);
CREATE TABLE Estudiantexcurso (
  cod_cur_estcur INT,
  doc_est_estcur VARCHAR(11),
  fec_ini_estcur DATE,
  PRIMARY KEY (cod_cur_estcur, doc_est_estcur),
  FOREIGN KEY (cod_cur_estcur) REFERENCES Curso(cod_curs),
  FOREIGN KEY (doc_est_estcur) REFERENCES Estudiante(doc_est)
);

INSERT INTO Profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) VALUES
('10123456789', 'Juan', 'Pérez', 1, 35000),
('20234567890', 'María', 'Gómez', 2, 45000),
('30345678901', 'Luis', 'Rodríguez', 1, 37000),
('40456789012', 'Ana', 'Sánchez', 3, 55000),
('50567890123', 'Carlos', 'López', 2, 46000),
('60678901234', 'Laura', 'Fernández', 1, 36000),
('70789012345', 'Pedro', 'Martínez', 4, 60000),
('80890123456', 'Sofía', 'García', 3, 52000),
('90901234567', 'Diego', 'Ramírez', 2, 44000),
('10112345678', 'Elena', 'Torres', 1, 38000),
('11123456789', 'Javier', 'Hernández', 5, 70000),
('12134567890', 'Isabel', 'Díaz', 4, 61000),
('13145678901', 'Ricardo', 'Vargas', 3, 53000),
('14156789012', 'Patricia', 'Ortega', 2, 46000),
('15167890123', 'Miguel', 'Reyes', 1, 37000),
('16178901234', 'Carmen', 'Morales', 3, 54000),
('17189012345', 'Fernando', 'Lara', 2, 45000),
('18190123456', 'Marcela', 'Guzmán', 1, 38000),
('19201234567', 'José', 'Salazar', 4, 62000),
('20212345678', 'Lorena', 'Pineda', 2, 45000),
('21223456789', 'Andrés', 'Silva', 1, 36000),
('22234567890', 'Beatriz', 'Montoya', 3, 55000),
('23245678901', 'Jorge', 'Cabrera', 2, 46000),
('24256789012', 'Natalia', 'Rojas', 1, 37000),
('25267890123', 'Roberto', 'Valencia', 5, 70000),
('26278901234', 'Raquel', 'Orozco', 4, 61000),
('27289012345', 'Pablo', 'Paz', 3, 53000),
('28290123456', 'Cecilia', 'Soto', 2, 46000),
('29301234567', 'Héctor', 'Mendoza', 1, 38000),
('30312345678', 'Sara', 'Estrada', 3, 54000),
('31323456789', 'Federico', 'Aguirre', 2, 45000),
('32334567890', 'Verónica', 'Jiménez', 1, 36000),
('33345678901', 'Felipe', 'Ramos', 4, 62000),
('34356789012', 'Gabriela', 'Navarro', 2, 45000),
('35367890123', 'Lorenzo', 'Peralta', 1, 37000),
('36378901234', 'Cristina', 'Campos', 5, 70000),
('37389012345', 'Eduardo', 'Mora', 4, 61000),
('38390123456', 'Adriana', 'Luna', 3, 53000),
('39401234567', 'Fernando', 'Arias', 2, 46000),
('40412345678', 'Mónica', 'Cortés', 1, 38000),
('41423456789', 'Alejandro', 'Góngora', 3, 54000),
('42434567890', 'Valeria', 'Villa', 2, 45000),
('43445678901', 'Gustavo', 'Roldán', 1, 36000),
('44456789012', 'Mariana', 'Vélez', 4, 62000),
('45467890123', 'Manuel', 'Franco', 2, 45000),
('46478901234', 'Luisa', 'Londoño', 1, 37000),
('47489012345', 'Carlos', 'Peña', 5, 70000),
('48490123456', 'Ana', 'Soto', 4, 61000),
('49501234567', 'Rafael', 'Duarte', 3, 53000),
('50512345678', 'Natalia', 'Zapata', 2, 46000);

INSERT INTO Curso (nom_curs, horas_cur, valor_cur) VALUES
('Matemáticas I', 60, 500),
('Física General', 75, 600),
('Historia del Arte', 45, 400),
('Programación en C', 90, 750),
('Literatura Universal', 60, 500),
('Química Orgánica', 70, 600),
('Diseño Gráfico', 80, 700),
('Introducción a la Economía', 45, 400),
('Inglés Avanzado', 60, 550),
('Cálculo Diferencial', 70, 600),
('Historia Mundial Contemporánea', 45, 400),
('Algoritmos y Estructuras de Datos', 90, 750),
('Filosofía', 60, 500),
('Biología Celular', 75, 650),
('Dibujo Artístico', 80, 700),
('Estadística Aplicada', 45, 400),
('Inglés Conversacional', 60, 550),
('Álgebra Lineal', 70, 600),
('Historia de la Ciencia', 45, 400),
('Desarrollo Web', 90, 750),
('Literatura Clásica', 60, 500),
('Anatomía Humana', 75, 650),
('Diseño de Interfaces de Usuario', 80, 700),
('Economía Internacional', 45, 400),
('Inglés para Negocios', 60, 550),
('Cálculo Integral', 70, 600),
('Historia del Cine', 45, 400),
('Programación en Python', 90, 750),
('Psicología', 60, 500),
('Genética', 75, 650),
('Fotografía Digital', 80, 700),
('Contabilidad Financiera', 45, 400),
('Inglés Técnico', 60, 550),
('Álgebra Abstracta', 70, 600),
('Historia Antigua', 45, 400),
('Desarrollo de Aplicaciones Móviles', 90, 750),
('Teatro y Dramaturgia', 60, 500),
('Microbiología', 75, 650),
('Arquitectura de Software', 80, 700),
('Marketing', 45, 400),
('Inglés Literario', 60, 550),
('Geometría', 70, 600),
('Historia del Deporte', 45, 400),
('Inteligencia Artificial', 90, 750),
('Sociología', 60, 500),
('Ecología', 75, 650),
('Arte Digital', 80, 700),
('Finanzas Personales', 45, 400),
('Inglés para Viajes', 60, 550),
('Álgebra Lineal Avanzada', 70, 600);

INSERT INTO Estudiante (doc_est, nom_est, ape_est, edad_est) VALUES
('10011223344', 'Luis', 'González', 20),
('20022334455', 'Ana', 'Martínez', 21),
('30033445566', 'Carlos', 'Pérez', 22),
('40044556677', 'Marta', 'Ramírez', 23),
('50055667788', 'Pedro', 'López', 20),
('60066778899', 'Sofía', 'Hernández', 21),
('70077889900', 'Javier', 'Torres', 22),
('80088990011', 'Lorena', 'Sánchez', 23),
('90090001122', 'David', 'Gómez', 20),
('10100112233', 'Laura', 'Fernández', 21),
('11111223344', 'Miguel', 'Díaz', 22),
('12122334455', 'Isabel', 'Jiménez', 23),
('13133445566', 'Jorge', 'Vargas', 20),
('14144556677', 'Carmen', 'Morales', 21),
('15155667788', 'Luisa', 'Cabrera', 22),
('16166778899', 'Ricardo', 'Ortega', 23),
('17177889900', 'María', 'Silva', 20),
('18188990011', 'Diego', 'Rojas', 21),
('19190001122', 'Valeria', 'Pineda', 22),
('20200112233', 'Andrés', 'Campos', 23),
('21211223344', 'Natalia', 'González', 20),
('22222334455', 'Eduardo', 'Martínez', 21),
('23233445566', 'Adriana', 'Pérez', 22),
('24244556677', 'Gabriel', 'Ramírez', 23),
('25255667788', 'Renata', 'López', 20),
('26266778899', 'José', 'Hernández', 21),
('27277889900', 'Sara', 'Torres', 22),
('28288990011', 'Carlos', 'Sánchez', 23),
('29290001122', 'Elena', 'Gómez', 20),
('30300112233', 'Iván', 'Fernández', 21),
('31311223344', 'Ana', 'Díaz', 22),
('32322334455', 'Héctor', 'Jiménez', 23),
('33333445566', 'Mónica', 'Vargas', 20),
('34344556677', 'Andrea', 'Morales', 21),
('35355667788', 'Roberto', 'Cabrera', 22),
('36366778899', 'Luis', 'Ortega', 23),
('37377889900', 'Lucía', 'Silva', 20),
('38388990011', 'Felipe', 'Rojas', 21),
('39390001122', 'Camila', 'Pineda', 22),
('40400112233', 'Alejandro', 'Campos', 23),
('41411223344', 'Diana', 'González', 20),
('42422334455', 'Isabella', 'Martínez', 21),
('43433445566', 'Gustavo', 'Pérez', 22),
('44444556677', 'Valentina', 'Ramírez', 23),
('45455667788', 'Manuel', 'López', 20),
('46466778899', 'Laura', 'Hernández', 21);

INSERT INTO Estudiantexcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) VALUES
(1, '10011223344', '2023-09-01'),
(2, '20022334455', '2023-09-01'),
(3, '30033445566', '2023-09-01'),
(4, '40044556677', '2023-09-01'),
(5, '50055667788', '2023-09-01'),
(6, '60066778899', '2023-09-01'),
(7, '70077889900', '2023-09-01'),
(8, '80088990011', '2023-09-01'),
(9, '90090001122', '2023-09-01'),
(10, '10100112233', '2023-09-01'),
(11, '11111223344', '2023-09-01'),
(12, '12122334455', '2023-09-01'),
(13, '13133445566', '2023-09-01'),
(14, '14144556677', '2023-09-01'),
(15, '15155667788', '2023-09-01'),
(16, '16166778899', '2023-09-01'),
(17, '17177889900', '2023-09-01'),
(18, '18188990011', '2023-09-01'),
(19, '19190001122', '2023-09-01'),
(20, '20200112233', '2023-09-01'),
(21, '21211223344', '2023-09-01'),
(22, '22222334455', '2023-09-01'),
(23, '23233445566', '2023-09-01'),
(24, '24244556677', '2023-09-01'),
(25, '25255667788', '2023-09-01'),
(26, '26266778899', '2023-09-01'),
(27, '27277889900', '2023-09-01'),
(28, '28288990011', '2023-09-01'),
(29, '29290001122', '2023-09-01'),
(30, '30300112233', '2023-09-01'),
(31, '31311223344', '2023-09-01'),
(32, '32322334455', '2023-09-01'),
(33, '33333445566', '2023-09-01'),
(34, '34344556677', '2023-09-01'),
(35, '35355667788', '2023-09-01'),
(36, '36366778899', '2023-09-01'),
(37, '37377889900', '2023-09-01'),
(38, '38388990011', '2023-09-01'),
(39, '39390001122', '2023-09-01'),
(40, '40400112233', '2023-09-01'),
(41, '41411223344', '2023-09-01'),
(42, '42422334455', '2023-09-01'),
(43, '43433445566', '2023-09-01'),
(44, '44444556677', '2023-09-01'),
(45, '45455667788', '2023-09-01'),
(46, '46466778899', '2023-09-01');