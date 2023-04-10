CREATE DATABASE IF NOT EXISTS tubes_kel7_final;
USE tubes_kel7_final;

# ========================================================
# TABEL UNIVERSITY
CREATE TABLE IF NOT EXISTS university(
	university_id VARCHAR(5) NOT NULL PRIMARY KEY,
	university_name VARCHAR(255)
);
DESCRIBE university;

# ========================================================
# TABEL JENIS
CREATE TABLE IF NOT EXISTS jenis(
	type_id VARCHAR(5) NOT NULL PRIMARY KEY,
	type_name VARCHAR(255)
);
DESCRIBE jenis;

# ========================================================
# TABEL KESULITAN
CREATE TABLE IF NOT EXISTS kesulitan(
	difficulty_id VARCHAR(5) NOT NULL PRIMARY KEY,
	difficulty_name VARCHAR(255)
);
DESCRIBE kesulitan;

# ========================================================
# TABEL COURSE
CREATE TABLE IF NOT EXISTS course(
	course_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	course_name  VARCHAR(255),
    university_id VARCHAR(5),
    type_id VARCHAR(5),
    difficulty_id VARCHAR(5),
    votes INT,
    students INT,
    review FLOAT,
    FOREIGN KEY (university_id) REFERENCES university (university_id),
    FOREIGN KEY (type_id) REFERENCES jenis (type_id),
    FOREIGN KEY (difficulty_id) REFERENCES kesulitan (difficulty_id)
);
DESCRIBE course;

# ========================================================
# DML ke table university
INSERT INTO university (university_id, university_name)
VALUES ("U1", "University of Michigan"), ( "U2", "Google"), ( "U3", "IBM"), 
	( "U4", "University of Pennsylvania"), ( "U5", "Moscow Institute of Physics and Technology"), ( "U6", "University of California, Irvine"),
	( "U7", "Rice University"), ( "U8", "University of California San Diego"), ( "U9", "University of Colorado Boulder"),
    ( "U10", "Codio"), ( "U11", "The Hong Kong University of Science and Technology"), ( "U12", "DeepLearning.AI"),
    ( "U13", "Coursera Project Network"), ( "U14", "Infosec"), ( "U15", "HSE University"),
    ( "U16", "Wesleyan University"), ( "U17", "Universidad Austral"), ( "U18", "EDHEC Business School"), ( "U19", "Universidad de los Andes"), 
    ( "U20", "University of Toronto"), ( "U21", "Google Cloud"), ( "U22", "Amazon Web Services"), 
    ( "U23", "University of London"), ( "U24", "University of Alberta"), ( "U25", "LearnQuest"),
	( "U26", "National Taiwan University"), ( "U27", "Johns Hopkins University"), ( "U28", "Nanjing University"),
    ( "U29", "The University of Chicago"), ( "U30", "University of Illinois at Urbana-Champaign")
;
SELECT * FROM university;

# ========================================================
# DML ke tabel jenis
INSERT INTO jenis ( type_id, type_name)
VALUES ( "T1", "SPECIALIZATION"), 
	( "T2", "PROFESSIONAL CERTIFICATE"), 
    ( "T3", "COURSE"), 
    ( "T4", "GUIDED PROJECT"),
    ( "T5", "DEGREE"),
    ( "T6", "MASTER TRACK CERTIFICATE")
;
SELECT * FROM jenis;

# ========================================================
# DML ke tabel kesulitan
INSERT INTO kesulitan ( difficulty_id, difficulty_name)
VALUES ( "D1", "Beginner"), 
	( "D2", "Intermediate"), 
    ( "D3", "Advanced"), 
    ( "D4", "Mixed")
;
SELECT * FROM kesulitan;

# ========================================================
# DML ke tabel course
INSERT INTO course (course_name, university_id, type_id, difficulty_id, votes, students, review)
VALUES ("Python for Everybody","U1","T1","D1",225236,2400000,4.8),
	("Google IT Automation with Python","U2","T2","D1",21768,410000,4.7),
	("Python 3 Programming","U1","T1","D1",15904,290000,4.7),
	("Applied Data Science with Python","U1","T1","D2",29358,730000,4.5),
	("Crash Course on Python","U2","T3","D1",17595,350000,4.8),
	("IBM Data Science","U3","T2","D1",74747,830000,4.6),
	("Programming for Everybody (Getting Started with Python)","U1","T3","D4",189604,2200000,4.8),
	("Data Science Fundamentals with Python and SQL","U3","T1","D1",37454,450000,4.6),
	("IBM Data Analyst","U4","T2","D1",36275,510000,4.6),
	("Python for Data Science, AI & Development","U5","T3","D1",21662,300000,4.6),
	("Introduction to Programming with Python and Java","U4","T1","D1",179,11000,4),
	("Statistics with Python","U1","T1","D1",2359,92000,4.6),
	("IELTS Preparation","U6","T1","D1",50,4000,4.5),
	("Introduction to Scripting in Python","U7","T1","D1",3460,100000,4.7),
	("Data Structures and Algorithms","U8","T1","D2",13335,490000,4.6),
	("Data Structures and Algorithms","U9","T1","D3",8,1600,4.4),
	("Programming in Python: A Hands-on Introduction","U10","T1","D1",23,1600,4.7),
	("Python Basics","U1","T3","D1",12882,250000,4.8),
	("Python and Statistics for Financial Analysis","U11","T3","D2",2522,93000,4.4),
	("Deep Learning","U12","T1","D2",123216,1100000,4.8),
	("Introduction to Python","U13","T4","D1",1634,26000,4.5),
	("Python for Cybersecurity","U14","T1","D2",16,5000,4.6),
	("Django for Everybody","U1","T1","D2",1367,55000,4.7),
	("COVID19 Data Analysis Using Python","U13","T4","D2",1791,26000,4.6),
	("IBM Full Stack Cloud Developer","U5","T2","D1",22680,340000,4.6),
	("Python Programming: A Concise Introduction","U16","T3","D1",4265,160000,4.7),
	("Aprende a programar con Python","U17","T1","D1",1714,43000,4.5),
	("Advanced Data Science with IBM","U5","T1","D3",2705,110000,4.3),
	("Introduction to Python Programming","U4","T3","D1",129,8100,3.9),
	("Fundamentals of Computing","U7","T1","D1",3660,240000,4.8),
	("Investment Management with Python and Machine Learning","U18","T1","D1",1227,42000,4.6),
	("Create Your First Web App with Python and Flask","U13","T4","D2",377,12000,4.5),
	("Exploratory Data Analysis With Python and Pandas","U13","T4","D1",217,5800,4.6),
	("Introduction to Data Science in Python","U1","T3","D2",24033,600000,4.5),
	("Python Classes and Inheritance","U1","T3","D2",2954,64000,4.7),
	("Introdução à Ciência da Computação com Python Parte 1","U1","T3","D1",5293,160000,4.9),
	("Python Data Structures","U1","T3","D4",84054,750000,4.9),
	("PostgreSQL for Everybody","U1","T1","D2",139,5000,4.8),
	("Programación en Python","U19","T3","D1",9,3200,4.9),
	("Learn to Program: The Fundamentals","U20","T3","D1",4982,240000,4.7),
	("Advanced Machine Learning on Google Cloud","U21","T1","D3",2060,62000,4.5),
	("Databases and SQL for Data Science with Python","U3","T3","D1",13319,190000,4.7),
	("Data Analysis and Visualization Foundations","U4","T1","D1",3203,84000,4.7),
	("IBM AI Engineering","U5","T2","D2",12323,230000,4.6),
	("Data Analysis Using Python","U4","T3","D1",46,2100,4.5),
	("Python Project for Data Science","U3","T3","D2",635,18000,4.3),
	("Using Python to Access Web Data","U1","T3","D4",40437,500000,4.8),
	("Data Analysis with Python","U3","T3","D1",13424,190000,4.7),
	("Using Python to Interact with the Operating System","U2","T3","D1",3648,96000,4.7),
	("Building Modern Python Applications on AWS","U22","T3","D2",480,66000,4.5),
	("Foundations of Data Science: K-Means Clustering in Python","U23","T3","D1",310,17000,4.7)
;
SELECT * FROM course;

