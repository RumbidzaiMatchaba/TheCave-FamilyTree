Create Proc spAuthenticateUser
@UserEmailAddress nvarchar (100),
@Password nvarchar (100)
as
Begin
Declare @Count int
Select @Count = COUNT(EmailAddress) from Member
where [EmailAddress] = @UserEmailAddress and [Password] = @Password
if(@Count = 1)
Begin
	Select 1 as ReturnCode  --successfully authenticated
	END
Else
Begin
	Select -1 as ReturnCode
	End
	END