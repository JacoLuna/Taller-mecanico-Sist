delimiter //

drop database if exists taller;
create database taller;
use taller;

create table cliente( 
codCli int auto_increment,
nombre varchar(40),
apellido varchar(40),
telefono varchar(15),
mail varchar(25),
direccion varchar(50), 
dni int,
activo boolean,
constraint pk_cliente primary key (codCli)
);

insert into cliente values  /* a algunos 	 no les corresponde ningun auto todavía así que algunos no funcionan*/
(100,null,null,null,null,null,null,null),
("","Luis","Miguel","65849964","luismi32@gmail.com","Llavallol 2467",2485946,true),
("","Jaco","Luna","76858795","jacoluna@gmail.com","Gavilan 2300",2577445,true),
("","Selena","Gomez","12673749","seletruenamgomez@yahoo.com.ar","Calle 123",2346537,true),
("","Valentina","De Piero","76957193","valedepiero10@gmail.com","Calle 125",4485248, true),
("","José","Rodriguez","13590474","rodriguezJ@gmail.com","Av. Rivadavia 3400",4464264,false),
("","Muca","Led","46783256","elmuca15@gmail.com","Provincia 200",40756854,true);


create table seguros(
codseg int auto_increment,
nombre_seguro varchar(40),
localidad varchar(50),
activo boolean,
constraint pk_seguros primary key (codSeg)
);

insert into seguros values
(1500,null,null,null),
('',"La caja","Berazategui",true),
('',"La nueva","Floresta",true),
('',"La palanca","Palermos",false);

create table Vehiculo(
codVehi int auto_increment,
patente varchar(10),
marca varchar(20),
modelo varchar(20),
anio int,
activo boolean,
constraint pk_Vehiculo primary key (codVehi)
);

insert into vehiculo values
(2000,"HZI 988", "Audi", "A8", 2018, true),
('',"EFG 123", "BMW", "X2", 2019, true),
('',"JKD 040", "Chevrolet", "Spark", 3, true),
('',"ASS 420", "Ferrari", "F12", 2000, true),
('',"LOL 040", "Lamborghini", "Aventador", 1, true),
('',"ASS 420", "Ferrari", "fiummm", 2000, true);


create table Ingresos(
codIngr int auto_increment,
codCli int,
codSeg int,
codvehi int,
fecha_ingreso_vehiculo date,
constraint pk_codIngr primary key (codIngr),
constraint fk_Ingresos_Cliente foreign key(codCli) references cliente(codCli),
constraint fk_Ingresos_Seguro foreign key(codSeg) references Seguros(codSeg),
constraint fk_Ingresos_Vehiculo foreign key(codVehi) references Vehiculo(codVehi)
);

insert into Ingresos values 
(3000, 102, 1500, 2002, '2018-01-23'),
(3001, 104, 1500, 2001, '2019-11-11'),
(3002, 103, 1500, 2004, '2018-05-21'),
(3003, 101, 1500, 2000, '2018-06-17'),
(3004, 100, 1501, 2000, '2019-10-04'),
(3005, 106, 1500, 2005, '2018-06-17'),
(3006, 100, 1502, 2003, '2019-11-13');

create table Mecanico(
codMec int auto_increment,
nombre varchar(40),
apellido varchar(40),
dni int,
telefono varchar(15),
fecha_ingreso date,
activo boolean,
constraint pk_Mecanico primary key (codMec)
);

insert into mecanico values
(4000,"juan","faura",206187819,45861118,"2019/11/1",true),
('',"alejo","mucaled",206187818,45861114,"2019/10/1",true),
('',"valentin","bertolini",206187817,45861115,"2019/09/1",true),
('',"joaco","luna",206187816,45861116,"2019/08/1",true),
('',"tomas","pierini",206187815,45861117,"2019/07/1",true);

create table MecDiagnostico(
codMecDiag int auto_increment,
codMec int,
constraint pk_MecDiagnostico primary key (codMecDiag),
constraint fk_MecDiagnostico_Mecanico foreign key(codMec) references Mecanico(codMec)
);
insert into MecDiagnostico values
(15000,4001),
('',4002),
('',4004);

create table Presupuesto(
codPre int auto_increment,
codMecDiag int,
codIngr int,
descripcion varchar(150),
estado varchar(40),
vencimiento date,
tiempoReparacion int,
monto int,
fecha date,
seguro boolean,
constraint pk_Presupuesto primary key (codPre),
constraint fk_Presupuesto_MecDiag foreign key(codMecDiag) references MecDiagnostico(codMecDiag),
constraint fk_Presupuesto_Ingresos foreign key(codIngr) references Ingresos(codIngr)
);

INSERT INTO `presupuesto` VALUES
(20000, 15000, 3003, '', 'aprobado', '2019-11-29', 2, 1800, '2019-11-14', 0),
(20001, 15001, 3001, '', 'en espera', '2019-11-21', 4, 3567, '2019-11-14', 0),
(20002, 15002, 3005, '', 'en espera', '2019-11-21', 3, 3469, '2019-11-14', 0),
(20003, 15000, 3004, '', 'en espera', '2019-11-28', 2, 1800, '2019-11-14', 1),
(20004, 15002, 3006, '', 'aprobado', '2019-12-03', 8, 7914, '2019-11-14', 1),
(20005, 15002, 3000, '´´´´´´', 'en espera', '2019-12-18', NULL, NULL, '2019-11-28', 0),
(20006, 15001, 3002, '', 'aprobado', '2019-12-18', 7, 13458, '2019-11-28', 0);

create table Arreglo(
codArr int auto_increment,
nombre varchar(50),
descripcion varchar(150),
precio int,
tiempoEst int,
constraint pk_Arreglo primary key (codArr)
);

insert into Arreglo values
(16000, 'Cambio bomba de agua', 'Se reemplaza la vieja bomba de agua por una nueva', 1500, 2),
(16001, 'Cambio bomba de aceite', 'Se reemplaza la vieja bomba de aceite por una nueva', 1500, 2),
(16002, 'Cambio de aceite', 'Se saca el aceite viejo y se pone uno nuevo', 789, 1),
(16003, 'Cambio de bujias', 'Se cambian las bujias defectuosas', 3400, 3),
(16005, 'cambio de correa', 'reemplazo de la correa de distribucion', 2000, 5),
(16006, 'cambio de bujias x4', 'cambio de las 4 bujias', 4000, 2),
(16007, 'cambio de caño de escape', 'se reemplaza el caño de escape por uno nuevo', 2500, 1),
(16008, 'cambio de discos de frenos', 'se reemplazan los discos viejos por unos nuevos', 45000, 7);


create table Herramienta( 
codHer int auto_increment,
Nombre varchar(40),
constraint pk_Herramienta primary key (codHer)
);

insert into herramienta values
(900, 'martillo de goma'),
(901, 'destornillador estrella'),
(902, 'destornillador plano'),
(903, 'llave inglesa'),
(904, 'llave cruz'),
(906, 'pluma'),
(907, 'llave del 13'),
(908, 'llave del 11'),
(909, 'llave del 12'),
(910, 'llave del 15'),
(911, 'llave del 16'),
(912, 'pinza'),
(913, 'alicate'),
(914, 'sierra');

create table MecReparacion(
codMecRep int auto_increment,
codMec int,
constraint pk_MecReparacion primary key (codMecRep),
constraint fk_MecReparacion_Mecanico foreign key(codMec) references Mecanico(codMec)
);

insert into MecReparacion values
(5000,4000),
('',4001),
('',4002),
('',4003),
('',4004);

create table Equipo(
codMecRep int,
codHer int,
estado varchar(20), /*bien/gastado/muy gastado/roto*/
ejemplar int,
constraint pk_Equipo primary key (codMecRep, codHer),
constraint fk_Equipo_MecRep foreign key(codMecRep) references MecReparacion(codMecRep),
constraint fk_Equipo_Herramienta foreign key(codHer) references Herramienta(codHer)
);

insert into equipo values 
(5000, 900, 'bien', 1),
(5000, 901, 'gastado', 1),
(5000, 902, 'roto', 2),
(5000, 903, 'roto', 2),
(5000, 904, 'roto', 2),
(5001, 900, 'bien', 2),
(5001, 901, 'bien', 2),
(5001, 902, 'gastado', 1),
(5001, 903, 'bien', 1),
(5001, 904, 'bien', 1),
(5002, 901, 'bien', 3),
(5002, 904, 'bien', 3),
(5002, 910, 'bien', 1),
(5003, 901, 'bien', 4),
(5004, 901, 'bien', 5),
(5004, 906, 'bien', 1),
(5004, 907, 'bien', 1),
(5004, 909, 'bien', 1),
(5004, 912, 'bien', 1),
(5004, 914, 'bien', 1);

create table soliCompraH(
codSoliComH int auto_increment,
codMecRep int,
estado varchar(20),
fecha date,
constraint pk_OrdenCompraH primary key (codSoliComH),
constraint fk_OrdenCompraH_MecRep foreign key(codMecRep) references MecReparacion(codMecRep)
);

insert into solicomprah values
(10000, 5000, 'no aprobado', '2019-11-14'),
(10001, 5001, 'no aprobado', '2019-11-14'),
(10003, 5002, 'no aprobado', '2019-11-28'),
(10004, 5003, 'no aprobado', '2019-11-28'),
(10005, 5004, 'no aprobado', '2019-11-28'),
(10006, 5004, 'no aprobado', '2019-11-28');

create table detalleSoliCompraH(
codSoliComH int,
codHer int,
constraint pk_detalleSoliCompraH primary key (codSoliComH, codHer),
constraint fk_detalleSoliCompraH_soliCompraH foreign key(codSoliComH) references soliCompraH(codSoliComH),
constraint fk_detalleSoliCompraH_Herramienta foreign key(codHer) references Herramienta(codHer)
);

insert into detalleSoliCompraH values
(10000, 902),
(10001, 903),
(10003, 901),
(10003, 906),
(10003, 909),
(10003, 910),
(10003, 912),
(10004, 900),
(10004, 904),
(10004, 908),
(10004, 910),
(10004, 912),
(10005, 903),
(10005, 909),
(10005, 911),
(10006, 902);

create table Repuestos(
codRep int auto_increment,
nombre varchar(40),
precio int,
constraint pk_Repuestos primary key (codRep)
);

insert into Repuestos values
(7000, 'Bomba de agua', 300),
(7001, 'Bomba de aceite', 267),
(7002, 'Aceite 1lt', 89),
(7005, 'bujia', 120),
(7006, 'correa de distribucion', 300),
(7007, 'caño de escape', 621),
(7008, 'disco de freno', 2000);

create table ArrRep(
CodArr int,
CodRep int,
cantRep int,
constraint pk_ArrRep primary key (CodArr, codRep),
constraint fk_ArrRep_Arreglo foreign key(codArr) references Arreglo(codArr),
constraint fk_ArrRep_Repuesto foreign key(codRep) references Repuestos(codRep)
);

insert into ArrRep values
(16000, 7000, 1),
(16001, 7001, 1),
(16002, 7002, 1),
(16005, 7006, 1),
(16006, 7005, 4),
(16007, 7007, 1),
(16008, 7008, 4);

create table ordenCompraR(
codOrComR int auto_increment,
codpre int,
codMecRep int,
fecha date,
constraint pk_OrdenCompraR primary key (codOrComR),
constraint fk_OrdenCompraR_presupuesto foreign key(codpre) references presupuesto(codpre),
constraint fk_OrdenCompraR_MecRep foreign key(codMecRep) references MecReparacion(codMecRep)
);

insert into ordencomprar values
(120000, 20000, 5000, '2019-11-30'),
(120001, 20001, 5001, '2019-11-29'),
(120003, 20004, 5002, '2019-11-28'),
(120004, 20006, 5003, '2019-11-28');

create table detalleOrCompraR(
codOrComR int,
codRep int,
cant int,
constraint pk_detalleOrCompraR primary key (codOrComR, codRep),
constraint fk_detalleOrCompraR_OrdenCopra foreign key(codOrComR) references OrdenCompraR(codOrComR),
constraint fk_detalleOrCompraR_Repuesto foreign key(codRep) references Repuestos(codRep)
);

insert into detalleOrCompraR values
(120000, 7000, 1),
(120001, 7001, 1);

create table detallePre(
codPre int,
codArr int,
constraint pk_detallePre primary key (codPre,codArr),
constraint fk_detallePre_Presupuesto foreign key(codPre) references Presupuesto(codPre),
constraint fk_detallePre_Arreglo foreign key(codArr) references Arreglo(codArr)
);

INSERT INTO detallepre VALUES
(20000, 16000),
(20001, 16000),
(20001, 16001),
(20002, 16003),
(20003, 16000),
(20004, 16000),
(20004, 16001),
(20004, 16002),
(20004, 16003),
(20005, 16000),
(20005, 16008),
(20006, 16000),
(20006, 16003),
(20006, 16006);

create table recibo(
codRecibo int auto_increment,
codPre int,
montoAdelanto int,
fecha date,
constraint pk_recibo primary key (codRecibo),
constraint fk_recibo_Pre foreign key(codPre) references Presupuesto(codPre)
);

insert into recibo values
(121000, 20001, 150, '2019-11-15'),
(121001, 20003, 100, '2019-11-15'),
(121003, 20000, 200, '2019-11-28'),
(121004, 20006, 12000, '2019-11-28'),
(121005, 20004, 200, '2019-11-28');

create table recargo(
codRecargo int auto_increment,
cant_dias varchar(20),
porcentaje int,
constraint pk_recargo primary key (codRecargo)
);

insert into recargo values
(1, NULL, NULL),
(2, '1', 5),
(3, '2', 5),
(4, '3', 7),
(5, '4', 7),
(6, '5', 10),
(7, '6', 10),
(8, '7', 15),
(9, '8', 23),
(10, '9', 30),
(11, '10', 41),
(13, '15', 23),
(14, '16', 21),
(15, '17', 22),
(16, '18', 26),
(17, '19', 29),
(18, '20', 41);

create table Factura(
codFactura int auto_increment,
codIngr int,
codRecargo int,
codRecibo int,
montoTotal int,
montoTotalRec int,
fecha date,
constraint pk_factura primary key (codFactura),
constraint fk_factura_Ingresos foreign key(codIngr) references Ingresos(codIngr),
constraint fk_factura_recargo foreign key(codRecargo) references recargo(codRecargo),
constraint fk_factura_recibo foreign key(codRecibo) references recibo(codRecibo)
);

insert into factura values
(36000, 3000, 2, 121000, 3500, 2100, '2019-11-24'),
(36001, 3001, 1, 121001, 3500, 2100, '2019-11-23'),
(36003, 3004, 2, 121001, 1800, 1890, '2019-11-28'),
(36004, 3002, 14, 121004, 13458, 13836, '2019-11-28'),
(36005, 3006, 18, 121005, 7914, 8652, '2019-11-28');

create table turno( 
codTur int auto_increment,
codpre Int,
fecha date,
hora varchar(5),
estado varchar(20), /*"cancelado"/"confirmado"/"vencido"*/
constraint pk_turno primary key (codTur),
constraint fk_turno_presupuesto foreign key(codpre) references presupuesto(codpre)
);

insert into turno values
(9000, 20000, '2019-11-24', '10:00', 'confirmado'),
(9001, 20002, '2019-11-24', '10:30', 'confirmado'),
(9002, 20001, '2019-11-26', '10:30', 'confirmado'),
(9003, 20003, '2019-12-06', '10:00', 'confirmado'),
(9004, 20004, '2019-12-05', '11:00', 'confirmado'),
(9005, 20006, '2019-12-19', '09:00', 'confirmado');

create table ReIngreso(
codReIngr int auto_increment,
codTur int,
constraint pk_ReIngreso primary key (codReIngr),
constraint fk_ReIngreso_turno foreign key(codTur) references turno(codTur)
);

insert into reingreso values
(19000, 9000),
(19001, 9001),
(19002, 9002),
(19003, 9003),
(19004, 9004),
(19005, 9005);

create table OrdenTrabajo(
codOrTrab Int auto_increment,
codreingr int,
descripcion varchar(150),
fecha date,
terminado boolean,
constraint pk_OrdenTrabajo primary key (codOrTrab),
constraint fk_OrdenTrabajo_Reingreso foreign key(codreingr) references Reingreso(codreingr)
);

INSERT INTO ordentrabajo VALUES
(69000, 19000, '', '2019-11-14', 0),
(69001, 19001, '', '2019-11-14', 0),
(69002, 19002, '', '2019-11-14', 0),
(69003, 19003, '', '2019-11-14', 0),
(69004, 19004, '', '2019-11-14', 0),
(69005, 19005, '', '2019-11-28', 0);

create table orTrabArr(
codOrTrab int,
codArr int,
hecho boolean, /*hecho o no hecho*/
constraint pk_orTrabArr primary key (codArr, codOrTrab),
constraint fk_orTrabArr_OrTrab foreign key(codOrTrab) references OrdenTrabajo(codOrTrab),
constraint fk_orTrabArr_Arreglo foreign key(codArr) references Arreglo(codArr)
);

INSERT INTO ortrabarr VALUES
(69000, 16000, 0),
(69005, 16000, 0),
(69005, 16003, 0),
(69005, 16006, 0);

create table NotaDeRetiro(
codNotDeRetiro int auto_increment,
codortrab int,
fecha date,
retirado boolean,
constraint pk_NotaDeRetiro primary key (codNotDeRetiro),
constraint fk_NotaDeRetiro_ordentrabajo foreign key(codortrab) references ordentrabajo(codortrab)
);


create table CajaDiaria(
codCajaDiaria int,
montoTotal int,
valorRep int,
valorFactura int, 
fecha date,
constraint pk_CajaDiaria primary key (codCajaDiaria)
);
		
create table Usuario(
codUsuario int,
nombre varchar(25), 
contrasenia varchar(25),
perfil varchar(20),
constraint pk_Usuario primary key (codUsuario)
);

insert into Usuario values
(1,"1","1","Administrador"),
(2,"RecepcionJ19","recepcion15","Recepcionista"),
(3,"MecanicoJ19","mecanico15","Mecanico"),
(4,"RetiroJ19","retiro15","Retiro");
//
delimiter ;



select r.nombre, r.precio, a.cantrep,(precio*cantrep)'total' 
from repuestos as r, arrrep as a, detalleorcomprar as d, ordencomprar as oc 
where a.codrep=r.codrep 
and r.codrep=d.codrep 
and d.codorcomr=oc.codorcomr 
and codpre=20007;





