# LicenceToBill

A simple Ruby wrapper to easily interact with the [LicenceToBill API](https://api.licencetobill.com/?lcid=12).

## Installation

```ruby
gem 'licencetobill'
```
or 

```ruby
gem install licencetobill
```

To install the latest dev version

```ruby
gem 'licencetobill', git: "git://github.com/gtroppee/licencetobill.git"
```

## Setup
The only thing you need to provide is you LicenceToBill credentials. In the context of a Rails app, the best way to do so is to simply create a initializer for it:

```ruby
# config/initializers/licencetobill.rb
LicenceToBill.configure do |config|
  config.business_key = 'your_business_key'
  config.agent_key    = 'your_agent_key'
end
```

## Use cases
To start using the gem, just proceed like so:

* Provided your credentials are loaded
```ruby
@api = LicenceToBill::API.new
```

* Or if you want to load your credentials upon instantiation
```ruby
# config/initializers/licencetobill.rb
@api = LicenceToBill::API.new('your_business_key', 'your_agent_key')
```

Then, simply use the object to interact with the platform:
```ruby
@offers = @api.get_offers
```

Here is a quick inventory of the methods at your disposal (per resource):

#### USERS

```ruby
get_users
#=> Get all the registered users

get_user(key_user)
#=> Get a single registered user

get_users_for(key_feature)
#=> Get the registered user that have access to a specific feature

get_billing_address_for(key_user)
#=> Get the registered address for a specific user

register_user(key_user, name_user)
#=> Register the user to LicenceToBill.
# Note: . LicenceToBill gives you the liberty to give any key you want when you register the user. Just make sure this is and will remain unique for each user.
```

#### OFFERS

```ruby
get_offers(lcid = nil)
#=> Get all the offers (language optional)

get_offers_for(key_user)
#=> Get all the offers for a specific user (with a redirection url if you choose to host the offers page directly in your app)

get_stages
#=> Get all the stages for a specific offer (of course you'll need to send this message to an offer object = @offer.get_stages)
```

#### FEATURES
```ruby
get_features(lcid = nil)
#=> Get all the features

get_features_for(key_user)
#=> Get the features a specific user has access to

get_features_details_for(key_feature, key_user)
#=> Get details of a specific feature for a specific user
```
#### DEALS
```ruby
get_deals_for(key_user)
#=> Get the deals of a specific user

add_trial_for(key_user)
#=> Create a trial offer for a specific user
```

#### STAGES
```ruby
get_features
#=> Get the features of a specific stage (of course you'll need to send this message to a stage object = @stage.get_features)
```

Of course, you'll find all the information you need [here](https://api.licencetobill.com/?lcid=12).

## Customisation
This gem is only aiming at making it easier to read and write data from and to LicenceToBill, but if you want more flexibility/logic to it, you can easily add extra behaviour, like so:

```ruby
require 'licencetobill'

LicenceToBill::Deal.class_eval do
  
  # Make the end date independent from the fact that the deal can be renewed or not
  def end_date
    if respond_to?(:date_renewal)
      date_renewal
    elsif respond_to?(:date_end)
      date_end
    end
  end

  def price
    self.amount.to_i / 100
  end

end
```
All LicenceToBill resources have their own corresponding classes so you can basically add any behaviour you want for your app. Just FYI, the current resources are:

* Users
* Offers
* Features
* Stages
* Deals
* UserAddress (this one is not a resource per say, but being able to customise it as well might come in handy)


## Contribution
Contribution are more than welcome, be sure to add relevant unit tests and pass them all before submitting any code.

