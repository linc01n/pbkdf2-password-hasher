pbkdf2-password-hasher
======================

# This gem is still under development. Check again in a few days for something that actually works ;)

Check a password against a pbkdf2 hashed string. Useful to import password hashes from django application to rails/devise application

## Installation

In your Gemfile : 
```ruby
gem pbkdf2_password_hasher, git: 'aherve/pbkdf2-password-hasher'
```

## Usage

- Hash a password with salt:
```ruby
salt = 'NaCl'
pass = 's3cr3t'
it   = 12000
Pbkdf2PasswordHasher.has_password(pass,salt,it) #=> 
```
- Check password validity against string

```ruby
hsh ='pbkdf2_sha256$12000$PEnXGf9dviXF$2soDhu1WB8NSbFDm0w6NEe6OvslVXtiyf4VMiiy9rH0='
pass = 'bite'
Pbkdf2PasswordHasher.check_password(pass,hsh) #=> true
Pbkdf2PasswordHasher.check_password('wrong_pass',hsh) #=> false
```