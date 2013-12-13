-- The following database contains information about scientists, years when they received the Noble Prize and field of
-- their work


-- create database

create database 'MyDatabase';

-- three tables within this database

create table Scientists
( id int primary key, name char(100), year_of_birth int, country char(100)); 

create table Science
( id int primary key, name char(100), category char(100));

create table Prizes
( id int primary key, scientists_id int, science_id int, year_of_prize int, foreign key (scientists_id) references
Scientists(id), foreign key (science_id) references Science(id));

-- fill these tables

insert into Science values (1, "physics", "exact"), (2, "chemistry", "exact"), (3, "physiology", "exact"), (4, "literature",
"humanities"), (5, "peace", "humanities");

insert into Scientists values (1, "Joseph Thomson", 1856, "United Kingdom"), (2, "Max Planck", 1858, "Germany"),
(3, "Albert Einstein", 1879, "Germany"), (4, "Niels Bohr", 1885, "Denmark"), (5, "Erwin Schrodinger", 1887, "Austria"), 
(6, "Peter Higgs", 1929, "United Kingdom"), (7, "Marie Curie", 1867, "France"), (8, "Hans Fischer", 1881, "Germany"),
(9, "Linus Pauling", 1901, "United States"), (10, "Odd Hassel", 1897, "Norway"), (11, "Brian Kobilka", 1955, "United States"),
(12, "Ivan Pavlov", 1849, "Russia"), (13, "Alexander Fleming", 1881, "United Kingdom"), (14, "Konrad Bloch", 1912, 
"United States"), (15, "Stanley Coehen", 1922, "United States"), (16, "Shinya Yamanaka", 1962, "Japan"), (17,
"Rabindranath Tagore", 1861, "India"), (18, "Knut Hamsun", 1859, "Norway"), (19, "Gabriela Mistral", 1889, "Chile"),
(20, "Boris Pasternak", 1890, "Soviet Union"), (21, "Orhan Pamuk", 1952, "Turkey"), (22, "Mario Llosa", 1936, "Peru"),
(23, "Alice Munro", 1931, "Canada"), (24, "Theodore Roosevelt", 1909, "United States"), (25, "Nathan Soderblom", 1866,
"Sweden"), (26, "Martin Luther King", 1929, "United States"), (27, "Andrei Sakharov", 1921, "Soviet Union"), (28, 
"Mother Teresa", 1910, "India"), (29, "Nelson Mandela", 1918, "South Africa"), (30, "Yasser Arafat", 1929, "Palestine");
 

 insert into Prizes values (1, 1, 1, 1906), (2, 2, 1, 1918), (3, 3, 1, 1921), (4, 4, 1, 1922), (5, 5, 1, 1933), (6, 6, 1,
2013), (7, 7, 1, 1903), (8, 7, 2, 1911), (9, 8, 2, 1902), (10, 9, 2, 1954), (11, 10, 2, 1969), (12, 11, 2, 2012),
(13, 12, 3, 1904), (14, 13, 3, 1945), (15, 14, 3, 1964), (16, 15, 3, 1986), (17, 16, 3, 2012), (18, 17, 4, 1913),
(19, 18, 4, 1920), (20, 19, 4, 1945), (21, 20, 4, 1958), (22, 21, 4, 2006), (23, 22, 4, 2010), (24, 23, 4, 2013),
(25, 24, 5, 1906), (26, 25, 5, 1930), (27, 26, 5, 1964), (28, 27, 5, 1975), (29, 28, 5, 1979), (30, 29, 5, 1993),
(31, 30, 5, 1994);

-- Simple statements. Select from one table
-- Select all the columns from the "Science" table
select * from Science;

-- Select column "name" from the "Science" table
select name from Science;

-- Select exact sciences
select name from Science where category = 'exact';

-- Simple statements. Select from a few tables

-- Select scientists and the year of their prizes

select name, year_of_prize from Scientists
join Prizes on Scientists.id = Prizes.scientists_id;

select name, year_of_prize from Scientists, Prizes where Scientists.id = Prizes.scientists_id;

-- Select scientists who received prizes after 1920
select name from Scientists
join Prizes on Scientists.id = Prizes.scientists_id
where year_of_prize > 1920;

-- Select scientists who received prizes on exact sciences after 1920
select Scientists.name from Scientists
join Prizes on Scientists.id = Prizes.scientists_id
join Science on Science.id = Prizes.science_id
where year_of_prize > 1920 
and category = 'exact';

-- Select scientists who received more than 1 prize
select Scientists.name from Scientists
join Prizes on Prizes.scientists_id = Scientists.id
group by Prizes.scientists_id
having count(*) > 1;

-- Simple statements. Count rows for a table
-- Count all sciences
select count(*) from Science;

-- Count exact sciences
select count(category) from Science where category = 'exact';

-- Count the amount of scientists who got their prizes before 1950
select count(Scientists.name) from Scientists
join Prizes on Scientists.id = Prizes.scientists_id
where year_of_prize < 1950;
