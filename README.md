#MAKERSBNB

#####Authors
- Alain Lemaire ([jaxdid](https://github.com/jaxdid))
- Iryna Howarth ([irynahowarth](https://github.com/irynahowarth))
- Rebecca Piper ([RPiper93](https://github.com/RPiper93))
- Russell Vaughan ([russellvaughan](https://github.com/russellvaughan))
- Tom Pickard ([tcpickard94](https://github.com/tcpickard94))

###Description
Online, account based platform for listing, viewing and booking 'spaces'. Users can sign-up to the site, receiving a confirmation email upon doing so, and are automatically logged in to the platform. Signed in users can view all currently listed spaces, with the option to filter them by availability. Users can also list their own spaces and provide: name, description, price, availability as well as uploading a photo. They can update listings they have already made. Users can make booking requests for spaces subject to availability. The owner of the space can confirm requests, upon doing so automatically denying other requests with clashing dates.

###Screenshots

![Image of Sign Up Page]
(http://i.imgur.com/KW5WPBJ.png)

![Image of Sign In Page]
(http://i.imgur.com/0LNrNUU.png)

![Image of Space Listing Page]
(http://i.imgur.com/2dWKsqr.png)

![Image of Space Page]
(http://i.imgur.com/keMmnhP.png)

###Instructions
To deploy local version
```
$ git clone https://github.com/RPiper93/makers_bnb.git
$ cd makers_bnb
$ bundle # Installs all dependencies
$ rackup # Runs the application locally
```

To access live site: https://makers-bnb.herokuapp.com

###Technologies
- Ruby
- Javascript
- jQuery
- Sinatra
- DataMapper
- Cloudinary 
- Bcrypt
- Rspec
- Capybara
- Database Cleaner
- Rake

###Known Issues
- Incomplete styling(requests/confirm requests view)
- Requests cannot be deleted by the requester
- Spaces cannot be removed by the owner
- User account details cannot be updated
- Not responsive 
- Email/Image upload tests are not stubbed
- Users cannot view requests they have made
 
###Implemented User Stories
```
As a user
So that I can post spaces
I want to be able to sign-up
```

```
As a User
So that I can advertise
I want to be able to create a space
```

```
As a user
So that I can list all of my property's
I want to be able to create multiple spaces
```

```
As a user
So that I can book spaces or list spaces
I want to be able to sign-in
```

```
As a user
So that I can identify my property's
I want to be able to give each space a name
```

```
As a user
So that I can list my property's features,
I want to be able to provide a short description
```

```
As a user
So that I can put a value on my space
I want to be able to list the price per night
```

```
As a user
So that I can end my Makers BNB session
I want to be able to sign-out
```

```
As a user
So I can show when my space is free
I want to input a range of dates
```

```
As a user
So that I can make changes to my listing
I want to be able to update my space
```

```
As a user
So that I can make a booking
I want to submit a request
```

```
As a user
So that I can only see spaces available on the dates I am
I want to be able to filter spaces by date
```

```
As a user
So that I can confirm a booking
I can approve a request
```

```
As a user
So that I can be notified that my sign-up has been successful
I want to receive a notification email
```

```
As a user
So that I can entertain multiple offers
I want to be able to receive multiple booking requests until one is confirmed
```
