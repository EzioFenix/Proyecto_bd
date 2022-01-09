--- Preambulo
DROP TABLE CONTINENTE CASCADE constraints;
DROP TABLE habitad CASCADE constraints;
DROP TABLE encuentra CASCADE constraints;
DROP TABLE tipoEmpleado CASCADE constraints;
DROP TABLE empleado CASCADE constraints;
DROP TABLE itinerario CASCADE constraints;
DROP TABLE asigna CASCADE constraints;
DROP TABLE entradaVisit CASCADE constraints;
DROP TABLE zona CASCADE constraints;
DROP TABLE jaula CASCADE constraints;
DROP TABLE recorre CASCADE constraints;
DROP TABLE asigna CASCADE constraints;
DROP TABLE especie CASCADE constraints;
DROP TABLE vive CASCADE constraints;
DROP TABLE mantiene CASCADE constraints;

---Creación de tablas
create table continente
(
    claveContinente number(1) Primary key,
    nombreCont varchar(20) not null
);

create table habitad
(
    claveHabitad number(3) Primary key,
    nombreHabitad varchar(20) unique not null,
    vegetacion varchar(40) not null,
    clima varchar(20) not null
);

create table encuentra
(
    claveHabitad number(3) not null,
    claveContinente  number(1) not null,
    constraint fk_encuentra_habitad
    foreign key (claveHabitad)
    references habitad(claveHabitad),
    constraint fk_encuentra_continente
    foreign key (claveContinente)
    references continente(claveContinente),
    constraint pk_encuentra
    Primary key(claveContinente,claveHabitad)
);

create table tipoEmpleado
(
    idTipo number(2) Primary key,
    descripTipo varchar(50) not null
);

create table empleado
(
    claveEmpleado number(3) Primary key,
    nombreEmpleado varchar(20) not null,
    apellidoPat varchar(20) not null,
    apellidoMat varchar(20) default null,
    calleEmp varchar(20) not null,
    colEmp varchar(20) not null,
    alcaldiaEmp varchar(20) not null,
    telefono number(15) not null,
    fechaCont date default sysdate not null,
    salario number(10,2) not null,
    salarioTotal number(12,2) null,
    claveEmpDir number(3),
    salarioExt number(10,2) default 0,
    idTipo number(2) not null,
    constraint fk_empleadoDir
    foreign key (claveEmpDir)
    references empleado(claveEmpleado),
    constraint fk_tipoEmpleado
    foreign key (idTipo)
    references tipoEmpleado(idTipo)
);

create table itinerario
(
    clavelti number(5) Primary key,
    longitud  number(7,2) not null,
    numEspecies number(4) not null,
    maxVisitas number(4) not null,
    horaInicio number(4) not null,
    horaFin number(4) not null,
    cobro number(6,2) not null,
    duracionRecorrido number(4) not null,
    cantidadVisitantes number(7) not null
);

create table asigna
(
    clavelti number(5) not null,
    claveEmpleado number(3) not null,
    constraint fk_asigna_clavelti
    foreign key (clavelti)
    references itinerario(clavelti),
    constraint fk_asigna_empleado
    foreign key (claveEmpleado)
    references empleado(claveEmpleado),
    constraint pk_asigna
    Primary key (clavelti,claveEmpleado)
);
create table entradaVisit
(   
    claveEntradaVisi number(3) not null,
    fechaVisi date not null,
    costo number(6,2),
    cantidad number(6,2),
    clavelti number(5),
    constraint fk_entradaVisit
    foreign key (clavelti)
    references itinerario (clavelti),
    constraint pk_fechaVisi
    Primary key (claveEntradaVisi)
);

create table zona
(
    claveZona number(3) not null,
    extension number(3) not null,
    nombreZona varchar(20) not null,
    constraint pk_zona
    Primary key (claveZona)
);

create table jaula
(
    claveZona number(3) not null,
    claveJaula number(3) not null,
    cantidadOcupantes number(4) not null,
    constraint fk_zona_jaula
    foreign key (claveZona)
    references zona(claveZona),
    constraint pk_jaula
    Primary key(claveZona,claveJaula)
);

create table recorre
(
    claveZona number(3) not null,
    clavelti number(5) not null,
    constraint fk_zona_recorre
    foreign key (claveZona)
    references zona(claveZona),
    constraint fk_itenario_clavelti
    foreign key (clavelti)
    references itinerario(clavelti)
);

create table asigna
(
    clavelti number(5) not null,
    claveEmpleado number(3) not null,
    salarioPagado number(8,2) not null,
    horaGuia number(4,2) not null,
    constraint fk_itenario_asigna
    foreign key (clavelti)
    references itinerario(clavelti),
    constraint fk_Empleado_asignada
    foreign key (claveEmpleado)
    references empleado(claveEmpleado)
);

create table especie
(
    claveEspecie number(4) primary key,
    nombreCientifico varchar(20) unique not null,
    nombreComun varchar(20) not null,
    descripcionGeneral varchar(50) not null,
    claveZona number(3) not null,
    constraint fk_zona_especie
    foreign key (claveZona)
    references zona(claveZona)
);

create table vive
(
    claveEspecie number(4) not null,
    claveHabitad number(3) not null,
    constraint fk_habitad_vive
    foreign key (claveHabitad)
    references habitad(claveHabitad),
    constraint fk_especie_vive
    foreign key (claveEspecie)
    references especie(claveEspecie),
    constraint pk_vive
    Primary key (claveEspecie,claveHabitad)
);

create table mantiene
(
    claveEspecie number(4) not null,
    claveEmpleado number(3) not null,
    fechaCui date not null,
    constraint fk_especie_mantiene
    foreign key (claveEspecie)
    references especie (claveEspecie),
    constraint fk_empleado_mantiene
    foreign key (claveEmpleado)
    references empleado (claveEmpleado),
    constraint pk_mantiene
    Primary key (claveEspecie,claveEmpleado)
);

--vistas-----------------------------------------------------



--- Insercción de datos
Insert into contienente values (1,'America');
Insert into contienente values (1,'America');
Insert into contienente values (1,'America');
Insert into contienente values (1,'America');
Insert into contienente values (1,'America');

insert into CONTIENTE values (1,'manglar','Bosque de coniferas');

insert into encuentra values (1,1);

insert into tipoEmpleado(1,'jefe Planta');

insert into empleado (1,'Victor','Barrera','Peña','Nardo','Naucalpan',5553082798,'07/03/1999',70000,null,2000,1)

insert into itinerario values (1,1000.50,50,100,1330,1359,50.5,(calculados),1000);

insert into asigna values (1,1);





