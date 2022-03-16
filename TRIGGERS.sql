-- Print USER table after INSERT user to the table

CREATE TRIGGER studentListele on [USER]
AFTER INSERT
AS
BEGIN
SELECT * FROM [USER]
END

-- User cannot send messages to himself/herself

CREATE TRIGGER kendineMesaj on MESSAGE
AFTER INSERT
AS
BEGIN
IF(exists(select * from inserted where inserted.SenderID = inserted.ReceiverID))
BEGIN
	raiserror('Kullanıcı kendisine mesaj atamaz!',1,1)
	rollback transaction
	end
END

-- INSERT INTO[MESSAGE] (SenderID, ReceiverID, Msg_date, Msg_text) VALUES (1, 1, '01-01-2021', 'kendime mesaj')



-- User cannot connect to himself/herself

CREATE TRIGGER kendisiyleBaglanti on CONNECT
AFTER INSERT
AS
BEGIN
IF(exists(select * from inserted where inserted.Member_id1 = inserted.Member_id2))
BEGIN
	raiserror('Kullanıcı kendisiyle bağlantı kuramaz!',1,1)
	rollback transaction
	end
END