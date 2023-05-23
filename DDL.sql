--SCRIPT PARA IMPLEMENTAR EL MODELO RELACIONAL DE REGISTRO ACADEMICO

--ZONA DE Eliminacion de Objetos

-- Si se tiene ya cargadas las tablas a la base de datos descomentar
-- estas lineas y ejecutar el script
/*
drop table matriculas;
drop table cursos;
drop table estudiantes;
drop table aulas;
drop table especialidades;
drop table cambios;
drop table errores;
drop table temporal;
*/

--ZONA DE Creacion de Objetos

CREATE TABLE estudiantes (
    id        	      NUMBER(5),
    nombre            VARCHAR2(20),
    apellido          VARCHAR2(20),
    especialidad      VARCHAR2(30),
    creditos          NUMBER(2),
    constraint esidpk PRIMARY KEY(id)
);

CREATE TABLE aulas (
    idaula              NUMBER(5),
    edificio            VARCHAR2(20),
    numeroaula          NUMBER,
    numeroasientos  	NUMBER,
    descripcionaula 	VARCHAR2(50),
    constraint auidpk 	PRIMARY KEY(idaula)
);

CREATE  TABLE especialidades (
    especialidad     	VARCHAR2(30),
    totalcreditos    	NUMBER,
    totalestudiantes 	NUMBER
);

CREATE TABLE cursos (
    departamento     	VARCHAR2(3),
    ncurso              NUMBER,
    descripcioncurso 	VARCHAR2(200),
    cupoestudiantes  	NUMBER,
    nestudiantes     	NUMBER,
    ncreditos        	NUMBER,
    idaula         	    NUMBER,
    CONSTRAINT cudecupk PRIMARY KEY (departamento,ncurso),
    CONSTRAINT cuidfk FOREIGN KEY(idaula) REFERENCES aulas(idaula) 
);

CREATE TABLE matriculas (
    idestudiante    	NUMBER(5)   NOT NULL,
    departamento    	VARCHAR2(3) NOT NULL,
    ncurso              NUMBER      NOT NULL,
    grado        	    VARCHAR2(1),
    CONSTRAINT magrch CHECK (UPPER(grado) IN ('A', 'B', 'C', 'D', 'E')),
    CONSTRAINT maidfk FOREIGN KEY(idestudiante) REFERENCES estudiantes(id),
    CONSTRAINT madecufk FOREIGN KEY(departamento, ncurso) REFERENCES cursos(departamento, ncurso)
);

CREATE TABLE cambios (
    tipo        			VARCHAR2(1) NOT NULL,
    razon        			VARCHAR2(8) NOT NULL,
    fecha        			DATE NOT NULL,
    antiguoidestudiante  	NUMBER(5),
    antiguodepartamento     VARCHAR2(3),
    antiguocurso        	NUMBER(3),
    antiguogrado        	VARCHAR2(1),
    nuevoidestudiante    	NUMBER(5),
    nuevodepartamento    	VARCHAR2(3),
    nuevoncurso        		NUMBER(3),
    nuevogrado       		VARCHAR2(1)
);

CREATE TABLE errores (
    codigo      NUMBER,
    mensaje    	VARCHAR2(200),
    informacion	VARCHAR2(100)
);

CREATE TABLE temporal (
    columnanumerica    	NUMBER,
    columnacaracter 	VARCHAR2(60)
);
