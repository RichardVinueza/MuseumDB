--INSERTS--
insert into users values
	(1, true, 'richard@gmail.com','Richard Vinueza','Spanish', 'qwerty'),
	(2, true, 'luat@gmail.com','Luat Dinh Bui','Spanish','qwerty');
	
insert into users (full_name, email, nationality, password, admin) values
	('Richard Vinueza', 'richard@gmail.com','Spanish', 'qwerty',true),
	('Luat Dinh Bui','luat@gmail.com','Spanish','qwerty', true);

insert into beacons values
	(1, true , 17);
	
insert into expositions (name, artworks_number, time_frame ) values
	('Pintura española hasta 1800',2, '2020-01-15 10:49:29.10000'),
	('Pintura italiana y francesa hasta 1800', 2, '2020-01-15 10:49:29.10000'),
	('Pintura del siglo XIX', 2, '2020-01-15 10:49:29.10000');


insert into user_interactions values
	(1,1,'2019-12-2 3:39:29.10000')
	
insert into artworks (name, author_full_name, author_nationality, category, creation_date, creation_period, expositionsid_exposition, image) values 
	('El Pecado Original', 'unkown', 'unkown', 'Pintura Mural', 1800, 'Pintura al fresco', 19 , 'assets/images/image1.png'),
	('Caceria de liebres', 'unkown', 'unkown', 'Pintura Mural', 1800, 'Pintura al fresco', 19, 'assets/images/image2.png'),
	('La anunciacion', 'Fra', 'Italia', 'Clerica', 1426, 'Catolico', 20, 'assets/images/image3.png'),
	('El Trasito de la Virgen', 'Andrea', 'Italia', 'Clerica', 1462, 'Catolico', 20, 'assets/images/image4.png'),
	('La muerte de Viriato', 'Jose de Madrazo', 'España', 'Contemporanea', 1807, 'Neoclasicismo Español', 21, 'assets/images/image5.png'),
	('El pintor francisco de Goya', 'Vicente', 'España', 'Retratos', 1826, 'Exilio', 21, 'assets/images/image6.png');

insert into resources (type, link, expositionsid_exposition, artworksid_artwork) values
	('text' , 'D:\CLASE\PROYECTOS\FULLSTACKRichard\DocImagesFullStack\elgrito', 17, 8)

--ALTER--
alter table expositions rename productions_number to artworks_number;
select * from users;

--DELETE--
delete from users;

delete from expositions;

delete from artworks;

delete from resources;

delete from beacons;

delete from user_interactions;

delete from users
where id_user = 7;

delete from expositions
where id_exposition=18;

--DROP--
drop schema public cascade;
