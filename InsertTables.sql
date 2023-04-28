INSERT INTO [ROLE] VALUES ('Student');
INSERT INTO [ROLE] VALUES ('Panel Member');
INSERT INTO [ROLE] VALUES ('FYP Committee');
INSERT INTO [ROLE] VALUES ('Supervisor');

INSERT INTO [USER] VALUES ('ahmed123','ahmed123','Ahmed','Abdullah','Faculty','FYP Committee');
INSERT INTO [USER] VALUES ('sufyankh','password','Sufyan','Khan','Faculty','FYP Committee');
INSERT INTO [USER] VALUES ('hamza565', 'Helloworld', 'Hamza', 'Yousaf', 'Student', 'Student');
INSERT INTO [USER] VALUES ('haris777', '1234', 'Haris', 'Sohail', 'Faculty', 'Panel Member');
INSERT INTO [USER] VALUES ('fato555', 'rahima', 'Fatima', 'Raheem', 'Faculty', 'Supervisor');

INSERT INTO PANEL VALUES(1);
INSERT INTO PANEL VALUES(2);
INSERT INTO PANEL VALUES(3);
INSERT INTO PANEL VALUES(4);

INSERT INTO [PANEL MEMBER] VALUES (4, 'haris777'); 
INSERT INTO [PROJECT GROUP] VALUES ('Bus tracking app', 'hamza565');

INSERT INTO [PROJECT] VALUES('Facial Recognition', 'fato555', 'fato555', 1, 1);
INSERT INTO [PROJECT] VALUES('Ecommerce Website', 'Gaha68', 'fato555', 1, 1);

select * from [USER] WHERE [ROLE] = 'Supervisor';
select * from [USER] WHERE [ROLE] = 'FYP Committee';
select * from [USER] WHERE [ROLE] = 'Panel Member';
select * from [USER] WHERE [ROLE] = 'Student';

SELECT * FROM [PROJECT GROUP];

SELECT * FROM [EVALUATION];

SELECT * FROM [AUDIT TRAIL] ORDER BY [Date] desc;

SELECT [Title] FROM PROJECT WHERE [Supervisor] = 'Gaha68' OR [Co-Supervisor] = 'farash';

SELECT * FROM [PANEL MEMBER] INNER JOIN [PROJECT] ON [PANEL MEMBER].Panel = PROJECT.[Eval Panel] WHERE [Member] = 'Haadsa' AND [Title] NOT IN (SELECT [Project] FROM [EVALUATION] WHERE [Panel Member] = 'Haadsa');

SELECT * FROM [NOTIFICATION];