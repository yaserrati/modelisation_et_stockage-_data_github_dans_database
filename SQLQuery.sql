	
	
	--creation de table language
	CREATE TABLE [language] (
      [language_id] INT IDENTITY(1,1) PRIMARY KEY,
      [language_name] VARCHAR(255)
    );

	--creation de table licence
	CREATE TABLE [licence] (
      [licence_id] INT IDENTITY(1,1) PRIMARY KEY,
      [licence_key] varchar(35),
      [licence_name] varchar(255)
    );

	--creation de table contribution
	CREATE TABLE [contribution] (
      [countrubition_id] INT IDENTITY(1,1) PRIMARY KEY,
      [contrubitor_name] varchar(255)
    );

	--creation de table owner
    CREATE TABLE [owner] (
      [owner_id] INT IDENTITY(1,1) PRIMARY KEY,
      [owner_name] varchar(50),
      [owner_type] varchar(50)
    );

	--creation de table repository
    CREATE TABLE [repository] (
      [id] int,
      [full_name] varchar(255),
      [name] varchar(100),
      [url] varchar(150),
      [description] varchar(4000),
      [stars] int,
      [forks] int,
      [open_issues] int,
      [creation_date] datetime,
      [update] datetime,
      [push] datetime,
      [size] int,
      [score] float,
      [owner_id] int,
      [licence_id] int,
      [language_id] int,
      PRIMARY KEY ([id]),
      CONSTRAINT [FK_repository.owner_id]
        FOREIGN KEY ([owner_id])
          REFERENCES [owner]([owner_id]),
      CONSTRAINT [FK_repository.language_id]
        FOREIGN KEY ([language_id])
          REFERENCES [language]([language_id]),
      CONSTRAINT [FK_repository.licence_id]
        FOREIGN KEY ([licence_id])
          REFERENCES [licence]([licence_id])
    );

	--creation de table topics
    CREATE TABLE [topics] (
      [topic_id] INT IDENTITY(1,1) PRIMARY KEY,
      [topic_name] varchar(100)
    );

	--creation de table repo-contrubition
    CREATE TABLE [repo-contrubition] (
      [repository_id] int,
      [contrubition_id] int,
      [number_of_contrubitions] int,
      CONSTRAINT [FK_repo-contrubition.contrubition_id]
        FOREIGN KEY ([contrubition_id])
          REFERENCES [contribution]([countrubition_id]),
      CONSTRAINT [FK_repo-contrubition.repository_id]
        FOREIGN KEY ([repository_id])
          REFERENCES [repository]([id])
    );


	--creation de table repo-topic
    CREATE TABLE [repo-topic] (
      [topic_id] int,
      [repository_id] int,
      CONSTRAINT [FK_repo-topic.repository_id]
        FOREIGN KEY ([repository_id])
          REFERENCES [repository]([id]),
      CONSTRAINT [FK_repo-topic.topic_id]
        FOREIGN KEY ([topic_id])
          REFERENCES [topics]([topic_id])
    );



CREATE INDEX ownerIndex on "owner" ("owner_name")

CREATE INDEX topicsIndex on "topics" ("topic_name")

CREATE INDEX repoIndex on repository ("id")

CREATE INDEX licenseIndex on licence ("licence_name")

CREATE INDEX contributorIndex on contribution ("contrubitor_name")




-- query to select all repositories where stars > 10000 AND forks > 100
SELECT [id]
      ,[name]
      ,[description]
      ,[stars]
      ,[forks]
      ,[owner_id]
      ,[licence_id]
      ,[language_id]
FROM repository
WHERE stars > 10000 AND forks > 100
ORDER BY stars DESC;
















