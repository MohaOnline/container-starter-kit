
CREATE TABLE hobbies(
	hobby_id serial PRIMARY KEY,
	hobby VARCHAR (255) NOT NULL
);

select * from hobbies;

insert into hobbies(hobby) values('swimming');
insert into hobbies(hobby) values('diving');
insert into hobbies(hobby) values('jogging');
insert into hobbies(hobby) values('dancing');
insert into hobbies(hobby) values('cooking');